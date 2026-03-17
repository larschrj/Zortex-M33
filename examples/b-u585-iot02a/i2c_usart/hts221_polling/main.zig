const std = @import("std");
const core_cm33 = @import("stm32u585xx").core_cm33;
export const rcc = @import("stm32u585xx").rcc;
export const gpioa = @import("stm32u585xx").gpioa;
export const gpioh = @import("stm32u585xx").gpioh;
export const i2c2 = @import("stm32u585xx").i2c2;
pub const usart1 = @import("stm32u585xx").usart1;
const Hts221 = @import("Hts221");

pub var hts221: Hts221 = .{
    .addr = @intFromEnum(Hts221.I2c_addr.@"0x5f"),
    .read_func = &hts221Read,
    .write_func = &hts221Write,
};

fn hts221Read(register_address: u8, receive_buffer: []u8) void {
    const register_buffer = [_]u8{register_address};
    i2c2.writePolling(hts221.addr, &register_buffer, true, false, false);
    i2c2.readPolling(hts221.addr, receive_buffer, true, true, false);
}

fn hts221Write(register_address: u8, transmit_buffer: []u8) void {
    const register_buffer = [_]u8{register_address};
    i2c2.writePolling(hts221.addr, &register_buffer, true, false, true);
    i2c2.writePolling(hts221.addr, transmit_buffer, false, true, false);
}

pub fn main() void {
    clockConfig();
    gpioConfig();
    i2c2Config();
    usart1Config();
    sysTickConfig();
    hts221.initSensor(.@"1Hz");
    usart1.transmitPolling("HTS221 initialised\r\n");
    core_cm33.enableIrq();
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

    // GPIO clock
    rcc.ahb2enr1.gpioaen = .enable;
    rcc.ahb2enr1.gpiohen = .enable;

    // systick clock = hclk/8 = 500 kHz
    rcc.ccipr1.systicksel = .hclkdiv8;

    // APB1 clock = hclk/1 = 4 MHz
    rcc.cfgr2.ppre1 = .div1;

    // I2C2 clock, use APB1 clock = 4 MHz
    rcc.ccipr1.i2c2sel = .pclk1;
    rcc.apb1enr1.i2c2en = .enable;

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
}

pub fn q32p3ToString(buf: *[14]u8, q32p3: i32) ![]u8 {
    const is_negative = q32p3 < 0;
    const abs_val: u32 = @intCast(if (is_negative) -q32p3 else q32p3);
    const fraction = 125 * (abs_val & 0x7);
    const integer = abs_val >> 3;

    if (is_negative) {
        return std.fmt.bufPrint(buf[0..], "-{d}.{d:0>3}", .{ integer, fraction });
    } else {
        return std.fmt.bufPrint(buf[0..], "{d}.{d:0>3}", .{ integer, fraction });
    }
}

pub fn q32p1ToString(buf: *[14]u8, q32p1: i32) ![]u8 {
    const is_negative = q32p1 < 0;
    const abs_val: u32 = @intCast(if (is_negative) -q32p1 else q32p1);
    const fraction = 5 * (abs_val & 0x1);
    const integer = abs_val >> 1;

    if (is_negative) {
        return std.fmt.bufPrint(buf[0..], "-{d}.{d:0>1}", .{ integer, fraction });
    } else {
        return std.fmt.bufPrint(buf[0..], "{d}.{d:0>1}", .{ integer, fraction });
    }
}
