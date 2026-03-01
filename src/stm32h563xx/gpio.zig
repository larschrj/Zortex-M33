const Moder = packed struct(u32) {
    p0: Mode,
    p1: Mode,
    p2: Mode,
    p3: Mode,
    p4: Mode,
    p5: Mode,
    p6: Mode,
    p7: Mode,
    p8: Mode,
    p9: Mode,
    p10: Mode,
    p11: Mode,
    p12: Mode,
    p13: Mode,
    p14: Mode,
    p15: Mode,

    const Mode = enum(u2) {
        input = 0b00,
        output = 0b01,
        alternate_function = 0b10,
        analog = 0b11,
    };
};

const Otyper = packed struct(u16) {
    p0: Otype,
    p1: Otype,
    p2: Otype,
    p3: Otype,
    p4: Otype,
    p5: Otype,
    p6: Otype,
    p7: Otype,
    p8: Otype,
    p9: Otype,
    p10: Otype,
    p11: Otype,
    p12: Otype,
    p13: Otype,
    p14: Otype,
    p15: Otype,

    const Otype = enum(u1) {
        push_pull = 0b0,
        open_drain = 0b1,
    };
};

const Ospeedr = packed struct(u32) {
    p0: Ospeed,
    p1: Ospeed,
    p2: Ospeed,
    p3: Ospeed,
    p4: Ospeed,
    p5: Ospeed,
    p6: Ospeed,
    p7: Ospeed,
    p8: Ospeed,
    p9: Ospeed,
    p10: Ospeed,
    p11: Ospeed,
    p12: Ospeed,
    p13: Ospeed,
    p14: Ospeed,
    p15: Ospeed,

    const Ospeed = enum(u2) {
        low = 0b00,
        medium = 0b01,
        high = 0b10,
        very_high = 0b11,
    };
};

const Pupdr = packed struct(u32) {
    p0: Pupd,
    p1: Pupd,
    p2: Pupd,
    p3: Pupd,
    p4: Pupd,
    p5: Pupd,
    p6: Pupd,
    p7: Pupd,
    p8: Pupd,
    p9: Pupd,
    p10: Pupd,
    p11: Pupd,
    p12: Pupd,
    p13: Pupd,
    p14: Pupd,
    p15: Pupd,

    const Pupd = enum(u2) {
        no_pullup_pulldown = 0b00,
        pullup = 0b01,
        pulldown = 0b10,
    };
};

const Idr = packed struct(u16) {
    p0: u1,
    p1: u1,
    p2: u1,
    p3: u1,
    p4: u1,
    p5: u1,
    p6: u1,
    p7: u1,
    p8: u1,
    p9: u1,
    p10: u1,
    p11: u1,
    p12: u1,
    p13: u1,
    p14: u1,
    p15: u1,
};

const Odr = packed struct(u16) {
    p0: u1,
    p1: u1,
    p2: u1,
    p3: u1,
    p4: u1,
    p5: u1,
    p6: u1,
    p7: u1,
    p8: u1,
    p9: u1,
    p10: u1,
    p11: u1,
    p12: u1,
    p13: u1,
    p14: u1,
    p15: u1,
};

const Bsrr = packed struct(u32) {
    bs: Bs,
    br: Br,

    const Bs = packed struct(u16) {
        p0: u1,
        p1: u1,
        p2: u1,
        p3: u1,
        p4: u1,
        p5: u1,
        p6: u1,
        p7: u1,
        p8: u1,
        p9: u1,
        p10: u1,
        p11: u1,
        p12: u1,
        p13: u1,
        p14: u1,
        p15: u1,
    };

    const Br = packed struct(u16) {
        p0: u1,
        p1: u1,
        p2: u1,
        p3: u1,
        p4: u1,
        p5: u1,
        p6: u1,
        p7: u1,
        p8: u1,
        p9: u1,
        p10: u1,
        p11: u1,
        p12: u1,
        p13: u1,
        p14: u1,
        p15: u1,
    };
};

