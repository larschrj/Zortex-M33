const std = @import("std");
const core_cm33 = @import("stm32u585xx").core_cm33;
export const rcc = @import("stm32u585xx").rcc;
export const gpioa = @import("stm32u585xx").gpioa;
export const gpioh = @import("stm32u585xx").gpioh;
export const usart1 = @import("stm32u585xx").usart1;

pub fn main() void {
    core_cm33.enableIrq();
    clockConfig();
    gpioConfig();
    sysTickConfig();
    usart1Config();

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
    rcc.icscr1.msisrange = .@"4MHz";
    rcc.icscr1.msikrange = .@"4MHz";
    rcc.icscr1.msirgsel = .icscr1;
    rcc.cfgr1.sw = .msis;
    while (rcc.cfgr1.sws != .msis) {}

    // AHB prescaler, hclk = sysclk/1 = 4 MHz
    rcc.cfgr2.hpre = .div1;
    rcc.ahb2enr1.gpioben = .enable;
    rcc.ahb2enr1.gpiohen = .enable;

    // systick clock = hclk/8 = 500 kHz
    rcc.ccipr1.systicksel = .hclkdiv8;

    // APB2 clock = hclk/1 = 4 MHz
    rcc.cfgr2.ppre2 = .div1;

    // usart1 ker clock = sysclk = 4 MHz
    rcc.ccipr1.usart1sel = .sysclk;
    rcc.apb2enr.usart1en = .enable;
}

fn gpioConfig() void {
    // Virtual com port
    gpioa.moder.p9 = .alternate_function;
    gpioa.afr.p9 = .usart1_tx;
    gpioa.otyper.p9 = .push_pull;
    gpioa.pupdr.p9 = .no_pullup_pulldown;
    gpioa.ospeedr.p9 = .high;

    gpioa.moder.p10 = .alternate_function;
    gpioa.afr.p10 = .usart1_rx;
    gpioa.otyper.p10 = .push_pull; // Ignored, reset value
    gpioa.pupdr.p10 = .pullup;
    gpioa.ospeedr.p10 = .low; // Ignored, reset value

    // user leds
    gpioh.moder.p6 = .output;
    gpioh.otyper.p6 = .push_pull;
    gpioh.pupdr.p6 = .no_pullup_pulldown;
    gpioh.odr.p6 = 0b0;

    gpioh.moder.p7 = .output;
    gpioh.otyper.p7 = .push_pull;
    gpioh.pupdr.p7 = .no_pullup_pulldown;
    gpioh.odr.p7 = 0b1;
}

fn sysTickConfig() void {
    core_cm33.systick.load = 499_999;
    core_cm33.systick.val = 499_999;
    core_cm33.systick.ctrl.clkSource = .ahbDivide8;
    core_cm33.systick.ctrl.tickInt = .exceptionReqEnable;
    core_cm33.systick.ctrl.enable = .enable;
}

fn usart1Config() void {
    usart1.cr1.ue = .disable;
    usart1.cr1.over8 = .oversampling16;
    usart1.presc.prescaler = .div1;

    // 9600 baud = usart1_per_ck/brr
    usart1.brr.brr = 416;

    // 8 bit character length
    usart1.cr1.m0 = 0b0;
    usart1.cr1.m1 = 0b0;
}
