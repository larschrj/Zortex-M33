const registers: *align(1) volatile Registers = @ptrFromInt(0x0f);

const Hts221 = @This();

pub const Registers = packed struct {
    who_am_i: u8 = 0b10111100,
    av_conf: Av_conf = @bitCast(@as(u8, 0xb1)),
    _reserved0: u32,
    _reserved1: u32,
    _reserved2: u32,
    _reserved3: u16,
    _reserved4: u8,
    ctrl_reg1: Ctrl_reg1 = @bitCast(@as(u8, 0)),
    ctrl_reg2: Ctrl_reg2 = @bitCast(@as(u8, 0)),
    ctrl_reg3: Ctrl_reg3 = @bitCast(@as(u8, 0)),
    _reserved5: u32,
    status_reg: Status_reg = @bitCast(@as(u8, 0)),
    humidity_out: u16,
    temp_out: u16,
    _reserved6: u32,
    calib: Calib,

    pub const Av_conf = packed struct(u8) {
        avgh: Avgh,
        avgt: Avgt,
        _reserved0: u2,

        pub const Avgh = enum(u3) {
            @"4" = 0b000,
            @"8" = 0b001,
            @"16" = 0b010,
            @"32" = 0b011,
            @"64" = 0b100,
            @"128" = 0b101,
            @"256" = 0b110,
            @"512" = 0b111,
        };

        pub const Avgt = enum(u3) {
            @"2" = 0b000,
            @"4" = 0b001,
            @"8" = 0b010,
            @"16" = 0b011,
            @"32" = 0b100,
            @"64" = 0b101,
            @"128" = 0b110,
            @"256" = 0b111,
        };
    };

    pub const Ctrl_reg1 = packed struct(u8) {
        odr: Odr = .oneshot,
        bdu: Bdu = .continuous_update,
        _reserved0: u4 = 0,
        pd: Pd = .off,

        pub const Odr = enum(u2) {
            oneshot = 0b00,
            @"1Hz" = 0b01,
            @"7Hz" = 0b10,
            @"12.5Hz" = 0b11,
        };

        pub const Bdu = enum(u1) {
            continuous_update = 0b0,
            msb_lsb_read = 0b1,
        };

        pub const Pd = enum(u1) {
            off = 0b0,
            on = 0b1,
        };
    };

    pub const Ctrl_reg2 = packed struct(u8) {
        oneshot: Oneshot = .waiting,
        heater: Heater = .disable,
        _reserved0: u5 = 0,
        boot: Boot = .normal,

        pub const Oneshot = enum(u1) {
            waiting = 0b0,
            start = 0b1,
        };

        pub const Heater = enum(u1) {
            disable = 0b0,
            enable = 0b1,
        };

        pub const Boot = enum(u1) {
            normal = 0b0,
            reboot = 0b1,
        };
    };

    pub const Ctrl_reg3 = packed struct(u8) {
        _reserved0: u2 = 0,
        drdy: Drdy = .dataready_disable,
        _reserved1: u3 = 0,
        pp_od: Pp_od = .pushpull,
        drdy_h_l: Drdy_h_l = .active_high,

        pub const Drdy = enum(u1) {
            dataready_disable = 0b0,
            dataready_enable = 0b1,
        };

        pub const Pp_od = enum(u1) {
            pushpull = 0b0,
            opendrain = 0b1,
        };

        pub const Drdy_h_l = enum(u1) {
            active_high = 0b0,
            active_low = 0b1,
        };
    };

    pub const Status_reg = packed struct(u8) {
        t_da: Da,
        h_da: Da,
        _reserved0: u6,

        pub const Da = enum(u1) {
            olddata = 0b0,
            newdata = 0b1,
        };
    };

    pub const Calib = packed struct {
        h0_rH_x2: u8,
        h1_rH_x2: u8,
        t0_degC_x8: u8,
        t1_degC_x8: u8,
        _reserved0: u8,
        t1t0_msb: T0T1_msb,
        h0_t0_out: i16,
        _reserved1: u16,
        h1_t0_out: i16,
        t0_out: i16,
        t1_out: i16,

        pub const T0T1_msb = packed struct(u8) {
            t0_msb: u2,
            t1_msb: u2,
            _reserved0: u4,
        };
    };
};

pub const Adc = packed struct(u32) {
    h_out: i16,
    t_out: i16,
};

pub const Sensor = struct {
    humidity: i32 = 0,
    temperature: i32 = 0,
};

pub const I2c_addr = enum(u8) {
    @"0x5f" = 0x5f,
};

const Hts221ReadFunc = ?*const fn (register_address: u8, register_data: []u8) void;
const Hts221WriteFunc = ?*const fn (register_address: u8, register_data: []u8) void;

