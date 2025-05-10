const core_cm33 = @import("stm32u585xx").core_cm33;
const rcc = @import("stm32u585xx").rcc;
const Cordic = @import("stm32u585xx").Cordic;
const cordic = @import("stm32u585xx").cordic;

export const x: i16 = 0x2000; // 0.5 q1.15 format
export const m: i16 = 0x4000; // 0.5 q1.15 format
export var y: Cordic.CosSin = undefined;
export var z: Cordic.CoshSinh = undefined;
export var w: Cordic.Exp = undefined;

pub fn main() void {
    core_cm33.enableIrq();
    clockConfig();
    y = cordic.cosSin(x, m, .iter40);
    z = cordic.coshSinh(x, .iter40);
    w = cordic.exp(x, .iter40);

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
