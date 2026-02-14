const registers: *volatile Registers = @ptrFromInt(0x0f);

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
        odr: Odr,
        bdu: Bdu,
        _reserved0: u4,
        pd: Pd,

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
        oneshot: Oneshot,
        heater: Heater,
        _reserved0: u5,
        boot: Boot,

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
        _reserved0: u2,
        drdy: Drdy,
        _reserved1: u3,
        pp_od: Pp_od,
        drdy_h_l: Drdy_h_l,

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

pub const I2c_addr = enum(u8) {
    @"0x5f" = 0x5f,
};

test "HTS221 last register address" {
    const std = @import("std");

    std.debug.print("@offsetOf(Registers, \"calib\") = {x}\n", .{@offsetOf(Registers, "calib")});
    try std.testing.expect(@offsetOf(Registers, "calib") == 0x21);
}