const Lckr = packed struct(u17) {
    p0: u1,
    p1: u1,
    p2: u1,
    p3: u1,
    p4: u1,
    p5: u1,
    p6: u1,
    p7: u1,
    p8: u1,
    p9: u1,
    p10: u1,
    p11: u1,
    p12: u1,
    p13: u1,
    p14: u1,
    p15: u1,
    lckk: u1,
};

const Brr = packed struct(u16) {
    p0: u1,
    p1: u1,
    p2: u1,
    p3: u1,
    p4: u1,
    p5: u1,
    p6: u1,
    p7: u1,
    p8: u1,
    p9: u1,
    p10: u1,
    p11: u1,
    p12: u1,
    p13: u1,
    p14: u1,
    p15: u1,
};

const Hslvr = packed struct(u16) {
    p0: u1,
    p1: u1,
    p2: u1,
    p3: u1,
    p4: u1,
    p5: u1,
    p6: u1,
    p7: u1,
    p8: u1,
    p9: u1,
    p10: u1,
    p11: u1,
    p12: u1,
    p13: u1,
    p14: u1,
    p15: u1,
};

const Seccfgr = packed struct(u16) {
    p0: u1,
    p1: u1,
    p2: u1,
    p3: u1,
    p4: u1,
    p5: u1,
    p6: u1,
    p7: u1,
    p8: u1,
    p9: u1,
    p10: u1,
    p11: u1,
    p12: u1,
    p13: u1,
    p14: u1,
    p15: u1,
};

pub const GpioA = packed struct {
    moder: Moder,
    otyper: Otyper,
    _reserved0: u16,
    ospeedr: Ospeedr,
    pupdr: Pupdr,
    idr: Idr,
    _reserved1: u16,
    odr: Odr,
    _reserved2: u16,
    bsrr: Bsrr,
    lckr: Lckr,
    _reserved3: u15,
    afr: Afr,
    brr: Brr,
    _reserved4: u16,
    hslvr: Hslvr,
    _reserved5: u16,
    seccfgr: Seccfgr,
    _reserved6: u16,

    const Afr = packed struct(u64) {
        p0: P0,
        p1: P1,
        p2: P2,
        p3: P3,
        p4: P4,
        p5: P5,
        p6: P6,
        p7: P7,
        p8: P8,
        p9: P9,
        p10: P10,
        p11: P11,
        p12: P12,
        p13: P13,
        p14: P14,
        p15: P15,

        const P0 = enum(u4) {
            tim2_ch1 = 1,
            tim5_ch1 = 2,
            tim8_etr = 3,
            tim15_bkin = 4,
            spi6_nss = 5,
            spi3_rdy = 6,
            usart2_cts = 7,
        };

        const P1 = enum(u4) {
            tim2_ch2 = 1,
            tim5_ch2 = 2,
            tim15_ch1n = 4,
            lptim1_in1 = 5,
            octospi1_dqs = 6,
            usart2_rts = 7,
        };

        const P2 = enum(u4) {};

        const P3 = enum(u4) {};

        const P4 = enum(u4) {};

        const P5 = enum(u4) {};

        const P6 = enum(u4) {};

        const P7 = enum(u4) {};

        const P8 = enum(u4) {};

        const P9 = enum(u4) {};

        const P10 = enum(u4) {};

        const P11 = enum(u4) {};

        const P12 = enum(u4) {};

        const P13 = enum(u4) {};

        const P14 = enum(u4) {};

        const P15 = enum(u4) {};
    };
};

