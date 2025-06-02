const core_cm33 = @import("stm32u585xx").core_cm33;
export const rcc = @import("stm32u585xx").rcc;
export const gpioh = @import("stm32u585xx").gpioh;
export const i2c2 = @import("stm32u585xx").i2c2;

export var hts221_t_out: [2]u8 = .{ 0, 1 };
export var hts221_h_out: [2]u8 = .{ 0, 1 };
export var hts221_address: u8 = 0xbe;
export var hts221_calibration: [13]u8 = undefined;
export var hts221_T0_degC: u16 = undefined;
export var hts221_T1_degC: u16 = undefined;
export var hts221_T0_out: i16 = undefined;
export var hts221_T1_out: i16 = undefined;
export var temp: i32 = undefined;

pub fn main() void {
    core_cm33.enableIrq();
    clockConfig();
    gpioConfig();
    i2c2Config();
    sysTickConfig();

    // read calibration
    hts221_calibration[0] = i2c2.readPolling(hts221_address, 0x30);
    hts221_calibration[1] = i2c2.readPolling(hts221_address, 0x31);
    hts221_calibration[2] = i2c2.readPolling(hts221_address, 0x32);
    hts221_calibration[3] = i2c2.readPolling(hts221_address, 0x33);
    hts221_calibration[4] = i2c2.readPolling(hts221_address, 0x35);
    hts221_calibration[5] = i2c2.readPolling(hts221_address, 0x36);
    hts221_calibration[6] = i2c2.readPolling(hts221_address, 0x37);
    hts221_calibration[7] = i2c2.readPolling(hts221_address, 0x3a);
    hts221_calibration[8] = i2c2.readPolling(hts221_address, 0x3b);
    hts221_calibration[9] = i2c2.readPolling(hts221_address, 0x3c);
    hts221_calibration[10] = i2c2.readPolling(hts221_address, 0x3d);
    hts221_calibration[11] = i2c2.readPolling(hts221_address, 0x3e);
    hts221_calibration[12] = i2c2.readPolling(hts221_address, 0x3f);

    // temp calibration
    hts221_T0_degC = @intCast((@as(u16, hts221_calibration[4] & 0x3) << 8) | @as(u16, hts221_calibration[2]));
    hts221_T0_degC = @divFloor(hts221_T0_degC, 8);
    hts221_T1_degC = @intCast((@as(u16, hts221_calibration[4] & 0xc) << 6) | @as(u16, hts221_calibration[3]));
    hts221_T1_degC = @divFloor(hts221_T1_degC, 8);
    hts221_T0_out = @intCast(@as(i16, hts221_calibration[9]) | @as(i16, hts221_calibration[10]) << 8);
    hts221_T1_out = @intCast(@as(i16, hts221_calibration[11]) | @as(i16, hts221_calibration[12]) << 8);

    // turn on, 12.5 Hz, block data update
    i2c2.writePolling(hts221_address, 0x20, 0x87);
    // Heater off, reboot cal memory
    i2c2.writePolling(hts221_address, 0x21, 0x0);

    while (true) {
        // read status
        const status: u8 = i2c2.readPolling(hts221_address, 0x27);

        if ((status & 0x1) > 0) {
            // read T_out
            hts221_t_out[0] = i2c2.readPolling(hts221_address, 0x2a);
            hts221_t_out[1] = i2c2.readPolling(hts221_address, 0x2b);
        }
        if ((status & 0x2) > 0) {
            hts221_h_out[0] = i2c2.readPolling(hts221_address, 0x28);
            hts221_h_out[1] = i2c2.readPolling(hts221_address, 0x29);
        }
    }
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
    rcc.ahb2enr1.gpiohen = .enable;

    // systick clock = hclk/8 = 500 kHz
    rcc.ccipr1.systicksel = .hclkdiv8;

    // I2C2 clock, use pclk = hclk/1 = 4 MHz
    rcc.cfgr2.ppre1 = .div1;
    rcc.ccipr1.i2c2sel = .pclk1;
    rcc.apb1enr1.i2c2en = .enable;
    rcc.apb1rstr1.i2c1rst = .resetClock;
    rcc.apb1rstr1.i2c1rst = .noClockReset;
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

    // i2c2 for mems/sensors
    gpioh.moder.p4 = .alternate_function;
    gpioh.afr.p4 = .i2c2_scl;
    gpioh.otyper.p4 = .open_drain;
    gpioh.pupdr.p4 = .pullup;
    gpioh.ospeedr.p4 = .very_high;

    gpioh.moder.p5 = .alternate_function;
    gpioh.afr.p5 = .i2c2_sda;
    gpioh.otyper.p5 = .open_drain;
    gpioh.pupdr.p5 = .pullup;
    gpioh.ospeedr.p5 = .very_high;
}

fn i2c2Config() void {
    // disable i2c for configuration
    i2c2.cr1.pe = .peripherial_disable;
    while (i2c2.cr1.pe != .peripherial_disable) {}

    // filters
    i2c2.cr1.anfoff = .analog_noise_filter_enabled;
    i2c2.cr1.dnf = 0;

    // clock
    var timing = i2c2.timingr;
    timing.presc = 3; // t_presc = (presc + 1)*t_i2cclk = 1 us
    timing.scll = 39; // t_scll = (scll + 1)*t_presc = 40 us
    timing.sclh = 39; // t_sclh = (sclh + 1)*t_presc = 40 us
    timing.scldel = 0; // t_scldel = (scldel + 1)*t_presc = 1 us
    timing.sdadel = 1; // t_sdadel = sdadel*t_presc = 1 us
    i2c2.timingr = timing;

    // nostretch enabled in controller mode
    i2c2.cr1.nostretch = .clock_stretch_enable;

    // address mode
    i2c2.cr2.add10 = .address_mode_7bit;

    // enable i2c
    i2c2.cr1.pe = .peripheral_enable;
    while (i2c2.cr1.pe != .peripheral_enable) {}
}

fn sysTickConfig() void {
    core_cm33.systick.load = 499_999;
    core_cm33.systick.val = 499_999;
    core_cm33.systick.ctrl.clkSource = .ahbDivide8;
    core_cm33.systick.ctrl.tickInt = .exceptionReqEnable;
    core_cm33.systick.ctrl.enable = .enable;
}
