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
            spi3_rdy = 6,
            usart2_cts = 7,
            uart4_tx = 8,
            octospim_p2_ncs = 10,
            sdmmc2_cmd = 12,
            audioclk = 13,
            tim2_etr = 14,
            eventout = 15,
        };

        const P1 = enum(u4) {
            lptim1_ch2 = 0,
            tim2_ch2 = 1,
            tim5_ch2 = 2,
            i2c1_smba = 4,
            spi1_sck = 5,
            usart2_rts = 7,
            uart4_rx = 8,
            octospim_p1_dqs = 10,
            lpgpio1_p0 = 11,
            tim15_ch1n = 14,
            eventout = 15,
        };

        const P2 = enum(u4) {
            tim2_ch3 = 1,
            tim5_ch3 = 2,
            spi1_rdy = 5,
            usart2_tx = 7,
            lpuart1_tx = 8,
            octospim_p1_ncs = 10,
            ucpd1_frstx1 = 11,
            tim15_ch1 = 14,
            eventout = 15,
        };

        const P3 = enum(u4) {
            tim2_ch4 = 1,
            tim5_ch4 = 2,
            sai1_ck1 = 3,
            usart2_rx = 7,
            lpuart1_rx = 8,
            octospim_p1_clk = 10,
            lpgpio1_p1 = 11,
            sai1_mclk_a = 13,
            tim15_ch2 = 14,
            eventout = 15,
        };

        const P4 = enum(u4) {
            octospim_p1_ncs = 3,
            spi1_nss = 5,
            spi3_nss = 6,
            usart2_ck = 7,
            dcmi_hsync_pssi_de = 10,
            sai1_fs_b = 13,
            lptim2_ch1 = 14,
            eventout = 15,
        };

        const P5 = enum(u4) {
            csleep = 0,
            tim2_ch1 = 1,
            tim2_etr = 2,
            tim8_ch1n = 3,
            pssi_d14 = 4,
            spi1_sck = 5,
            usart3_rx = 7,
            lptim2_etr = 14,
            eventout = 15,
        };

        const P6 = enum(u4) {
            cdstop = 0,
            tim1_bkin = 1,
            tim3_ch1 = 2,
            tim8_bkin = 3,
            dcmi_pixclk_pssi_pdck = 4,
            spi1_miso = 5,
            usart3_cts = 7,
            lpuart1_cts = 8,
            octospim_p1_io3 = 10,
            lpgpio1_p2 = 11,
            tim16_ch1 = 14,
            eventout = 15,
        };

        const P7 = enum(u4) {
            srdstop = 0,
            tim1_ch1n = 1,
            tim3_ch2 = 2,
            tim8_ch1n = 3,
            i2c3_scl = 4,
            spi1_mosi = 5,
            usart3_tx = 7,
            octospim_p1_io2 = 10,
            lptim2_ch2 = 13,
            tim17_ch1 = 14,
            eventout = 15,
        };

        const P8 = enum(u4) {
            mco = 0,
            tim1_ch1 = 1,
            sai1_ck2 = 3,
            spi1_rdy = 5,
            usart1_ck = 7,
            otg_fs_sof = 10,
            traceclk = 12,
            sai1_sck_a = 13,
            lptim2_ch1 = 14,
            eventout = 15,
        };

        const P9 = enum(u4) {
            tim1_ch2 = 1,
            spi2_sck = 3,
            dcmi_d0_pssi_d0 = 5,
            usart1_tx = 7,
            sai1_fs_a = 13,
            tim15_bkin = 14,
            eventout = 15,
        };

        const P10 = enum(u4) {
            crs_sync = 0,
            tim1_ch3 = 1,
            lptim2_in2 = 2,
            sai1_d1 = 3,
            dcmi_d1_pssi_d1 = 5,
            usart1_rx = 7,
            otg_fs_id = 10,
            sai1_sd_a = 13,
            tim17_bkin = 14,
            eventout = 15,
        };

        const P11 = enum(u4) {
            tim1_ch4 = 1,
            tim1_bkin2 = 2,
            spi1_miso = 5,
            usart1_cts = 7,
            fdcan1_rx = 9,
            eventout = 15,
        };

        const P12 = enum(u4) {
            tim1_etr = 1,
            spi1_mosi = 5,
            octospim_p2_ncs = 6,
            usart1_rts = 7,
            fdcan1_tx = 9,
            eventout = 15,
        };

        const P13 = enum(u4) {
            jtms_swdio = 0,
            ir_out = 1,
            otg_fs_noe = 10,
            sai1_sd_b = 13,
            eventout = 15,
        };

        const P14 = enum(u4) {
            jtck_swclk = 0,
            lptim1_ch1 = 1,
            i2c1_smba = 4,
            i2c4_smba = 5,
            otg_fs_sof = 10,
            sai1_fs_b = 13,
            eventout = 15,
        };

        const P15 = enum(u4) {
            jtdi = 0,
            tim2_ch1 = 1,
            tim2_etr = 2,
            usart2_rx = 3,
            spi1_nss = 5,
            spi3_nss = 6,
            usart3_rts = 7,
            uart4_rts = 8,
            sai2_fs_b = 13,
            eventout = 15,
        };
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

        const P0 = enum(u4) {
            tim1_ch2n = 1,
            tim3_ch3 = 2,
            tim8_ch2n = 3,
            lptim3_ch1 = 4,
            spi1_nss = 5,
            usart3_ck = 7,
            octospim_p1_io1 = 10,
            lpgpio1_p9 = 11,
            comp1_out = 12,
            audioclk = 13,
            eventout = 15,
        };

        const P1 = enum(u4) {
            tim1_ch3n = 1,
            tim3_ch4 = 2,
            tim8_ch3n = 3,
            lptim3_ch2 = 4,
            mdf1_sdi0 = 6,
            usart3_rts_usart3_de = 7,
            lpuart1_rts_lpuart1_de = 8,
            octospim_p1_io0 = 10,
            lpgpio1_p3 = 11,
            lptim2_in1 = 14,
            eventout = 15,
        };

        const P2 = enum(u4) {
            lptim1_ch1 = 1,
            tim8_ch4n = 3,
            i2c3_smba = 4,
            spi1_rdy = 5,
            mdf1_cki0 = 6,
            octospim_p1_dqs = 10,
            ucpd1_frstx1 = 11,
            eventout = 15,
        };

        const P3 = enum(u4) {
            jtdo_traceswo = 0,
            tim2_ch2 = 1,
            lptim1_ch1 = 2,
            adf1_cck0 = 3,
            i2c1_sda = 4,
            spi1_sck = 5,
            spi3_sck = 6,
            usart1_rts_usart1_de = 7,
            crs_sync = 10,
            lpgpio1_p11 = 11,
            sdmmc2_d2 = 12,
            sai1_sck_b = 13,
            eventout = 15,
        };

        const P4 = enum(u4) {
            njtrst = 0,
            lptim1_ch2 = 1,
            tim3_ch1 = 2,
            adf1_sdi0 = 3,
            i2c3_sda = 4,
            spi1_miso = 5,
            spi3_miso = 6,
            usart1_cts = 7,
            uart5_rts_uart5_de = 8,
            tsc_g2_io1 = 9,
            dcmi_d12_pssi_d12 = 10,
            lpgpio1_p12 = 11,
            sdmmc2_d3 = 12,
            sai1_mclk_b = 13,
            tim17_bkin = 14,
            eventout = 15,
        };

        const P5 = enum(u4) {
            lptim1_in1 = 1,
            tim3_ch2 = 2,
            octospim_p1_nclk = 3,
            i2c1_smba = 4,
            spi1_mosi = 5,
            spi3_mosi = 6,
            usart1_ck = 7,
            uart5_cts = 8,
            tsc_g2_io2 = 9,
            dcmi_d10_pssi_d10 = 10,
            comp2_out = 12,
            sai1_sd_b = 13,
            tim16_bkin = 14,
            eventout = 15,
        };

        const P6 = enum(u4) {
            lptim1_etr = 1,
            tim4_ch1 = 2,
            tim8_bkin2 = 3,
            i2c1_scl = 4,
            i2c4_scl = 5,
            mdf1_sdi5 = 6,
            usart1_tx = 7,
            tsc_g2_io3 = 9,
            dcmi_d5_pssi_d5 = 10,
            sai1_fs_b = 13,
            tim16_ch1n = 14,
            eventout = 15,
        };

        const P7 = enum(u4) {
            lptim1_in2 = 1,
            tim4_ch2 = 2,
            tim8_bkin = 3,
            i2c1_sda = 4,
            i2c4_sda = 5,
            mdf1_cki5 = 6,
            usart1_rx = 7,
            uart4_cts = 8,
            tsc_g2_io4 = 9,
            dcmi_vsync_pssi_rdy = 10,
            fmc_nl = 12,
            tim17_ch1n = 14,
            eventout = 15,
        };

        const P8 = enum(u4) {
            tim4_ch3 = 2,
            sai1_ck1 = 3,
            i2c1_scl = 4,
            mdf1_cck0 = 5,
            spi3_rdy = 6,
            sdmmc1_ckin = 8,
            fdcan1_rx = 9,
            dcmi_d6_pssi_d6 = 10,
            sdmmc2_d4 = 11,
            sdmmc1_d4 = 12,
            sai1_mclk_a = 13,
            tim16_ch1 = 14,
            eventout = 15,
        };

        const P9 = enum(u4) {
            ir_out = 1,
            tim4_ch4 = 2,
            sai1_d2 = 3,
            i2c1_sda = 4,
            spi2_nss = 5,
            sdmmc1_cdir = 8,
            fdcan1_tx = 9,
            dcmi_d7_pssi_d7 = 10,
            sdmmc2_d5 = 11,
            sdmmc1_d5 = 12,
            sai1_fs_a = 13,
            tim17_ch1 = 14,
            eventout = 15,
        };

        const P10 = enum(u4) {
            tim2_ch3 = 1,
            lptim3_ch1 = 2,
            i2c4_scl = 3,
            i2c2_scl = 4,
            spi2_sck = 5,
            usart3_tx = 7,
            lpuart1_rx = 8,
            tsc_sync = 9,
            octospim_p1_clk = 10,
            lpgpio1_p4 = 11,
            comp1_out = 12,
            sai1_sck_a = 13,
            eventout = 15,
        };

        const P11 = enum(u4) {
            tim2_ch4 = 1,
            i2c4_sda = 3,
            i2c2_sda = 4,
            spi2_rdy = 5,
            usart3_rx = 7,
            lpuart1_tx = 8,
            octospim_p1_ncs = 10,
            comp2_out = 12,
            eventout = 15,
        };

        const P12 = enum(u4) {
            tim1_bkin = 1,
            i2c2_smba = 4,
            spi2_nss = 5,
            mdf1_sdi1 = 6,
            usart3_ck = 7,
            lpuart1_rts_lpuart1_de = 8,
            tsc_g1_io1 = 9,
            octospim_p1_nclk = 10,
            sai2_fs_a = 13,
            tim15_bkin = 14,
            eventout = 15,
        };

        const P13 = enum(u4) {
            tim1_ch1n = 1,
            lptim3_in1 = 2,
            i2c2_scl = 4,
            spi2_sck = 5,
            mdf1_cki1 = 6,
            usart3_cts = 7,
            lpuart1_cts = 8,
            tsc_g1_io2 = 9,
            sai2_sck_a = 13,
            tim15_ch1n = 14,
            eventout = 15,
        };

        const P14 = enum(u4) {
            tim1_ch2n = 1,
            lptim3_etr = 2,
            tim8_ch2n = 3,
            i2c2_sda = 4,
            spi2_miso = 5,
            mdf1_sdi2 = 6,
            usart3_rts_usart3_de = 7,
            tsc_g1_io3 = 9,
            sdmmc2_d0 = 12,
            sai2_mclk_a = 13,
            tim15_ch1 = 14,
            eventout = 15,
        };

        const P15 = enum(u4) {
            rtc_refin = 0,
            tim1_ch3n = 1,
            lptim2_in2 = 2,
            tim8_ch3n = 3,
            spi2_mosi = 5,
            mdf1_cki2 = 6,
            fmc_nbl1 = 11,
            sdmmc2_d1 = 12,
            sai2_sd_a = 13,
            tim15_ch2 = 14,
            eventout = 15,
        };
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

        const P0 = enum(u4) {
            lptim1_in1 = 1,
            octospim_p1_io7 = 3,
            i2c3_scl = 4,
            spi2_rdy = 5,
            mdf1_sdi4 = 6,
            lpuart1_rx = 8,
            sdmmc1_d5 = 12,
            sai2_fs_a = 13,
            lptim2_in1 = 14,
            eventout = 15,
        };

        const P1 = enum(u4) {
            traced0 = 0,
            lptim1_ch1 = 1,
            spi2_mosi = 3,
            i2c3_sda = 4,
            mdf1_cki4 = 6,
            lpuart1_tx = 8,
            octospim_p1_io4 = 10,
            sdmmc2_ck = 12,
            sai1_sd_a = 13,
            eventout = 15,
        };

        const P2 = enum(u4) {
            lptim1_in2 = 1,
            spi2_miso = 5,
            mdf1_cck1 = 6,
            octospim_p1_io5 = 10,
            lpgpio1_p5 = 11,
            eventout = 15,
        };

        const P3 = enum(u4) {
            lptim1_etr = 1,
            lptim3_ch1 = 2,
            sai1_d1 = 3,
            spi2_mosi = 5,
            octospim_p1_io6 = 10,
            sai1_sd_a = 13,
            lptim2_etr = 14,
            eventout = 15,
        };

        const P4 = enum(u4) {
            usart3_tx = 7,
            octospim_p1_io7 = 10,
            eventout = 15,
        };

        const P5 = enum(u4) {
            tim1_ch4n = 1,
            sai1_d3 = 3,
            pssi_d15 = 4,
            usart3_rx = 7,
            eventout = 15,
        };

        const P6 = enum(u4) {
            clseep = 0,
            tim3_ch1 = 2,
            tim8_ch1 = 3,
            mdf1_cki3 = 6,
            sdmmc1_d0dir = 8,
            tsc_g4_io1 = 9,
            dcmi_d0_pssi_d0 = 10,
            sdmmc2_d6 = 11,
            sdmmc1_d6 = 12,
            sai2_mclk_a = 13,
            eventout = 15,
        };

        const P7 = enum(u4) {
            cdstop = 0,
            tim3_ch2 = 2,
            tim8_ch2 = 3,
            mdf1_sdi3 = 6,
            sdmmc1_d123dir = 8,
            tsc_g4_io2 = 9,
            dcmi_d1_pssi_d1 = 10,
            sdmmc2_d7 = 11,
            sdmmc1_d7 = 12,
            sai2_mclk_b = 13,
            lptim2_ch2 = 14,
            eventout = 15,
        };

        const P8 = enum(u4) {
            srdstop = 0,
            tim3_ch3 = 2,
            tim8_ch3 = 3,
            tsc_g4_io3 = 9,
            dcmi_d2_pssi_d2 = 10,
            sdmmc1_d0 = 12,
            lptim3_ch1 = 14,
            eventout = 15,
        };

        const P9 = enum(u4) {
            traced0 = 0,
            tim8_bkin2 = 1,
            tim3_ch4 = 2,
            tim8_ch4 = 3,
            dcmi_d3_pssi_d3 = 4,
            tsc_g4_io4 = 9,
            otg_fs_noe = 10,
            sdmmc1_d1 = 12,
            lptim3_ch2 = 14,
            eventout = 15,
        };

        const P10 = enum(u4) {
            traced1 = 0,
            lptim3_etr = 2,
            adf1_cck1 = 3,
            spi3_sck = 6,
            usart3_tx = 7,
            uart4_tx = 8,
            tsc_g3_io2 = 9,
            dcmi_d8_pssi_d8 = 10,
            lpgpio1_p8 = 11,
            sdmmc1_d2 = 12,
            sai2_sck_b = 13,
            eventout = 15,
        };

        const P11 = enum(u4) {
            lptim3_in1 = 2,
            adf1_sdi0 = 3,
            dcmi_d2_pssi_d2 = 4,
            octospim_p1_ncs = 5,
            spi3_miso = 6,
            usart3_rx = 7,
            uart4_rx = 8,
            tsc_g3_io3 = 9,
            dcmi_d4_pssi_d4 = 10,
            ucpd1_frstx2 = 11,
            sdmmc1_d3 = 12,
            sai2_mclk_b = 13,
            eventout = 15,
        };

        const P12 = enum(u4) {
            traced3 = 0,
            spi3_mosi = 6,
            usart3_ck = 7,
            uart5_tx = 8,
            tsc_g3_io4 = 9,
            dcmi_d9_pssi_d9 = 10,
            lpgpio1_p10 = 11,
            sdmmc1_ck = 12,
            sai2_sd_b = 13,
            eventout = 15,
        };

        const P13 = enum(u4) {
            eventout = 15,
        };

        const P14 = enum(u4) {
            eventout = 15,
        };

        const P15 = enum(u4) {
            eventout = 15,
        };
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

        const P0 = enum(u4) {
            tim8_ch4n = 3,
            spi2_nss = 5,
            fdcan1_rx = 9,
            fmc_d2_fmc_ad2 = 12,
            eventout = 15,
        };

        const P1 = enum(u4) {
            spi2_sck = 5,
            fdcan1_tx = 9,
            fmc_d3_fmc_ad3 = 12,
            eventout = 15,
        };

        const P2 = enum(u4) {
            traced2 = 0,
            tim3_etr = 2,
            usart3_rts_usart3_de = 7,
            uart5_rx = 8,
            tsc_sync = 9,
            dcmi_d11_pssi_d11 = 10,
            lpgpio1_p7 = 11,
            sdmmc1_cmd = 12,
            lptim4_etr = 13,
            eventout = 15,
        };

        const P3 = enum(u4) {
            spi2_sck = 3,
            dcmi_d5_pssi_d5 = 4,
            spi2_miso = 5,
            mdf1_sdi0 = 6,
            usart2_cts = 7,
            octospim_p2_ncs = 10,
            fmc_clk = 12,
            eventout = 15,
        };

        const P4 = enum(u4) {
            spi2_mosi = 5,
            mdf1_cki0 = 6,
            usart2_rts_usart2_de = 7,
            octospim_p1_io4 = 10,
            fmc_noe = 12,
            eventout = 15,
        };

        const P5 = enum(u4) {
            spi2_rdy = 5,
            usart2_tx = 7,
            octospim_p1_io5 = 10,
            fmc_nwe = 12,
            eventout = 15,
        };

        const P6 = enum(u4) {
            sai1_d1 = 3,
            dcmi_d10_pssi_d10 = 4,
            spi3_mosi = 5,
            mdf1_sdi1 = 6,
            usart2_rx = 7,
            octospim_p1_io6 = 10,
            sdmmc2_ck = 11,
            fmc_nwait = 12,
            sai1_sd_a = 13,
            eventout = 15,
        };

        const P7 = enum(u4) {
            mdf1_cki1 = 6,
            usart2_ck = 7,
            octospim_p1_io7 = 10,
            sdmmc2_cmd = 11,
            fmc_nce_fmc_ne1 = 12,
            lptim4_out = 13,
            eventout = 15,
        };

        const P8 = enum(u4) {
            usart3_tx = 7,
            dcmi_hsync_pssi_de = 10,
            fmc_d13_fmc_ad13 = 12,
            eventout = 15,
        };

        const P9 = enum(u4) {
            lptim2_in2 = 2,
            usart3_rx = 7,
            dcmi_pixclk_pssi_pdck = 10,
            fmc_d14_fmc_ad14 = 12,
            sai2_mclk_a = 13,
            lptim3_in1 = 14,
            eventout = 15,
        };

        const P10 = enum(u4) {
            lptim2_ch2 = 2,
            usart3_ck = 7,
            tsc_g6_io1 = 9,
            fmc_d15_fmc_ad15 = 12,
            sai2_sck_a = 13,
            lptim3_etr = 14,
            eventout = 15,
        };

        const P11 = enum(u4) {
            i2c4_smba = 4,
            usart3_cts = 7,
            tsc_g6_io2 = 9,
            fmc_cle_fmc_a16 = 12,
            sai2_sd_a = 13,
            lptim2_etr = 14,
            eventout = 15,
        };

        const P12 = enum(u4) {
            tim4_ch1 = 2,
            i2c4_scl = 4,
            usart3_rts_usart3_de = 7,
            tsc_g6_io3 = 9,
            fmc_ale_fmc_a17 = 12,
            sai2_fs_a = 13,
            lptim2_in1 = 14,
            eventout = 15,
        };

        const P13 = enum(u4) {
            tim4_ch2 = 2,
            i2c4_sda = 4,
            tsc_g6_io4 = 9,
            lpgpio1_p6 = 11,
            fmc_a18 = 12,
            lptim4_in1 = 13,
            lptim2_ch1 = 14,
            eventout = 15,
        };

        const P14 = enum(u4) {
            tim4_ch3 = 2,
            fmc_d0_fmc_ad0 = 12,
            lptim3_ch1 = 14,
            eventout = 15,
        };

        const P15 = enum(u4) {
            tim4_ch4 = 2,
            fmc_d1_fmc_ad1 = 12,
            lptim3_ch2 = 14,
            eventout = 15,
        };
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

        const P0 = enum(u4) {
            tim4_etr = 2,
            dcmi_d2_pssi_d2 = 10,
            lpgpio1_p13 = 11,
            fmc_nbl0 = 12,
            tim16_ch1 = 14,
            eventout = 15,
        };

        const P1 = enum(u4) {
            dcmi_d3_pssi_d3 = 10,
            fmc_nbl1 = 12,
            tim17_ch1 = 14,
            eventout = 15,
        };

        const P2 = enum(u4) {
            traceclk = 0,
            tim3_etr = 2,
            sai1_ck1 = 3,
            tsc_g7_io1 = 9,
            lpgpio1_p14 = 11,
            fmc_a23 = 12,
            sai1_mclk_a = 13,
            eventout = 15,
        };

        const P3 = enum(u4) {
            traced0 = 0,
            tim3_ch1 = 2,
            octospim_p1_dqs = 3,
            tsc_g7_io2 = 9,
            lpgpio1_p15 = 11,
            fmc_a19 = 12,
            sai1_sd_b = 13,
            eventout = 15,
        };

        const P4 = enum(u4) {
            traced1 = 0,
            tim3_ch2 = 2,
            sai1_d2 = 3,
            mdf1_sdi3 = 6,
            tsc_g7_io3 = 9,
            dcmi_d4_pssi_d4 = 10,
            fmc_a20 = 12,
            sai1_fs_a = 13,
            eventout = 15,
        };

        const P5 = enum(u4) {
            traced2 = 0,
            tim3_ch3 = 2,
            sai1_ck2 = 3,
            mdf1_cki3 = 6,
            tsc_g7_io4 = 9,
            dcmi_d6_pssi_d6 = 10,
            fmc_a21 = 12,
            sai1_sck_a = 13,
            eventout = 15,
        };

        const P6 = enum(u4) {
            traced3 = 0,
            tim3_ch4 = 2,
            sai1_d1 = 3,
            dcmi_d7_pssi_d7 = 10,
            fmc_a22 = 12,
            sai1_sd_a = 13,
            eventout = 15,
        };

        const P7 = enum(u4) {
            tim1_etr = 1,
            mdf1_sdi2 = 6,
            fmc_d4_fmc_ad4 = 12,
            sai1_sd_b = 13,
            eventout = 15,
        };

        const P8 = enum(u4) {
            tim1_ch1n = 1,
            mdf1_cki2 = 6,
            fmc_d5_fmc_ad5 = 12,
            sai1_sck_b = 13,
            eventout = 15,
        };

        const P9 = enum(u4) {
            tim1_ch1 = 1,
            adf1_cck0 = 3,
            mdf1_cck0 = 6,
            octospim_p1_nclk = 10,
            fmc_d6_fmc_ad6 = 12,
            sai1_fs_b = 13,
            eventout = 15,
        };

        const P10 = enum(u4) {
            tim1_ch2n = 1,
            adf1_sdi0 = 3,
            mdf1_sdi4 = 6,
            tsc_g5_io1 = 9,
            octospim_p1_clk = 10,
            fmc_d7_fmc_ad7 = 12,
            sai1_mclk_b = 13,
            eventout = 15,
        };

        const P11 = enum(u4) {
            tim1_ch2 = 1,
            spi1_rdy = 5,
            mdf1_cki4 = 6,
            tsc_g5_io2 = 9,
            octospim_p1_ncs = 10,
            fmc_d8_fmc_ad8 = 12,
            eventout = 15,
        };

        const P12 = enum(u4) {
            tim1_ch3n = 1,
            spi1_nss = 5,
            mdf1_sdi5 = 6,
            tsc_g5_io3 = 9,
            octospim_p1_io0 = 10,
            fmc_d9_fmc_ad9 = 12,
            eventout = 15,
        };

        const P13 = enum(u4) {
            tim1_ch3 = 1,
            spi1_sck = 5,
            mdf1_cki5 = 6,
            tsc_g5_io4 = 9,
            octospim_p1_io1 = 10,
            fmc_d10_fmc_ad10 = 12,
            eventout = 15,
        };

        const P14 = enum(u4) {
            tim1_ch4 = 1,
            tim1_bkin2 = 2,
            spi1_miso = 5,
            octospim_p1_io2 = 10,
            fmc_d11_fmc_ad11 = 12,
            eventout = 15,
        };

        const P15 = enum(u4) {
            tim1_bkin = 1,
            tim1_ch4n = 3,
            spi1_mosi = 5,
            octospim_p1_io3 = 10,
            fmc_d12_fmc_ad12 = 12,
            eventout = 15,
        };
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

        const P0 = enum(u4) {
            eventout = 15,
        };

        const P1 = enum(u4) {
            eventout = 15,
        };

        const P2 = enum(u4) {
            eventout = 15,
        };

        const P3 = enum(u4) {
            eventout = 15,
        };

        const P4 = enum(u4) {
            eventout = 15,
        };

        const P5 = enum(u4) {
            eventout = 15,
        };

        const P6 = enum(u4) {
            eventout = 15,
        };

        const P7 = enum(u4) {
            eventout = 15,
        };

        const P8 = enum(u4) {
            eventout = 15,
        };

        const P9 = enum(u4) {
            eventout = 15,
        };

        const P10 = enum(u4) {
            eventout = 15,
        };

        const P11 = enum(u4) {
            eventout = 15,
        };

        const P12 = enum(u4) {
            eventout = 15,
        };

        const P13 = enum(u4) {
            eventout = 15,
        };

        const P14 = enum(u4) {
            eventout = 15,
        };

        const P15 = enum(u4) {
            eventout = 15,
        };
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

        const P0 = enum(u4) {
            eventout = 15,
        };

        const P1 = enum(u4) {
            eventout = 15,
        };

        const P2 = enum(u4) {
            eventout = 15,
        };

        const P3 = enum(u4) {
            eventout = 15,
        };

        const P4 = enum(u4) {
            eventout = 15,
        };

        const P5 = enum(u4) {
            eventout = 15,
        };

        const P6 = enum(u4) {
            eventout = 15,
        };

        const P7 = enum(u4) {
            eventout = 15,
        };

        const P8 = enum(u4) {
            eventout = 15,
        };

        const P9 = enum(u4) {
            eventout = 15,
        };

        const P10 = enum(u4) {
            eventout = 15,
        };

        const P11 = enum(u4) {
            eventout = 15,
        };

        const P12 = enum(u4) {
            eventout = 15,
        };

        const P13 = enum(u4) {
            eventout = 15,
        };

        const P14 = enum(u4) {
            eventout = 15,
        };

        const P15 = enum(u4) {
            eventout = 15,
        };
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

        const P0 = enum(u4) {
            eventout = 15,
        };

        const P1 = enum(u4) {
            eventout = 15,
        };

        const P2 = enum(u4) {
            octospim_p1_io4 = 3,
            eventout = 15,
        };

        const P3 = enum(u4) {
            eventout = 15,
        };

        const P4 = enum(u4) {
            i2c2_scl = 4,
            octospim_p2_dqs = 5,
            pssi_d14 = 10,
            eventout = 15,
        };

        const P5 = enum(u4) {
            i2c2_sda = 4,
            dcmi_pixclk_pssi_pdck = 10,
            eventout = 15,
        };

        const P6 = enum(u4) {
            i2c2_smba = 4,
            octospim_p2_clk = 5,
            dcmi_d8_pssi_d8 = 10,
            eventout = 15,
        };

        const P7 = enum(u4) {
            i2c3_scl = 4,
            octospim_p2_nclk = 5,
            dcmi_d9_pssi_d9 = 10,
            eventout = 15,
        };

        const P8 = enum(u4) {
            i2c3_sda = 4,
            octospim_p2_io3 = 5,
            dcmi_hsync_pssi_de = 8,
            eventout = 15,
        };

        const P9 = enum(u4) {
            i2c3_smba = 4,
            octospim_p2_io4 = 5,
            dcmi_d0_pssi_d0 = 9,
            eventout = 15,
        };

        const P10 = enum(u4) {
            tim5_ch1 = 2,
            octospim_p2_io5 = 5,
            dcmi_d1_pssi_d1 = 10,
            eventout = 15,
        };

        const P11 = enum(u4) {
            tim5_ch2 = 2,
            octospim_p2_io6 = 5,
            dcmi_d2_pssi_d2 = 10,
            eventout = 15,
        };

        const P12 = enum(u4) {
            tim5_ch3 = 2,
            tim8_ch4n = 3,
            octospim_p2_io7 = 5,
            dcmi_d3_pssi_d3 = 10,
            eventout = 15,
        };

        const P13 = enum(u4) {
            tim8_ch1n = 3,
            fdcan1_tx = 9,
            eventout = 15,
        };

        const P14 = enum(u4) {
            tim8_ch2n = 3,
            fdcan1_rx = 9,
            dcmi_d4_pssi_d4 = 10,
            eventout = 15,
        };

        const P15 = enum(u4) {
            tim8_ch3n = 3,
            octospim_p2_io6 = 5,
            dcmi_d11_pssi_d11 = 10,
            eventout = 15,
        };
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

        const P0 = enum(u4) {
            eventout = 15,
        };

        const P1 = enum(u4) {
            eventout = 15,
        };

        const P2 = enum(u4) {
            eventout = 15,
        };

        const P3 = enum(u4) {
            eventout = 15,
        };

        const P4 = enum(u4) {
            eventout = 15,
        };

        const P5 = enum(u4) {
            eventout = 15,
        };

        const P6 = enum(u4) {
            eventout = 15,
        };

        const P7 = enum(u4) {
            eventout = 15,
        };

        const P8 = enum(u4) {
            eventout = 15,
        };

        const P9 = enum(u4) {
            eventout = 15,
        };

        const P10 = enum(u4) {
            eventout = 15,
        };

        const P11 = enum(u4) {
            eventout = 15,
        };

        const P12 = enum(u4) {
            eventout = 15,
        };

        const P13 = enum(u4) {
            eventout = 15,
        };

        const P14 = enum(u4) {
            eventout = 15,
        };

        const P15 = enum(u4) {
            eventout = 15,
        };
    };
};
