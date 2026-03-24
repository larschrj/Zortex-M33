pub const Crc = packed struct {
    dr: u32 = 0xffffffff,
    idr: u32 = 0,
    cr: Cr = 0,
    init: u32 = 0xffffffff,
    pol: u32 = 0b00000100110000010001110110110111,

    pub const Cr = packed struct(u32) {
        reset: Reset,
        _reserved0: u2,
        polysize: Polysize,
        rev_in: RevIn,
        rev_out: RevOut,
        _reserved1: u24,

        pub const Reset = enum(u1) {
            reset = 1,
        };

        pub const Polysize = enum(u2) {
            @"32bit" = 0b00,
            @"16bit" = 0b01,
            @"8bit" = 0b10,
            @"7bit" = 0b11,
        };

        pub const RevIn = enum(u2) {
            no_reversal = 0b00,
            reverse_byte = 0b01,
            reverse_half_word = 0b10,
            reverse_word = 0b11,
        };

        pub const RevOut = enum(u1) {
            no_reversal = 0b0,
            reverse = 0b1,
        };
    };
};