addr: u8 = undefined,
read_func: Hts221ReadFunc = null,
write_func: Hts221WriteFunc = null,
calib: Registers.Calib = undefined,
t0_degC_x8: i32 = undefined,
t1_degC_x8: i32 = undefined,
adc: Adc = undefined,

pub fn readCalibration(self: *Hts221) void {
    var buffer: [6]u8 = undefined;

    // Id
    self.read_func.?(@intFromPtr(&registers.who_am_i), buffer[0..1]);

    // h0_rH_x2 -> t1_degC_x8
    // Set msb of register address to activate auto increment
    self.read_func.?(@intFromPtr(&registers.calib.h0_rH_x2) | 0x80, buffer[0..4]);
    self.calib.h0_rH_x2 = buffer[0];
    self.calib.h1_rH_x2 = buffer[1];
    self.calib.t0_degC_x8 = buffer[2];
    self.calib.t1_degC_x8 = buffer[3];

    // T1/T0 msb -> h0_t0_out
    self.read_func.?(@intFromPtr(&registers.calib.t1t0_msb) | 0x80, buffer[0..3]);
    self.calib.t1t0_msb = @bitCast(buffer[0]);
    self.calib.h0_t0_out = (@as(i16, buffer[2]) << 8) & @as(i16, buffer[1]);

    // h1_t0_out -> t1_out
    self.read_func.?(@intFromPtr(&registers.calib.h1_t0_out) | 0x80, buffer[0..6]);
    self.calib.h1_t0_out = (@as(i16, buffer[1]) << 8) & @as(i16, buffer[0]);
    self.calib.t0_out = (@as(i16, buffer[3]) << 8) & @as(i16, buffer[2]);
    self.calib.t1_out = (@as(i16, buffer[5]) << 8) & @as(i16, buffer[4]);

    //
    self.t0_degC_x8 = @bitCast(@as(u32, self.calib.t0_degC_x8) & (@as(u32, self.calib.t1t0_msb.t0_msb) << 8));
    self.t1_degC_x8 = @bitCast(@as(u32, self.calib.t1_degC_x8) & (@as(u32, self.calib.t1t0_msb.t1_msb) << 8));
}

pub fn initSensor(self: *Hts221, data_rate: Registers.Ctrl_reg1.Odr) void {
    const ctrl_reg1: Registers.Ctrl_reg1 = .{
        .odr = data_rate,
        .bdu = .msb_lsb_read,
        .pd = .on,
    };
    var buffer: [1]u8 = @bitCast(ctrl_reg1);
    self.write_func.?(@intFromPtr(&registers.ctrl_reg1), buffer[0..1]);
}

pub fn getAdc(self: *Hts221) void {
    var buffer: [4]u8 = undefined;
    self.read_func.?(@intFromPtr(&registers.humidity_out) | 0x80, buffer[0..4]);
    self.adc = @bitCast(buffer);
}

// Temperature in degC
// Return value = temperature*8. A return value of 80 = 10 degC.
pub fn temperature(self: *Hts221) i32 {
    const t_out = @as(i32, self.adc.t_out);
    const t0_out = @as(i32, self.calib.t0_out);
    const t1_out = @as(i32, self.calib.t1_out);
    const t0_degC_x8 = @as(i32, self.t0_degC_x8);
    const t1_degC_x8 = @as(i32, self.t1_degC_x8);

    var temp: i32 = t_out - t0_out;
    temp = temp *| (t1_degC_x8 - t0_degC_x8);
    temp = temp / (t1_out - t0_out);
    temp = temp +| t0_degC_x8;
    return temp;
}

// Relative humidity in %
// Return value = humidity*2. A return value of 40 = 20 %RH
pub fn humidity(self: *Hts221) i32 {
    const h_out = @as(i32, self.adc.h_out);
    const h0_t0_out = @as(i32, self.calib.h0_t0_out);
    const h1_t0_out = @as(i32, self.calib.h1_t0_out);
    const h0_rH_x2 = @as(i32, self.calib.h0_rH_x2);
    const h1_rH_x2 = @as(i32, self.calib.h1_rH_x2);

    var hum: i32 = (h_out - h0_t0_out);
    hum = hum *| (h1_rH_x2 - h0_rH_x2);
    hum = hum / (h1_t0_out - h0_t0_out);
    hum = hum + h0_rH_x2;
    return hum;
}

// Sensor temperature and humidity
// Temperature in degC. Return value = temperature*8
// Relative humidity in %. Return value = humidity*2
pub fn getSensor(self: *Hts221) Sensor {
    var sensor: Sensor = undefined;
    self.getAdc();
    sensor.temperature = self.temperature();
    sensor.humidity = self.humidity();
    return sensor;
}

test "HTS221 last register address" {
    const std = @import("std");

    std.debug.print("@offsetOf(Registers, \"calib\") = {x}\n", .{@offsetOf(Registers, "calib")});
    try std.testing.expect(@offsetOf(Registers, "calib") == 0x21);
}
