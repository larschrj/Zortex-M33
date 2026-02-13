const registers: *volatile Registers = @ptrFromInt(0x88);

const Bme280 = @This();

pub const Registers = packed struct {
    dig_T1: u16,
    dig_T2: i16,
    dig_T3: i16,
    dig_P1: u16,
    dig_P2: i16,
    dig_P3: i16,
    dig_P4: i16,
    dig_P5: i16,
    dig_P6: i16,
    dig_P7: i16,
    dig_P8: i16,
    dig_P9: i16,
    _reserved0: u8,
    dig_H1: u8,
    _reserved1: u32,
    _reserved2: u32,
    _reserved3: u32,
    _reserved4: u32,
    _reserved5: u32,
    _reserved6: u32,
    _reserved7: u32,
    _reserved8: u32,
    _reserved9: u32,
    _reserved10: u32,
    _reserved11: u32,
    _reserved12: u16,
    id: u8 = 0x60,
    _reserved13: u32,
    _reserved14: u32,
    _reserved15: u32,
    _reserved16: u16,
    _reserved17: u8,
    reset: Reset = .readout,
    dig_H2: i16,
    dig_H3: u8,
    dig_H4: i12,
    dig_H5: i12,
    dig_H6: i8,
    _reserved18: u16,
    _reserved19: u16,
    _reserved20: u16,
    _reserved21: u16,
    _reserved22: u16,
    ctrl_hum: Ctrl_hum,
    status: Status,
    ctrl_meas: Ctrl_meas,
    config: Config,
    _reserved23: u8,
    press_msb: u8 = 0x80,
    press_lsb: u8 = 0x00,
    press_xlsb: Press_xlsb,
    temp_msb: u8 = 0x80,
    temp_lsb: u8 = 0x00,
    temp_xlsb: Temp_xlsb,
    hum_msb: u8 = 0x80,
    hum_lsb: u8 = 0x00,

    pub const Reset = enum(u8) {
        readout = 0x00,
        reset = 0xb6,
    };

    pub const Ctrl_hum = packed struct(u8) {
        osrs_h: Osrs = .skip,
        _reserved0: u5 = 0,
    };

    pub const Status = packed struct(u8) {
        im_update: u1 = 0,
        _reserved0: u2 = 0,
        measuring: u1 = 0,
        _reserved1: u4 = 0,
    };

    pub const Ctrl_meas = packed struct(u8) {
        mode: Mode = .sleep,
        osrs_p: Osrs = .skip,
        osrs_t: Osrs = .skip,

        pub const Mode = enum(u2) {
            sleep = 0b00,
            normal = 0b11,
            forced = 0b01,
        };
    };

    pub const Osrs = enum(u3) {
        skip = 0b000,
        oversample_1 = 0b001,
        oversample_2 = 0b010,
        oversample_4 = 0b011,
        oversample_8 = 0b100,
        oversample_16 = 0b101,
    };

    pub const Config = packed struct(u8) {
        spi3w_en: Spi3w_en = .disable,
        _reserved0: u1 = 0,
        filter: Filter = .off,
        t_sb: T_sb = .@"0.5ms",

        pub const Spi3w_en = enum(u1) {
            disable = 0b0,
            enable = 0b1,
        };

        pub const Filter = enum(u3) {
            off = 0b000,
            @"2" = 0b001,
            @"4" = 0b010,
            @"8" = 0b011,
            @"16" = 0b100,
        };

        pub const T_sb = enum(u3) {
            @"0.5ms" = 0b000,
            @"62.5ms" = 0b001,
            @"125ms" = 0b010,
            @"250ms" = 0b011,
            @"500ms" = 0b100,
            @"1000ms" = 0b101,
            @"10ms" = 0b110,
            @"20ms" = 0b111,
        };
    };

    pub const Press_xlsb = packed struct(u8) {
        _reserved0: u4 = 0,
        press_xlsb: u4 = 0,
    };

    pub const Temp_xlsb = packed struct(u8) {
        _reserved0: u4 = 0,
        temp_xlsb: u4 = 0,
    };
};