pub const GpioB = packed struct {
    moder: Moder,
    otyper: Otyper,
    _reserved0: u16,
    ospeedr: Ospeedr,
    pupdr: Pupdr,
    idr: Idr,
    _reserved1: u16,
    odr: Odr,
    _reserved2: u16,
    bsrr: Bsrr,
    lckr: Lckr,
    _reserved3: u15,
    afr: Afr,
    brr: Brr,
    _reserved4: u16,
    hslvr: Hslvr,
    _reserved5: u16,
    seccfgr: Seccfgr,
    _reserved6: u16,

    const Afr = packed struct(u64) {
        p0: P0,
        p1: P1,
        p2: P2,
        p3: P3,
        p4: P4,
        p5: P5,
        p6: P6,
        p7: P7,
        p8: P8,
        p9: P9,
        p10: P10,
        p11: P11,
        p12: P12,
        p13: P13,
        p14: P14,
        p15: P15,

        const P0 = enum(u4) {};

        const P1 = enum(u4) {};

        const P2 = enum(u4) {};

        const P3 = enum(u4) {};

        const P4 = enum(u4) {};

        const P5 = enum(u4) {};

        const P6 = enum(u4) {};

        const P7 = enum(u4) {};

        const P8 = enum(u4) {};

        const P9 = enum(u4) {};

        const P10 = enum(u4) {};

        const P11 = enum(u4) {};

        const P12 = enum(u4) {};

        const P13 = enum(u4) {};

        const P14 = enum(u4) {};

        const P15 = enum(u4) {};
    };
};

pub const GpioC = packed struct {
    moder: Moder,
    otyper: Otyper,
    _reserved0: u16,
    ospeedr: Ospeedr,
    pupdr: Pupdr,
    idr: Idr,
    _reserved1: u16,
    odr: Odr,
    _reserved2: u16,
    bsrr: Bsrr,
    lckr: Lckr,
    _reserved3: u15,
    afr: Afr,
    brr: Brr,
    _reserved4: u16,
    hslvr: Hslvr,
    _reserved5: u16,
    seccfgr: Seccfgr,
    _reserved6: u16,

    const Afr = packed struct(u64) {
        p0: P0,
        p1: P1,
        p2: P2,
        p3: P3,
        p4: P4,
        p5: P5,
        p6: P6,
        p7: P7,
        p8: P8,
        p9: P9,
        p10: P10,
        p11: P11,
        p12: P12,
        p13: P13,
        p14: P14,
        p15: P15,

        const P0 = enum(u4) {};

        const P1 = enum(u4) {};

        const P2 = enum(u4) {};

        const P3 = enum(u4) {};

        const P4 = enum(u4) {};

        const P5 = enum(u4) {};

        const P6 = enum(u4) {};

        const P7 = enum(u4) {};

        const P8 = enum(u4) {};

        const P9 = enum(u4) {};

        const P10 = enum(u4) {};

        const P11 = enum(u4) {};

        const P12 = enum(u4) {};

        const P13 = enum(u4) {};

        const P14 = enum(u4) {};

        const P15 = enum(u4) {};
    };
};

pub const GpioD = packed struct {
    moder: Moder,
    otyper: Otyper,
    _reserved0: u16,
    ospeedr: Ospeedr,
    pupdr: Pupdr,
    idr: Idr,
    _reserved1: u16,
    odr: Odr,
    _reserved2: u16,
    bsrr: Bsrr,
    lckr: Lckr,
    _reserved3: u15,
    afr: Afr,
    brr: Brr,
    _reserved4: u16,
    hslvr: Hslvr,
    _reserved5: u16,
    seccfgr: Seccfgr,
    _reserved6: u16,

    const Afr = packed struct(u64) {
        p0: P0,
        p1: P1,
        p2: P2,
        p3: P3,
        p4: P4,
        p5: P5,
        p6: P6,
        p7: P7,
        p8: P8,
        p9: P9,
        p10: P10,
        p11: P11,
        p12: P12,
        p13: P13,
        p14: P14,
        p15: P15,

        const P0 = enum(u4) {};

        const P1 = enum(u4) {};

        const P2 = enum(u4) {};

        const P3 = enum(u4) {};

        const P4 = enum(u4) {};

        const P5 = enum(u4) {};

        const P6 = enum(u4) {};

        const P7 = enum(u4) {};

        const P8 = enum(u4) {};

        const P9 = enum(u4) {};

        const P10 = enum(u4) {};

        const P11 = enum(u4) {};

        const P12 = enum(u4) {};

        const P13 = enum(u4) {};

        const P14 = enum(u4) {};

        const P15 = enum(u4) {};
    };
};

