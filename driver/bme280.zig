const Register = extern struct {
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
    _reserved1: [23]u16,
    id: u8 = 0x60,
    _reserved2: [15]u8,
    reset: u8 = 0x00,
    dig_H2: i16,
    dig_H3: u8,
    dig_H4_H5: i32,
    dig_H6: i8,
    _reserved3: u8,
    ctrl_hum: Ctrl_hum,
    status: Status,
    ctrl_meas: Ctrl_meas,
    config: Config,
    _reserved4: u8,
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

pub const register: *volatile Register = @ptrFromInt(0x88);

const I2c_addr = enum(u8) {
    @"0x76" = 0x76,
    @"0x77" = 0x77,
};

const Bme280ReadFunc = ?*const fn (dev_address: u8, register_address: u8, register_data: []u8) void;

const Bme280WriteFunc = ?*const fn (dev_address: u8, register_address: u8, register_data: []u8) void;

i2c_addr: ?I2c_addr = null,
bme280_read_func: Bme280ReadFunc = null,
bme280_write_func: Bme280WriteFunc = null,
