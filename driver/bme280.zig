const Register = extern struct {
    calib00: u8,
    calib01: u8,
    calib02: u8,
    calib03: u8,
    calib04: u8,
    calib05: u8,
    calib06: u8,
    calib07: u8,
    calib08: u8,
    calib09: u8,
    calib10: u8,
    calib11: u8,
    calib12: u8,
    calib13: u8,
    calib14: u8,
    calib15: u8,
    calib16: u8,
    calib17: u8,
    calib18: u8,
    calib19: u8,
    calib20: u8,
    calib21: u8,
    calib22: u8,
    calib23: u8,
    calib24: u8,
    calib25: u8,
    _reserved0: [23]u16,
    id: u8 = 0x60,
    _reserved1: [15]u8,
    reset: u8 = 0x00,
    calib26: u8,
    calib27: u8,
    calib28: u8,
    calib29: u8,
    calib30: u8,
    calib31: u8,
    calib32: u8,
    calib33: u8,
    calib34: u8,
    calib35: u8,
    calib36: u8,
    calib37: u8,
    calib38: u8,
    calib39: u8,
    calib40: u8,
    calib41: u8,
    _reserved2: u8,
    ctrl_hum: Ctrl_hum,
    status: Status,
    ctrl_meas: Ctrl_meas,
    config: Config,
    _reserved3: u8,
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