pub const GpioE = packed struct {
    moder: Moder,
    otyper: Otyper,
    _reserved0: u16,
    ospeedr: Ospeedr,
    pupdr: Pupdr,
    idr: Idr,
    _reserved1: u16,
    odr: Odr,
    _reserved2: u16,
    bsrr: Bsrr,
    lckr: Lckr,
    _reserved3: u15,
    afr: Afr,
    brr: Brr,
    _reserved4: u16,
    hslvr: Hslvr,
    _reserved5: u16,
    seccfgr: Seccfgr,
    _reserved6: u16,

    const Afr = packed struct(u64) {
        p0: P0,
        p1: P1,
        p2: P2,
        p3: P3,
        p4: P4,
        p5: P5,
        p6: P6,
        p7: P7,
        p8: P8,
        p9: P9,
        p10: P10,
        p11: P11,
        p12: P12,
        p13: P13,
        p14: P14,
        p15: P15,

        const P0 = enum(u4) {};

        const P1 = enum(u4) {};

        const P2 = enum(u4) {};

        const P3 = enum(u4) {};

        const P4 = enum(u4) {};

        const P5 = enum(u4) {};

        const P6 = enum(u4) {};

        const P7 = enum(u4) {};

        const P8 = enum(u4) {};

        const P9 = enum(u4) {};

        const P10 = enum(u4) {};

        const P11 = enum(u4) {};

        const P12 = enum(u4) {};

        const P13 = enum(u4) {};

        const P14 = enum(u4) {};

        const P15 = enum(u4) {};
    };
};

pub const GpioF = packed struct {
    moder: Moder,
    otyper: Otyper,
    _reserved0: u16,
    ospeedr: Ospeedr,
    pupdr: Pupdr,
    idr: Idr,
    _reserved1: u16,
    odr: Odr,
    _reserved2: u16,
    bsrr: Bsrr,
    lckr: Lckr,
    _reserved3: u15,
    afr: Afr,
    brr: Brr,
    _reserved4: u16,
    hslvr: Hslvr,
    _reserved5: u16,
    seccfgr: Seccfgr,
    _reserved6: u16,

    const Afr = packed struct(u64) {
        p0: P0,
        p1: P1,
        p2: P2,
        p3: P3,
        p4: P4,
        p5: P5,
        p6: P6,
        p7: P7,
        p8: P8,
        p9: P9,
        p10: P10,
        p11: P11,
        p12: P12,
        p13: P13,
        p14: P14,
        p15: P15,

        const P0 = enum(u4) {};

        const P1 = enum(u4) {};

        const P2 = enum(u4) {};

        const P3 = enum(u4) {};

        const P4 = enum(u4) {};

        const P5 = enum(u4) {};

        const P6 = enum(u4) {};

        const P7 = enum(u4) {};

        const P8 = enum(u4) {};

        const P9 = enum(u4) {};

        const P10 = enum(u4) {};

        const P11 = enum(u4) {};

        const P12 = enum(u4) {};

        const P13 = enum(u4) {};

        const P14 = enum(u4) {};

        const P15 = enum(u4) {};
    };
};