pub const Calibration = struct {
    dig_T1: u16 = 0,
    dig_T2: i16 = 0,
    dig_T3: i16 = 0,
    dig_P1: u16 = 0,
    dig_P2: i16 = 0,
    dig_P3: i16 = 0,
    dig_P4: i16 = 0,
    dig_P5: i16 = 0,
    dig_P6: i16 = 0,
    dig_P7: i16 = 0,
    dig_P8: i16 = 0,
    dig_P9: i16 = 0,
    dig_H1: u8 = 0,
    dig_H2: i16 = 0,
    dig_H3: u8 = 0,
    dig_H4: i16 = 0,
    dig_H5: i16 = 0,
    dig_H6: i8 = 0,
};

pub const Adc = packed struct(u64) {
    press_msb: u8 = 0x80,
    press_lsb: u8 = 0x00,
    press_xlsb: Registers.Press_xlsb = .{},
    temp_msb: u8 = 0x80,
    temp_lsb: u8 = 0x00,
    temp_xlsb: Registers.Temp_xlsb = .{},
    hum_msb: u8 = 0x80,
    hum_lsb: u8 = 0x00,
};

pub const I2c_addr = enum(u8) {
    @"0x76" = 0x76,
    @"0x77" = 0x77,
};

const Bme280ReadFunc = ?*const fn (register_address: u8, register_data: []u8) void;

const Bme280WriteFunc = ?*const fn (register_address: u8, register_data: []u8) void;

addr: ?u8 = null,
read_func: Bme280ReadFunc = null,
write_func: Bme280WriteFunc = null,
calibration: Calibration = .{},
adc: Adc = .{},
temp_fine: i32 = 0,

pub fn readCalibration(self: *Bme280) void {
    var buffer: [24]u8 = .{0} ** 24;
    var reg_addr: u8 = 0;

    reg_addr = @intFromPtr(&registers.dig_T1);
    self.read_func.?(reg_addr, buffer[0..24]);
    self.calibration.dig_T1 = (@as(u16, buffer[1]) << 8) | @as(u16, buffer[0]);
    self.calibration.dig_T2 = (@as(i16, buffer[3]) << 8) | @as(i16, buffer[2]);
    self.calibration.dig_T3 = (@as(i16, buffer[5]) << 8) | @as(i16, buffer[4]);
    self.calibration.dig_P1 = (@as(u16, buffer[7]) << 8) | @as(u16, buffer[6]);
    self.calibration.dig_P2 = (@as(i16, buffer[9]) << 8) | @as(i16, buffer[8]);
    self.calibration.dig_P3 = (@as(i16, buffer[11]) << 8) | @as(i16, buffer[10]);
    self.calibration.dig_P4 = (@as(i16, buffer[13]) << 8) | @as(i16, buffer[12]);
    self.calibration.dig_P5 = (@as(i16, buffer[15]) << 8) | @as(i16, buffer[14]);
    self.calibration.dig_P6 = (@as(i16, buffer[17]) << 8) | @as(i16, buffer[16]);
    self.calibration.dig_P7 = (@as(i16, buffer[19]) << 8) | @as(i16, buffer[18]);
    self.calibration.dig_P8 = (@as(i16, buffer[21]) << 8) | @as(i16, buffer[20]);
    self.calibration.dig_P9 = (@as(i16, buffer[23]) << 8) | @as(i16, buffer[22]);

    reg_addr = @intFromPtr(&registers.dig_H1);
    self.read_func.?(reg_addr, buffer[0..1]);
    self.calibration.dig_H1 = buffer[0];

    reg_addr = @intFromPtr(&registers.dig_H2);
    self.read_func.?(reg_addr, buffer[0..7]);
    self.calibration.dig_H2 = (@as(i16, buffer[1]) << 8) | @as(i16, buffer[0]);
    self.calibration.dig_H3 = buffer[2];
    self.calibration.dig_H4 = (@as(i16, buffer[3]) << 4) | (@as(i16, buffer[4]) & 0xf);
    self.calibration.dig_H5 = (@as(i16, buffer[5]) << 4) | ((@as(i16, buffer[4]) & 0xf0) >> 4);
    self.calibration.dig_H6 = @bitCast(buffer[6]);
}

