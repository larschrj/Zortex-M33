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
    reset: u8 = 0x0,
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

    const Ctrl_hum = packed struct(u8) {
        osrs_h: u3 = 0,
        _reserved0: u5 = 0,
    };

    const Status = packed struct(u8) {
        im_update: u1 = 0,
        _reserved0: u2 = 0,
        measuring: u1 = 0,
        _reserved1: u4 = 0,
    };

    const Ctrl_meas = packed struct(u8) {
        mode: u2 = 0,
        osrs_p: u3 = 0,
        osrs_t: u3 = 0,
    };

    const Config = packed struct(u8) {
        spi3w_en: u1 = 0,
        _reserved0: u1 = 0,
        filter: u3 = 0,
        t_sb: u3 = 0,
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

const I2c_addr = enum(u8) {
    @"0x76" = 0x76,
    @"0x77" = 0x77,
};

const Bme280ReadFunc = ?*const fn (dev_address: u8, register_address: u8, register_data: []u8) void;

const Bme280WriteFunc = ?*const fn (dev_address: u8, register_address: u8, register_data: []u8) void;

pub fn ReadCalibration(bme280: *@This()) void {
    var buffer = [_]u8{0} ** 24;
    var reg_addr: u8 = 0;

    reg_addr = @intFromPtr(&registers.dig_T1);
    bme280.bme280_read_func.?(@intFromEnum(bme280.i2c_addr.?), reg_addr, buffer[0..24]);

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
    bme280.bme280_read_func.?(@intFromEnum(bme280.i2c_addr.?), reg_addr, buffer[0..1]);
    bme280.calibration.dig_H1 = buffer[0];

    reg_addr = @intFromPtr(&registers.dig_H2);
    bme280.bme280_read_func.?(@intFromEnum(bme280.i2c_addr.?), reg_addr, buffer[0..7]);
    bme280.calibration.dig_H2 = (@as(i16, buffer[1]) << 8) | @as(i16, buffer[0]);
    bme280.calibration.dig_H3 = buffer[2];
    bme280.calibration.dig_H4 = (@as(i16, buffer[3]) << 4) | (@as(i16, buffer[4]) & 0xf);
    bme280.calibration.dig_H5 = (@as(i16, buffer[5]) << 4) | ((@as(i16, buffer[4]) & 0xf0) >> 4);
    bme280.calibration.dig_H6 = @bitCast(buffer[6]);
}

const registers: *Registers = @ptrFromInt(0x88);

i2c_addr: ?I2c_addr = null,
bme280_read_func: Bme280ReadFunc = null,
bme280_write_func: Bme280WriteFunc = null,
calibration: Calibration = .{},

test "Bme280 last register offset/address" {
    const std = @import("std");
    const Bme280 = @This();

    const hum_lsb_offset = @offsetOf(Bme280.Registers, "hum_lsb");
    try std.testing.expect(hum_lsb_offset == 118);
}