pub const GpioG = packed struct {
    moder: Moder,
    otyper: Otyper,
    _reserved0: u16,
    ospeedr: Ospeedr,
    pupdr: Pupdr,
    idr: Idr,
    _reserved1: u16,
    odr: Odr,
    _reserved2: u16,
    bsrr: Bsrr,
    lckr: Lckr,
    _reserved3: u15,
    afr: Afr,
    brr: Brr,
    _reserved4: u16,
    hslvr: Hslvr,
    _reserved5: u16,
    seccfgr: Seccfgr,
    _reserved6: u16,

    const Afr = packed struct(u64) {
        p0: P0,
        p1: P1,
        p2: P2,
        p3: P3,
        p4: P4,
        p5: P5,
        p6: P6,
        p7: P7,
        p8: P8,
        p9: P9,
        p10: P10,
        p11: P11,
        p12: P12,
        p13: P13,
        p14: P14,
        p15: P15,

        const P0 = enum(u4) {};

        const P1 = enum(u4) {};

        const P2 = enum(u4) {};

        const P3 = enum(u4) {};

        const P4 = enum(u4) {};

        const P5 = enum(u4) {};

        const P6 = enum(u4) {};

        const P7 = enum(u4) {};

        const P8 = enum(u4) {};

        const P9 = enum(u4) {};

        const P10 = enum(u4) {};

        const P11 = enum(u4) {};

        const P12 = enum(u4) {};

        const P13 = enum(u4) {};

        const P14 = enum(u4) {};

        const P15 = enum(u4) {};
    };
};

pub const GpioH = packed struct {
    moder: Moder,
    otyper: Otyper,
    _reserved0: u16,
    ospeedr: Ospeedr,
    pupdr: Pupdr,
    idr: Idr,
    _reserved1: u16,
    odr: Odr,
    _reserved2: u16,
    bsrr: Bsrr,
    lckr: Lckr,
    _reserved3: u15,
    afr: Afr,
    brr: Brr,
    _reserved4: u16,
    hslvr: Hslvr,
    _reserved5: u16,
    seccfgr: Seccfgr,
    _reserved6: u16,

    const Afr = packed struct(u64) {
        p0: P0,
        p1: P1,
        p2: P2,
        p3: P3,
        p4: P4,
        p5: P5,
        p6: P6,
        p7: P7,
        p8: P8,
        p9: P9,
        p10: P10,
        p11: P11,
        p12: P12,
        p13: P13,
        p14: P14,
        p15: P15,

        const P0 = enum(u4) {};

        const P1 = enum(u4) {};

        const P2 = enum(u4) {};

        const P3 = enum(u4) {};

        const P4 = enum(u4) {};

        const P5 = enum(u4) {};

        const P6 = enum(u4) {};

        const P7 = enum(u4) {};

        const P8 = enum(u4) {};

        const P9 = enum(u4) {};

        const P10 = enum(u4) {};

        const P11 = enum(u4) {};

        const P12 = enum(u4) {};

        const P13 = enum(u4) {};

        const P14 = enum(u4) {};

        const P15 = enum(u4) {};
    };
};

pub const GpioI = packed struct {
    moder: Moder,
    otyper: Otyper,
    _reserved0: u16,
    ospeedr: Ospeedr,
    pupdr: Pupdr,
    idr: Idr,
    _reserved1: u16,
    odr: Odr,
    _reserved2: u16,
    bsrr: Bsrr,
    lckr: Lckr,
    _reserved3: u15,
    afr: Afr,
    brr: Brr,
    _reserved4: u16,
    hslvr: Hslvr,
    _reserved5: u16,
    seccfgr: Seccfgr,
    _reserved6: u16,

    const Afr = packed struct(u64) {
        p0: P0,
        p1: P1,
        p2: P2,
        p3: P3,
        p4: P4,
        p5: P5,
        p6: P6,
        p7: P7,
        p8: P8,
        p9: P9,
        p10: P10,
        p11: P11,
        p12: P12,
        p13: P13,
        p14: P14,
        p15: P15,

        const P0 = enum(u4) {};

        const P1 = enum(u4) {};

        const P2 = enum(u4) {};

        const P3 = enum(u4) {};

        const P4 = enum(u4) {};

        const P5 = enum(u4) {};

        const P6 = enum(u4) {};

        const P7 = enum(u4) {};

        const P8 = enum(u4) {};

        const P9 = enum(u4) {};

        const P10 = enum(u4) {};

        const P11 = enum(u4) {};

        const P12 = enum(u4) {};

        const P13 = enum(u4) {};

        const P14 = enum(u4) {};

        const P15 = enum(u4) {};
    };
};
