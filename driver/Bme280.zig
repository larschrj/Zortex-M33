const registers: *Registers = @ptrFromInt(0x88);

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

    const Status = packed struct(u8) {
        im_update: u1 = 0,
        _reserved0: u2 = 0,
        measuring: u1 = 0,
        _reserved1: u4 = 0,
    };

    pub const Ctrl_meas = packed struct(u8) {
        mode: Mode = .sleep,
        osrs_p: Osrs = .skip,
        osrs_t: Osrs = .skip,

        const Mode = enum(u2) {
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

    const Press_xlsb = packed struct(u8) {
        _reserved0: u4 = 0,
        press_xlsb: u4 = 0,
    };

    const Temp_xlsb = packed struct(u8) {
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

pub const I2c_addr = enum(u8) {
    @"0x76" = 0x76,
    @"0x77" = 0x77,
};

const Bme280ReadFunc = ?*const fn (register_address: u8, register_data: []u8) void;

const Bme280WriteFunc = ?*const fn (register_address: u8, register_data: []u8) void;

addr: ?u8 = null,
bme280_read_func: Bme280ReadFunc = null,
bme280_write_func: Bme280WriteFunc = null,
calibration: Calibration = undefined,

pub fn readCalibration(bme280: *@This()) void {
    var buffer = [_]u8{0} ** 24;
    var reg_addr: u8 = 0;

    reg_addr = @intFromPtr(&registers.dig_T1);
    bme280.bme280_read_func.?(reg_addr, buffer[0..24]);
    bme280.calibration.dig_T1 = (@as(u16, buffer[1]) << 8) | @as(u16, buffer[0]);
    bme280.calibration.dig_T2 = (@as(i16, buffer[3]) << 8) | @as(i16, buffer[2]);
    bme280.calibration.dig_T3 = (@as(i16, buffer[5]) << 8) | @as(i16, buffer[4]);
    bme280.calibration.dig_P1 = (@as(u16, buffer[7]) << 8) | @as(u16, buffer[6]);
    bme280.calibration.dig_P2 = (@as(i16, buffer[9]) << 8) | @as(i16, buffer[8]);
    bme280.calibration.dig_P3 = (@as(i16, buffer[11]) << 8) | @as(i16, buffer[10]);
    bme280.calibration.dig_P4 = (@as(i16, buffer[13]) << 8) | @as(i16, buffer[12]);
    bme280.calibration.dig_P5 = (@as(i16, buffer[15]) << 8) | @as(i16, buffer[14]);
    bme280.calibration.dig_P6 = (@as(i16, buffer[17]) << 8) | @as(i16, buffer[16]);
    bme280.calibration.dig_P7 = (@as(i16, buffer[19]) << 8) | @as(i16, buffer[18]);
    bme280.calibration.dig_P8 = (@as(i16, buffer[21]) << 8) | @as(i16, buffer[20]);
    bme280.calibration.dig_P9 = (@as(i16, buffer[23]) << 8) | @as(i16, buffer[22]);

    reg_addr = @intFromPtr(&registers.dig_H1);
    bme280.bme280_read_func.?(reg_addr, buffer[0..1]);
    bme280.calibration.dig_H1 = buffer[0];

    reg_addr = @intFromPtr(&registers.dig_H2);
    bme280.bme280_read_func.?(reg_addr, buffer[0..7]);
    bme280.calibration.dig_H2 = (@as(i16, buffer[1]) << 8) | @as(i16, buffer[0]);
    bme280.calibration.dig_H3 = buffer[2];
    bme280.calibration.dig_H4 = (@as(i16, buffer[3]) << 4) | (@as(i16, buffer[4]) & 0xf);
    bme280.calibration.dig_H5 = (@as(i16, buffer[5]) << 4) | ((@as(i16, buffer[4]) & 0xf0) >> 4);
    bme280.calibration.dig_H6 = @bitCast(buffer[6]);
}

pub fn getMode(bme280: *Bme280) Registers.Ctrl_meas.Mode {
    var buffer: [1]u8 = .{0};
    bme280.bme280_read_func.?(@intFromPtr(&registers.ctrl_meas), &buffer);
    const ctrl_meas: Registers.Ctrl_meas = @bitCast(buffer[0]);
    return ctrl_meas.mode;
}

pub fn setMode(bme280: *Bme280, mode: Registers.Ctrl_meas.Mode) Registers.Ctrl_meas.Mode {
    // Read ctrl_meas
    var buffer: [1]u8 = .{0};
    bme280.bme280_read_func.?(@intFromPtr(&registers.ctrl_meas), &buffer);

    // Write mode
    var ctrl_meas: Registers.Ctrl_meas = @bitCast(buffer[0]);
    ctrl_meas.mode = mode;
    buffer[0] = @bitCast(ctrl_meas);
    bme280.bme280_write_func.?(@intFromPtr(&registers.ctrl_meas), &buffer);

    // Read and return mode
    bme280.bme280_read_func.?(@intFromPtr(&registers.ctrl_meas), &buffer);
    ctrl_meas = @bitCast(buffer[0]);
    return ctrl_meas.mode;
}

pub fn getTempOversample(bme280: *Bme280) Registers.Osrs {
    var buffer: [1]u8 = .{0};
    bme280.bme280_read_func.?(@intFromPtr(&registers.ctrl_meas), &buffer);
    const ctrl_meas: Registers.Ctrl_meas = @bitCast(buffer[0]);
    return ctrl_meas.osrs_t;
}

pub fn setTempOversample(bme280: *Bme280, osrs: Registers.Osrs) Registers.Osrs {
    // Read ctrl_meas
    var buffer: [1]u8 = .{0};
    bme280.bme280_read_func.?(@intFromPtr(&registers.ctrl_meas), &buffer);
    var ctrl_meas: Registers.Ctrl_meas = @bitCast(buffer[0]);

    // Write pressure oversample
    ctrl_meas.osrs_t = osrs;
    buffer[0] = @bitCast(ctrl_meas);
    bme280.bme280_write_func.?(@intFromPtr(&registers.ctrl_meas), &buffer);

    // Read pressure oversample
    bme280.bme280_read_func.?(@intFromPtr(&registers.ctrl_meas), &buffer);
    ctrl_meas = @bitCast(buffer[0]);
    return ctrl_meas.osrs_t;
}

pub fn getPressOversample(bme280: *Bme280) Registers.Osrs {
    var buffer: [1]u8 = .{0};
    bme280.bme280_read_func.?(@intFromPtr(&registers.ctrl_meas), &buffer);
    const ctrl_meas: Registers.Ctrl_meas = @bitCast(buffer[0]);
    return ctrl_meas.osrs_p;
}

pub fn setPressOversample(bme280: *Bme280, osrs: Registers.Osrs) Registers.Osrs {
    // Read ctrl_meas
    var buffer: [1]u8 = .{0};
    bme280.bme280_read_func.?(@intFromPtr(&registers.ctrl_meas), &buffer);
    var ctrl_meas: Registers.Ctrl_meas = @bitCast(buffer[0]);

    // Write pressure oversample
    ctrl_meas.osrs_p = osrs;
    buffer[0] = @bitCast(ctrl_meas);
    bme280.bme280_write_func.?(@intFromPtr(&registers.ctrl_meas), &buffer);

    // Read pressure oversample
    bme280.bme280_read_func.?(@intFromPtr(&registers.ctrl_meas), &buffer);
    ctrl_meas = @bitCast(buffer[0]);
    return ctrl_meas.osrs_p;
}

pub fn getHumOversample(bme280: *Bme280) Registers.Osrs {
    var buffer: [1]u8 = .{0};
    bme280.bme280_read_func.?(@intFromPtr(&registers.ctrl_hum), &buffer);
    const ctrl_hum: Registers.Ctrl_hum = @bitCast(buffer[0]);
    return ctrl_hum.osrs_h;
}

pub fn setHumOversample(bme280: *Bme280, osrs: Registers.Osrs) Registers.Osrs {
    // Read ctrl_meas
    var buffer: [1]u8 = .{0};
    bme280.bme280_read_func.?(@intFromPtr(&registers.ctrl_hum), &buffer);
    var ctrl_hum: Registers.Ctrl_hum = @bitCast(buffer[0]);

    // Write pressure oversample
    ctrl_hum.osrs_h = osrs;
    buffer[0] = @bitCast(ctrl_hum);
    bme280.bme280_write_func.?(@intFromPtr(&registers.ctrl_hum), &buffer);

    // Read pressure oversample
    bme280.bme280_read_func.?(@intFromPtr(&registers.ctrl_hum), &buffer);
    ctrl_hum = @bitCast(buffer[0]);
    return ctrl_hum.osrs_h;
}

pub fn getStatus(bme280: *Bme280) Registers.Status {
    var buffer: [1]u8 = .{0};
    bme280.bme280_read_func.?(@intFromPtr(&registers.status), &buffer);
    const status: Registers.Status = @bitCast(buffer[0]);
    return status;
}

pub fn getRawTemp(bme280: *Bme280) void {
    var buffer: [3]u8 = .{ 0, 0, 0 };
    bme280.bme280_read_func.?(@intFromPtr(&registers.temp_lsb), buffer[0..1]);
}

test "Bme280 last register offset/address" {
    const std = @import("std");

    const hum_lsb_offset = @offsetOf(Bme280.Registers, "hum_lsb");
    try std.testing.expect(hum_lsb_offset == 118);
}