pub fn getCtrlMeas(self: *Bme280) Registers.Ctrl_meas {
    var buffer: [1]u8 = undefined;
    self.read_func.?(@intFromPtr(&registers.ctrl_meas), &buffer);
    const ctrl_meas: Registers.Ctrl_meas = @bitCast(buffer[0]);
    return ctrl_meas;
}

pub fn setCtrlMeas(self: *Bme280, ctrl_meas: Registers.Ctrl_meas) Registers.Ctrl_meas {
    var buffer: [1]u8 = undefined;
    buffer[0] = @bitCast(ctrl_meas);
    self.write_func.?(@intFromPtr(&registers.ctrl_meas), &buffer);
    return getCtrlMeas(self);
}

pub fn getMode(self: *Bme280) Registers.Ctrl_meas.Mode {
    const ctrl_meas = getCtrlMeas(self);
    return ctrl_meas.mode;
}

pub fn setMode(self: *Bme280, mode: Registers.Ctrl_meas.Mode) Registers.Ctrl_meas.Mode {
    var ctrl_meas = getCtrlMeas(self);
    ctrl_meas.mode = mode;
    ctrl_meas = setCtrlMeas(self, ctrl_meas);
    return ctrl_meas.mode;
}

pub fn getTempOversample(self: *Bme280) Registers.Osrs {
    const ctrl_meas = getCtrlMeas(self);
    return ctrl_meas.osrs_t;
}

pub fn setTempOversample(self: *Bme280, osrs: Registers.Osrs) Registers.Osrs {
    var ctrl_meas = getCtrlMeas(self);
    ctrl_meas.osrs_t = osrs;
    ctrl_meas = setCtrlMeas(self, ctrl_meas);
    return ctrl_meas.osrs_t;
}

pub fn getPressOversample(self: *Bme280) Registers.Osrs {
    const ctrl_meas = getCtrlMeas(self);
    return ctrl_meas.osrs_p;
}

pub fn setPressOversample(self: *Bme280, osrs: Registers.Osrs) Registers.Osrs {
    var ctrl_meas = getCtrlMeas(self);
    ctrl_meas.osrs_p = osrs;
    ctrl_meas = setCtrlMeas(self, ctrl_meas);
    return ctrl_meas.osrs_p;
}

pub fn getCtrlHum(self: *Bme280) Registers.Ctrl_hum {
    var buffer: [1]u8 = undefined;
    self.read_func.?(@intFromPtr(&registers.ctrl_hum), &buffer);
    const ctrl_hum: Registers.Ctrl_hum = @bitCast(buffer[0]);
    return ctrl_hum;
}

pub fn setCtrlHum(self: *Bme280, ctrl_hum: Registers.Ctrl_hum) Registers.Ctrl_hum {
    var buffer: [1]u8 = undefined;
    buffer[0] = @bitCast(ctrl_hum);
    self.write_func.?(@intFromPtr(&registers.ctrl_hum), &buffer);
    return getCtrlHum(self);
}

pub fn getHumOversample(self: *Bme280) Registers.Osrs {
    const ctrl_hum = getCtrlHum(self);
    return ctrl_hum.osrs_h;
}

pub fn setHumOversample(self: *Bme280, osrs: Registers.Osrs) Registers.Osrs {
    var ctrl_hum = getCtrlHum(self);
    ctrl_hum.osrs_h = osrs;
    ctrl_hum = setCtrlHum(self, ctrl_hum);
    return ctrl_hum.osrs_h;
}

pub fn setOversample(self: *Bme280, press_osrs: Registers.Osrs, temp_osrs: Registers.Osrs, hum_osrs: Registers.Osrs) [3]Registers.Osrs {
    const h = setHumOversample(self, hum_osrs);
    var ctrl_meas = getCtrlMeas(self);
    ctrl_meas.osrs_p = press_osrs;
    ctrl_meas.osrs_t = temp_osrs;
    ctrl_meas = setCtrlMeas(self, ctrl_meas);

    return .{ ctrl_meas.osrs_p, ctrl_meas.osrs_t, h };
}

pub fn getStatus(self: *Bme280) Registers.Status {
    var buffer: [1]u8 = undefined;
    self.read_func.?(@intFromPtr(&registers.status), &buffer);
    const status: Registers.Status = @bitCast(buffer[0]);
    return status;
}

