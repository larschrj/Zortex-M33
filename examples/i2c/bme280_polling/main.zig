const core_cm33 = @import("stm32u585xx").core_cm33;
export const rcc = @import("stm32u585xx").rcc;
export const gpiob = @import("stm32u585xx").gpiob;
export const gpioh = @import("stm32u585xx").gpioh;
export const i2c1 = @import("stm32u585xx").i2c1;
const I2c = @import("stm32u585xx").I2c;
const bme280 = @import("bme280");

export var bme280_address: u8 = 0x77;
export var id: u8 = 0;
export var bme280_cal = [_]u8{0} ** 8;

pub fn main() void {
    core_cm33.enableIrq();
    clockConfig();
    gpioConfig();
    i2c1Config();
    sysTickConfig();

    const bme280_0: bme280 = .{ .bme280_read_func = &bme280_read };
    _ = bme280_0;

    id = i2c1.readPolling(bme280_address << 1, 0xd0);
    i2c1.readMultiplePolling(bme280_address << 1, 0x88, &bme280_cal);
    const buff = i2c1.readPolling(bme280_address << 1, @intFromPtr(&bme280.register.hum_msb));

    _ = buff;

    while (true) {}
}

fn bme280_read(target_address: u8, register_address: u8, receive_buffer: []u8) void {
    i2c1.readMultiplePolling(target_address, register_address, receive_buffer);
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

    // I2C1 clock, use pclk = hclk/1 = 4 MHz
    rcc.cfgr2.ppre1 = .div1;
    rcc.ccipr1.i2c1sel = .pclk1;
    rcc.apb1enr1.i2c1en = .enable;
}

fn gpioConfig() void {
    // user leds
    gpioh.moder.p6 = .output;
    gpioh.otyper.p6 = .push_pull;
    gpioh.pupdr.p6 = .no_pullup_pulldown;
    gpioh.odr.p6 = 0b0;

    gpioh.moder.p7 = .output;
    gpioh.otyper.p7 = .push_pull;
    gpioh.pupdr.p7 = .no_pullup_pulldown;
    gpioh.odr.p7 = 0b1;

    // i2c1
    gpiob.moder.p8 = .alternate_function;
    gpiob.afr.p8 = .i2c1_scl;
    gpiob.otyper.p8 = .open_drain;
    gpiob.pupdr.p8 = .pullup;
    gpiob.ospeedr.p8 = .very_high;

    gpiob.moder.p9 = .alternate_function;
    gpiob.afr.p9 = .i2c1_sda;
    gpiob.otyper.p9 = .open_drain;
    gpiob.pupdr.p9 = .pullup;
    gpiob.ospeedr.p9 = .very_high;
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

fn sysTickConfig() void {
    core_cm33.systick.load = 499_999;
    core_cm33.systick.val = 499_999;
    core_cm33.systick.ctrl.clkSource = .ahbDivide8;
    core_cm33.systick.ctrl.tickInt = .exceptionReqEnable;
    core_cm33.systick.ctrl.enable = .enable;
}
