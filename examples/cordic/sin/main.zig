const core_cm33 = @import("stm32u585xx").core_cm33;
const rcc = @import("stm32u585xx").rcc;
const Cordic = @import("stm32u585xx").Cordic;
const cordic = @import("stm32u585xx").cordic;

export const x: i16 = 0x7fff; // 0.25 q1.15 format
export const m: i16 = 0x4000; // 0.5 q1.15 format
export var cs16: Cordic.CosSin16Bit = undefined;
export var cs32: Cordic.CosSin32Bit = undefined;
export var chsh16: Cordic.CoshSinh16Bit = undefined;
export var e16: Cordic.Exp16Bit = undefined;

export var a: i32 = undefined;

pub fn main() void {
    core_cm33.enableIrq();
    clockConfig();
    cs16 = cordic.cosSin16Bit(x, m, .iter40);
    chsh16 = cordic.coshSinh16Bit(x, .iter40);
    e16 = cordic.exp16Bit(x, .iter40);

    a = chsh16.cosh.value;

    while (true) {}
}

fn clockConfig() void {
    // hsi = 16 MHz
    rcc.cr.hsion = .on;
    rcc.cr.hsi48on = .on;
    // msis and msik default clock 4 MHz
    rcc.cr.msikon = .on;
    rcc.cr.msison = .on;

    while (rcc.cr.hsirdy == .notReady) {}
    while (rcc.cr.hsi48rdy == .notReady) {}
    while (rcc.cr.msisrdy == .notReady) {}
    while (rcc.cr.msikrdy == .notReady) {}

    // use msis as sysclk (4 MHz)
    rcc.cfgr1.sw = .msis;
    while (rcc.cfgr1.sws != .msis) {}

    // AHB prescaler, hclk = sysclk/1
    rcc.cfgr2.hpre = .div1;

    // systick clock = hclk/8 = 500 kHz
    rcc.ccipr1.systicksel = .hclkdiv8;

    rcc.ahb1enr.cordicen = .enable;
}