pub fn getConfig(self: *Bme280) Registers.Config {
    var buffer: [1]u8 = undefined;
    self.read_func.?(@intFromPtr(&registers.config), &buffer);
    const config: Registers.Config = @bitCast(buffer[0]);
    return config;
}

pub fn setConfig(self: *Bme280, config: Registers.Config) Registers.Config {
    var buffer: [1]u8 = @bitCast(config);
    self.write_func.?(@intFromPtr(&registers.config), &buffer);
    return getConfig(self);
}

pub fn getFilter(self: *Bme280) Registers.Config.Filter {
    return getConfig(self).filter;
}

pub fn setFilter(self: *Bme280, filter: Registers.Config.Filter) Registers.Config.Filter {
    var config = getConfig(self);
    config.filter = filter;
    return setConfig(self, config).filter;
}

pub fn getStandbyTime(self: *Bme280) Registers.Config.T_sb {
    return getConfig(self).t_sb;
}

pub fn setStandbyTime(self: *Bme280, standby_time: Registers.Config.T_sb) Registers.Config.T_sb {
    var config = getConfig(self);
    config.t_sb = standby_time;
    return setConfig(self, config).t_sb;
}

pub fn softReset(self: *Bme280) void {
    var buffer: [1]u8 = .{@intFromEnum(Registers.Reset.reset)};
    self.write_func.?(@intFromPtr(&registers.reset), &buffer);
}

pub fn initSensor(self: *Bme280) void {
    self.readCalibration();
    const mode = self.setMode(.normal);
    _ = mode;
    const ovr = self.setOversample(.oversample_1, .oversample_1, .oversample_1);
    _ = ovr;
    const status = self.getStatus();
    _ = status;
}

pub fn getAdc(self: *Bme280) void {
    var buffer: [8]u8 = undefined;
    self.read_func.?(@intFromPtr(&registers.press_msb), &buffer);
    self.adc = @bitCast(buffer);
}

// Temperature in Celcius
// Return value = temperature*100. For example 2054 = 20.54 degC
pub fn compensate_temperature(self: *Bme280) i32 {
    // Raw temperature reading from ADC is 20 bits
    var temp_uncomp: i32 = @as(i32, self.adc.temp_xlsb.temp_xlsb);
    temp_uncomp = temp_uncomp | (@as(i32, self.adc.temp_lsb) << 4);
    temp_uncomp = temp_uncomp | (@as(i32, self.adc.temp_msb) << 12);

    var var1: i32 = @divTrunc(temp_uncomp, 8);
    var1 = var1 -| @as(i32, self.calibration.dig_T1) *| 2;
    var1 = (var1 *| @as(i32, self.calibration.dig_T2));
    var1 = @divTrunc(var1, 2048);

    var var2: i32 = @divTrunc(temp_uncomp, 16);
    var2 = var2 -| @as(i32, self.calibration.dig_T1);
    var2 = @divTrunc(var2 *| var2, 4096);
    var2 = var2 *| @as(i32, self.calibration.dig_T3);
    var2 = @divTrunc(var2, 16384);

    // High resolution temperature used in pressure and humidity calculations
    self.temp_fine = var1 +| var2;

    const temp: i32 = @divTrunc(self.temp_fine *| 5 +| 128, 256);

    return temp;
}

