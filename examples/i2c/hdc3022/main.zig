const std = @import("std");
const core_cm33 = @import("stm32u585xx").core_cm33;
const rcc = @import("stm32u585xx").rcc;
const gpioa = @import("stm32u585xx").gpioa;
const gpiob = @import("stm32u585xx").gpiob;
const gpioh = @import("stm32u585xx").gpioh;
const i2c1 = @import("stm32u585xx").i2c1;
const usart1 = @import("stm32u585xx").usart1;
const I2c = @import("stm32u585xx").I2c;
const Hdc3022 = @import("Hdc3022");

fn hdc3022Read(target_address: u10, receive_buffer: []u8, start: bool, stop: bool, reload: bool) Hdc3022.Error!void {
    try i2c1.readPolling(target_address, receive_buffer, start, stop, reload);
}

fn hdc3022Write(target_address: u10, transmit_buffer: []const u8, start: bool, stop: bool, reload: bool) Hdc3022.Error!void {
    try i2c1.writePolling(target_address, transmit_buffer, start, stop, reload);
}

pub fn main() noreturn {
    clockConfig();
    gpioConfig();
    i2c1Config();
    usart1Config();

    var hdc3022: Hdc3022 = .{
        .addr = 0x44,
        .read_func = &hdc3022Read,
        .write_func = &hdc3022Write,
    };
    var sensor: Hdc3022.Sensor = undefined;
    hdc3022.setMode(.auto_10Hz, .low_power_mode_0) catch unreachable;

    systickConfig();
    while (true) {
        sensor = hdc3022.getSensor() catch Hdc3022.Sensor{ .temp = @bitCast(@as(u32, 0xffffffff)), .humidity = 0xffffffff };
    }
}

pub fn clockConfig() void {
    // hsi enable
    rcc.cr.hsion = .on;

    // enable msi clocks
    rcc.cr.msison = .on;
    rcc.cr.msikon = .on;

    // wait for clocks to be ready
    while (rcc.cr.hsirdy == .notReady) {}
    while (rcc.cr.msisrdy == .notReady) {}
    while (rcc.cr.msikrdy == .notReady) {}

    // msis and msik range
    rcc.icscr1.msisrange = .@"4MHz";
    rcc.icscr1.msikrange = .@"4MHz";
    rcc.icscr1.msirgsel = .icscr1;

    // sysclk clock = msis = 4 MHz
    rcc.cfgr1.sw = .msis;
    while (rcc.cfgr1.sws != .msis) {}

    // ahb clock = sysclk = 4 MHz
    rcc.cfgr2.hpre = .div1;

    // systick clock = ahb/8 = 500 kHz
    rcc.ccipr1.systicksel = .hclkdiv8;

    // gpio clocks
    rcc.ahb2enr1.gpioaen = .enable; // usart1
    rcc.ahb2enr1.gpioben = .enable; // i2c1
    rcc.ahb2enr1.gpiohen = .enable; // leds

    // apb1 clock = ahb = 4 MHz
    rcc.cfgr2.ppre1 = .div1;
    // apb2 clock = ahb = 4 MHz
    rcc.cfgr2.ppre2 = .div1;

    // i2c1 clock = apb1 = 4 MHz
    rcc.ccipr1.i2c1sel = .pclk1;
    rcc.apb1enr1.i2c1en = .enable;

    // usart1 clock = apb2 = 4 MHz
    rcc.ccipr1.usart1sel = .pclk2;
    rcc.apb2enr.usart1en = .enable;
}

fn gpioConfig() void {
    // usart1 tx
    gpioa.moder.p9 = .alternate_function;
    gpioa.afr.p9 = .usart1_tx;
    gpioa.ospeedr.p9 = .very_high;
    gpioa.otyper.p9 = .push_pull;
    // usart1 rx
    gpioa.moder.p10 = .alternate_function;
    gpioa.afr.p10 = .usart1_rx;
    gpioa.pupdr.p10 = .pullup;

    // i2c1 scl
    gpiob.moder.p8 = .alternate_function;
    gpiob.afr.p8 = .i2c1_scl;
    gpiob.otyper.p8 = .open_drain;
    gpiob.ospeedr.p8 = .very_high;
    // i2c1 sda
    gpiob.moder.p9 = .alternate_function;
    gpiob.afr.p9 = .i2c1_sda;
    gpiob.otyper.p9 = .open_drain;
    gpiob.ospeedr.p9 = .very_high;

    // red led
    gpioh.moder.p6 = .output;
    gpioh.ospeedr.p6 = .low;
    gpioh.otyper.p6 = .push_pull;
    gpioh.odr.p6 = 0;

    // green led
    gpioh.moder.p7 = .output;
    gpioh.ospeedr.p7 = .low;
    gpioh.otyper.p7 = .push_pull;
    gpioh.odr.p7 = 1;
}

fn i2c1Config() void {
    // disable i2c for configuration
    i2c1.cr1.pe = .peripherial_disable;
    while (i2c1.cr1.pe != .peripherial_disable) {}

    // filters
    i2c1.cr1.anfoff = .analog_noise_filter_enabled;
    i2c1.cr1.dnf = 0;

    // clock
    var timing = i2c1.timingr;
    timing.presc = 3; // t_presc = (presc + 1)*t_i2cclk = 1 us
    timing.scll = 39; // t_scll = (scll + 1)*t_presc = 40 us
    timing.sclh = 39; // t_sclh = (sclh + 1)*t_presc = 40 us
    timing.scldel = 3; // t_scldel = (scldel + 1)*t_presc = 1 us
    timing.sdadel = 4; // t_sdadel = sdadel*t_presc = 1 us
    i2c1.timingr = timing;

    // nostretch enabled in controller mode
    i2c1.cr1.nostretch = .clock_stretch_enable;

    // address mode
    i2c1.cr2.add10 = .address_mode_7bit;

    // enable i2c
    i2c1.cr1.pe = .peripheral_enable;
    while (i2c1.cr1.pe != .peripheral_enable) {}
}

fn systickConfig() void {
    core_cm33.systick.ctrl.enable = .disable;
    core_cm33.systick.ctrl.clkSource = .ahbDivide8;
    core_cm33.systick.load = 499_999;
    core_cm33.systick.val = 499_999;
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

    // No parity
    usart1.cr1.pce = .disable;

    // 1 stop bit
    usart1.cr2.stop = .@"1bit";

    // Enable usart1
    usart1.cr1.ue = .enable;
    while (usart1.cr1.ue != .enable) {}
}
