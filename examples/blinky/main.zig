const core_cm33 = @import("stm32u585xx").core_cm33;
const rcc = @import("stm32u585xx").rcc;
const gpio = @import("stm32u585xx").gpio;

pub fn main() void {
    core_cm33.enableIrq();
    clockConfig();
    gpioConfig();
    sysTickConfig();

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

    rcc.ahb2enr1.gpiohen = .enable;
}

fn gpioConfig() void {
    gpio.gpioh.moder.moder6 = .output;
    gpio.gpioh.otyper.ot6 = .push_pull;
    gpio.gpioh.pupdr.pupdr6 = .no_pullup_pulldown;
    gpio.gpioh.odr.odr6 = 0b0;

    gpio.gpioh.moder.moder7 = .output;
    gpio.gpioh.otyper.ot7 = .push_pull;
    gpio.gpioh.pupdr.pupdr7 = .no_pullup_pulldown;
    gpio.gpioh.odr.odr7 = 0b1;
}

fn sysTickConfig() void {
    core_cm33.systick.load = 499_999;
    core_cm33.systick.val = 499_999;
    core_cm33.systick.ctrl.clkSource = .ahbDivide8;
    core_cm33.systick.ctrl.tickInt = .exceptionReqEnable;
    core_cm33.systick.ctrl.enable = .enable;
}