// Pressure in Pa
pub fn compensate_pressure(self: *Bme280) u32 {
    const pressure_min: u32 = 30000;
    const pressure_max: u32 = 110000;
    var pressure: u32 = 0;

    // Raw pressure reading from ADC is 20 bits
    var press_uncomp: i32 = @as(i32, self.adc.press_xlsb.press_xlsb);
    press_uncomp = press_uncomp | (@as(i32, self.adc.press_lsb) << 4);
    press_uncomp = press_uncomp | (@as(i32, self.adc.press_msb) << 12);

    var var1: i32 = @divTrunc(self.temp_fine, 2) -| 64000;
    var var2: i32 = @divTrunc(var1, 4);
    var2 = @divTrunc(var2 *| var2, 2048);
    var2 = var2 *| @as(i32, self.calibration.dig_P6);
    var2 = var2 +| (var1 *| @as(i32, self.calibration.dig_P5)) *| 2;
    var2 = @divTrunc(var2, 4) +| @as(i32, self.calibration.dig_P4) *| 65536;
    var var3: i32 = @divTrunc(var1, 4);
    var3 = @divTrunc(var3 *| var3, 8192);
    var3 = @as(i32, self.calibration.dig_P3) *| var3;
    var3 = @divTrunc(var3, 8);
    const var4: i32 = @divTrunc(@as(i32, self.calibration.dig_P2) *| var1, 2);
    var1 = @divTrunc(var3 +| var4, 262144);
    var1 = @divTrunc((32768 +| var1) *| @as(i32, self.calibration.dig_P1), 32768);

    if (var1 != 0) {
        const var5: u32 = @as(u32, @intCast(1048576 - press_uncomp));
        pressure = (var5 -| @as(u32, @max(0, @divTrunc(var2, 4096)))) * 3125;

        if (pressure < 0x80000000) {
            pressure = @divTrunc(pressure *| 2, @as(u32, @max(0, var1)));
        } else {
            pressure = @divTrunc(pressure, @as(u32, @max(0, var1))) *| 2;
        }

        var1 = @intCast(@divTrunc(pressure, 8));
        var1 = @divTrunc(var1 *| var1, 8192);
        var1 = var1 *| self.calibration.dig_P9;
        var1 = @divTrunc(var1, 4096);
        var2 = @intCast(@divTrunc(pressure, 4));
        var2 = @divTrunc(var2 *| self.calibration.dig_P8, 8192);
        pressure = @intCast(@as(i32, @intCast(pressure)) +| @divTrunc(var1 +| var2 +| self.calibration.dig_P7, 16));

        if (pressure < pressure_min) {
            pressure = pressure_min;
        } else if (pressure > pressure_max) {
            pressure = pressure_max;
        }
    } else {
        pressure = pressure_min;
    }

    return pressure;
}

// Relative humidity in % in Q22.10 fixed point format
// Output value of 47445 represents 47445/1024 = 46.33 %
pub fn compensate_humidity(self: *Bme280) u32 {
    var var1: i32 = 0;
    var var2: i32 = 0;
    var var3: i32 = 0;
    var var4: i32 = 0;
    var var5: i32 = 0;
    var humidity: u32 = 0;
    const humidity_max: u32 = 102400;

    var humidity_uncomp: u32 = self.adc.hum_lsb;
    humidity_uncomp = humidity_uncomp | (@as(u32, self.adc.hum_msb) << 8);

    var1 = self.temp_fine -| 76800;
    var2 = @as(i32, @intCast(humidity_uncomp)) *| 16384;
    var3 = @as(i32, self.calibration.dig_H4) *| 1048576;
    var4 = self.calibration.dig_H5 *| var1;
    var5 = @divTrunc(((var2 -| var3) -| var4) +| 16384, 32768);
    var2 = @divTrunc(var1 *| self.calibration.dig_H6, 1024);
    var3 = @divTrunc(var1 *| self.calibration.dig_H3, 2048);
    var4 = @divTrunc(var2 *| (var3 +| 32768), 1024) +| 2097152;
    var2 = @divTrunc(var4 *| self.calibration.dig_H2 + 8192, 16384);
    var3 = var5 *| var2;
    var4 = @divTrunc(var3, 32768);
    var4 = @divTrunc(var4 *| var4, 128);
    var5 = var3 -| @divTrunc(var4 *| self.calibration.dig_H1, 16);
    var5 = if (var5 <= 0) 0 else var5;
    var5 = if (var5 > 419430400) 419430400 else var5;
    humidity = @intCast(@max(0, @divTrunc(var5, 4096)));

    if (humidity > humidity_max) {
        humidity = humidity_max;
    }

    return humidity;
}

test "Bme280 last register offset/address" {
    const std = @import("std");

    const hum_lsb_offset = @offsetOf(Bme280.Registers, "hum_lsb");
    try std.testing.expect(hum_lsb_offset == 118);
}

test "compensate_temperature" {
    const sensors: Adc = .{
        .temp_xlsb = .{},
        .temp_lsb = 0,
        .temp_msb = 0,
        .press_msb = 0,
        .press_lsb = 0,
        .press_xlsb = .{},
        .hum_lsb = 0,
        .hum_msb = 0,
    };
    _ = sensors;
}
