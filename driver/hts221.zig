const registers: *volatile Registers = @ptrFromInt(0x0f);

const Hts221 = @This();

pub const Registers = packed struct {
    who_am_i: u8 = 0b10111100,
    av_conf: Av_conf = @bitCast(0xb1),
    _reserved0: u32,
    _reserved1: u32,
    _reserved2: u32,
    _reserved3: u16,
    _reserved4: u8,
    ctrl_reg1: u8 = 0,
    ctrl_reg2: u8 = 0,
    ctrl_reg3: u8 = 0,
    _reserved5: u32,
    status_reg: u8,
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
