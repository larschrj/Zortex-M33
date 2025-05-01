const gpio_moder_t = packed struct(u32) {
    moder0: gpio_mode,
    moder1: gpio_mode,
    moder2: gpio_mode,
    moder3: gpio_mode,
    moder4: gpio_mode,
    moder5: gpio_mode,
    moder6: gpio_mode,
    moder7: gpio_mode,
    moder8: gpio_mode,
    moder9: gpio_mode,
    moder10: gpio_mode,
    moder11: gpio_mode,
    moder12: gpio_mode,
    moder13: gpio_mode,
    moder14: gpio_mode,
    moder15: gpio_mode,

    const gpio_mode = enum(u2) {
        input = 0b00,
        output = 0b01,
        alternate_function = 0b10,
        analog = 0b11,
    };
};

const gpio_otyper_t = packed struct(u16) {
    ot0: gpio_otype,
    ot1: gpio_otype,
    ot2: gpio_otype,
    ot3: gpio_otype,
    ot4: gpio_otype,
    ot5: gpio_otype,
    ot6: gpio_otype,
    ot7: gpio_otype,
    ot8: gpio_otype,
    ot9: gpio_otype,
    ot10: gpio_otype,
    ot11: gpio_otype,
    ot12: gpio_otype,
    ot13: gpio_otype,
    ot14: gpio_otype,
    ot15: gpio_otype,

    const gpio_otype = enum(u1) {
        push_pull = 0b0,
        open_drain = 0b1,
    };
};

const gpio_ospeedr_t = packed struct(u32) {
    ospeedr0: gpio_ospeed,
    ospeedr1: gpio_ospeed,
    ospeedr2: gpio_ospeed,
    ospeedr3: gpio_ospeed,
    ospeedr4: gpio_ospeed,
    ospeedr5: gpio_ospeed,
    ospeedr6: gpio_ospeed,
    ospeedr7: gpio_ospeed,
    ospeedr8: gpio_ospeed,
    ospeedr9: gpio_ospeed,
    ospeedr10: gpio_ospeed,
    ospeedr11: gpio_ospeed,
    ospeedr12: gpio_ospeed,
    ospeedr13: gpio_ospeed,
    ospeedr14: gpio_ospeed,
    ospeedr15: gpio_ospeed,

    const gpio_ospeed = enum(u2) {
        low = 0b00,
        medium = 0b01,
        fast = 0b10,
        high = 0b11,
    };
};

const gpio_pupdr_t = packed struct(u32) {
    pupdr0: gpio_pupd,
    pupdr1: gpio_pupd,
    pupdr2: gpio_pupd,
    pupdr3: gpio_pupd,
    pupdr4: gpio_pupd,
    pupdr5: gpio_pupd,
    pupdr6: gpio_pupd,
    pupdr7: gpio_pupd,
    pupdr8: gpio_pupd,
    pupdr9: gpio_pupd,
    pupdr10: gpio_pupd,
    pupdr11: gpio_pupd,
    pupdr12: gpio_pupd,
    pupdr13: gpio_pupd,
    pupdr14: gpio_pupd,
    pupdr15: gpio_pupd,

    const gpio_pupd = enum(u2) {
        no_pullup_pulldown = 0b00,
        pullup = 0b01,
        pulldown = 0b10,
    };
};

const gpio_idr_t = packed struct(u16) {
    idr0: u1,
    idr1: u1,
    idr2: u1,
    idr3: u1,
    idr4: u1,
    idr5: u1,
    idr6: u1,
    idr7: u1,
    idr8: u1,
    idr9: u1,
    idr10: u1,
    idr11: u1,
    idr12: u1,
    idr13: u1,
    idr14: u1,
    idr15: u1,
};

const gpio_odr_t = packed struct(u16) {
    odr0: u1,
    odr1: u1,
    odr2: u1,
    odr3: u1,
    odr4: u1,
    odr5: u1,
    odr6: u1,
    odr7: u1,
    odr8: u1,
    odr9: u1,
    odr10: u1,
    odr11: u1,
    odr12: u1,
    odr13: u1,
    odr14: u1,
    odr15: u1,
};

const gpio_bsrr_t = packed struct(u32) {
    bs0: u1,
    bs1: u1,
    bs2: u1,
    bs3: u1,
    bs4: u1,
    bs5: u1,
    bs6: u1,
    bs7: u1,
    bs8: u1,
    bs9: u1,
    bs10: u1,
    bs11: u1,
    bs12: u1,
    bs13: u1,
    bs14: u1,
    bs15: u1,
    br0: u1,
    br1: u1,
    br2: u1,
    br3: u1,
    br4: u1,
    br5: u1,
    br6: u1,
    br7: u1,
    br8: u1,
    br9: u1,
    br10: u1,
    br11: u1,
    br12: u1,
    br13: u1,
    br14: u1,
    br15: u1,
};

const gpio_lckr_t = packed struct(u17) {
    lck0: u1,
    lck1: u1,
    lck2: u1,
    lck3: u1,
    lck4: u1,
    lck5: u1,
    lck6: u1,
    lck7: u1,
    lck8: u1,
    lck9: u1,
    lck10: u1,
    lck11: u1,
    lck12: u1,
    lck13: u1,
    lck14: u1,
    lck15: u1,
    lckk: u1,
};

const gpio_afr_t = packed struct(u64) {
    afr0: u4,
    afr1: u4,
    afr2: u4,
    afr3: u4,
    afr4: u4,
    afr5: u4,
    afr6: u4,
    afr7: u4,
    afr8: u4,
    afr9: u4,
    afr10: u4,
    afr11: u4,
    afr12: u4,
    afr13: u4,
    afr14: u4,
    afr15: u4,
};

const gpioa_afr_t = packed struct(u64) {
    afr0: gpioa_af_p0,
    afr1: gpioa_af_p1,
    afr2: gpioa_af_p2,
    afr3: gpioa_af_p3,
    afr4: gpioa_af_p4,
    afr5: gpioa_af_p5,
    afr6: gpioa_af_p6,
    afr7: gpioa_af_p7,
    afr8: gpioa_af_p8,
    afr9: gpioa_af_p9,
    afr10: gpioa_af_p10,
    afr11: gpioa_af_p11,
    afr12: gpioa_af_p12,
    afr13: gpioa_af_p13,
    afr14: gpioa_af_p14,
    afr15: gpioa_af_p15,

    const gpioa_af_p0 = enum(u4) {
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

    const gpioa_af_p1 = enum(u4) {
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

    const gpioa_af_p2 = enum(u4) {
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

    const gpioa_af_p3 = enum(u4) {
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

    const gpioa_af_p4 = enum(u4) {
        octospim_p1_ncs = 3,
        spi1_nss = 5,
        spi3_nss = 6,
        usart2_ck = 7,
        dcmi_hsync_pssi_de = 10,
        sai1_fs_b = 13,
        lptim2_ch1 = 14,
        eventout = 15,
    };

    const gpioa_af_p5 = enum(u4) {
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

    const gpioa_af_p6 = enum(u4) {
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

    const gpioa_af_p7 = enum(u4) {
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

    const gpioa_af_p8 = enum(u4) {
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

    const gpioa_af_p9 = enum(u4) {
        tim1_ch2 = 1,
        spi2_sck = 3,
        dcmi_d0_pssi_d0 = 5,
        usart1_tx = 7,
        sai1_fs_a = 13,
        tim15_bkin = 14,
        eventout = 15,
    };

    const gpioa_af_p10 = enum(u4) {
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

    const gpioa_af_p11 = enum(u4) {
        tim1_ch4 = 1,
        tim1_bkin2 = 2,
        spi1_miso = 5,
        usart1_cts = 7,
        fdcan1_rx = 9,
        eventout = 15,
    };

    const gpioa_af_p12 = enum(u4) {
        tim1_etr = 1,
        spi1_mosi = 5,
        octospim_p2_ncs = 6,
        usart1_rts = 7,
        fdcan1_tx = 9,
        eventout = 15,
    };

    const gpioa_af_p13 = enum(u4) {
        jtms_swdio = 0,
        ir_out = 1,
        otg_fs_noe = 10,
        sai1_sd_b = 13,
        eventout = 15,
    };

    const gpioa_af_p14 = enum(u4) {
        jtck_swclk = 0,
        lptim1_ch1 = 1,
        i2c1_smba = 4,
        i2c4_smba = 5,
        otg_fs_sof = 10,
        sai1_fs_b = 13,
        eventout = 15,
    };

    const gpioa_af_p15 = enum(u4) {
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

const gpiob_afr_t = packed struct(u64) {
    afr0: gpiob_af_p0,
    afr1: gpiob_af_p1,
    afr2: gpiob_af_p2,
    afr3: gpiob_af_p3,
    afr4: gpiob_af_p4,
    afr5: gpiob_af_p5,
    afr6: gpiob_af_p6,
    afr7: gpiob_af_p7,
    afr8: gpiob_af_p8,
    afr9: gpiob_af_p9,
    afr10: gpiob_af_p10,
    afr11: gpiob_af_p11,
    afr12: gpiob_af_p12,
    afr13: gpiob_af_p13,
    afr14: gpiob_af_p14,
    afr15: gpiob_af_p15,

    const gpiob_af_p0 = enum(u4) {
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

    const gpiob_af_p1 = enum(u4) {
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

    const gpiob_af_p2 = enum(u4) {
        lptim1_ch1 = 1,
        tim8_ch4n = 3,
        i2c3_smba = 4,
        spi1_rdy = 5,
        mdf1_cki0 = 6,
        octospim_p1_dqs = 10,
        ucpd1_frstx1 = 11,
        eventout = 15,
    };

    const gpiob_af_p3 = enum(u4) {
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

    const gpiob_af_p4 = enum(u4) {
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

    const gpiob_af_p5 = enum(u4) {
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

    const gpiob_af_p6 = enum(u4) {
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

    const gpiob_af_p7 = enum(u4) {
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

    const gpiob_af_p8 = enum(u4) {
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

    const gpiob_af_p9 = enum(u4) {
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

    const gpiob_af_p10 = enum(u4) {
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

    const gpiob_af_p11 = enum(u4) {
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

    const gpiob_af_p12 = enum(u4) {
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

    const gpiob_af_p13 = enum(u4) {
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

    const gpiob_af_p14 = enum(u4) {
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

    const gpiob_af_p15 = enum(u4) {
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

const gpioc_afr_t = packed struct(u64) {
    afr0: gpioc_af_p0,
    afr1: gpioc_af_p1,
    afr2: gpioc_af_p2,
    afr3: gpioc_af_p3,
    afr4: gpioc_af_p4,
    afr5: gpioc_af_p5,
    afr6: gpioc_af_p6,
    afr7: gpioc_af_p7,
    afr8: gpioc_af_p8,
    afr9: gpioc_af_p9,
    afr10: gpioc_af_p10,
    afr11: gpioc_af_p11,
    afr12: gpioc_af_p12,
    afr13: gpioc_af_p13,
    afr14: gpioc_af_p14,
    afr15: gpioc_af_p15,

    const gpioc_af_p0 = enum(u4) {
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

    const gpioc_af_p1 = enum(u4) {
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

    const gpioc_af_p2 = enum(u4) {
        lptim1_in2 = 1,
        spi2_miso = 5,
        mdf1_cck1 = 6,
        octospim_p1_io5 = 10,
        lpgpio1_p5 = 11,
        eventout = 15,
    };

    const gpioc_af_p3 = enum(u4) {
        lptim1_etr = 1,
        lptim3_ch1 = 2,
        sai1_d1 = 3,
        spi2_mosi = 5,
        octospim_p1_io6 = 10,
        sai1_sd_a = 13,
        lptim2_etr = 14,
        eventout = 15,
    };

    const gpioc_af_p4 = enum(u4) {
        usart3_tx = 7,
        octospim_p1_io7 = 10,
        eventout = 15,
    };

    const gpioc_af_p5 = enum(u4) {
        tim1_ch4n = 1,
        sai1_d3 = 3,
        pssi_d15 = 4,
        usart3_rx = 7,
        eventout = 15,
    };

    const gpioc_af_p6 = enum(u4) {
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

    const gpioc_af_p7 = enum(u4) {
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

    const gpioc_af_p8 = enum(u4) {
        srdstop = 0,
        tim3_ch3 = 2,
        tim8_ch3 = 3,
        tsc_g4_io3 = 9,
        dcmi_d2_pssi_d2 = 10,
        sdmmc1_d0 = 12,
        lptim3_ch1 = 14,
        eventout = 15,
    };

    const gpioc_af_p9 = enum(u4) {
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

    const gpioc_af_p10 = enum(u4) {
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

    const gpioc_af_p11 = enum(u4) {
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

    const gpioc_af_p12 = enum(u4) {
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

    const gpioc_af_p13 = enum(u4) {
        eventout = 15,
    };

    const gpioc_af_p14 = enum(u4) {
        eventout = 15,
    };

    const gpioc_af_p15 = enum(u4) {
        eventout = 15,
    };
};

const gpiod_afr_t = packed struct(u64) {
    afr0: gpiod_af_p0,
    afr1: gpiod_af_p1,
    afr2: gpiod_af_p2,
    afr3: gpiod_af_p3,
    afr4: gpiod_af_p4,
    afr5: gpiod_af_p5,
    afr6: gpiod_af_p6,
    afr7: gpiod_af_p7,
    afr8: gpiod_af_p8,
    afr9: gpiod_af_p9,
    afr10: gpiod_af_p10,
    afr11: gpiod_af_p11,
    afr12: gpiod_af_p12,
    afr13: gpiod_af_p13,
    afr14: gpiod_af_p14,
    afr15: gpiod_af_p15,

    const gpiod_af_p0 = enum(u4) {
        tim8_ch4n = 3,
        spi2_nss = 5,
        fdcan1_rx = 9,
        fmc_d2_fmc_ad2 = 12,
        eventout = 15,
    };

    const gpiod_af_p1 = enum(u4) {
        spi2_sck = 5,
        fdcan1_tx = 9,
        fmc_d3_fmc_ad3 = 12,
        eventout = 15,
    };

    const gpiod_af_p2 = enum(u4) {
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

    const gpiod_af_p3 = enum(u4) {
        spi2_sck = 3,
        dcmi_d5_pssi_d5 = 4,
        spi2_miso = 5,
        mdf1_sdi0 = 6,
        usart2_cts = 7,
        octospim_p2_ncs = 10,
        fmc_clk = 12,
        eventout = 15,
    };

    const gpiod_af_p4 = enum(u4) {
        spi2_mosi = 5,
        mdf1_cki0 = 6,
        usart2_rts_usart2_de = 7,
        octospim_p1_io4 = 10,
        fmc_noe = 12,
        eventout = 15,
    };

    const gpiod_af_p5 = enum(u4) {
        spi2_rdy = 5,
        usart2_tx = 7,
        octospim_p1_io5 = 10,
        fmc_nwe = 12,
        eventout = 15,
    };

    const gpiod_af_p6 = enum(u4) {
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

    const gpiod_af_p7 = enum(u4) {
        mdf1_cki1 = 6,
        usart2_ck = 7,
        octospim_p1_io7 = 10,
        sdmmc2_cmd = 11,
        fmc_nce_fmc_ne1 = 12,
        lptim4_out = 13,
        eventout = 15,
    };

    const gpiod_af_p8 = enum(u4) {
        usart3_tx = 7,
        dcmi_hsync_pssi_de = 10,
        fmc_d13_fmc_ad13 = 12,
        eventout = 15,
    };

    const gpiod_af_p9 = enum(u4) {
        lptim2_in2 = 2,
        usart3_rx = 7,
        dcmi_pixclk_pssi_pdck = 10,
        fmc_d14_fmc_ad14 = 12,
        sai2_mclk_a = 13,
        lptim3_in1 = 14,
        eventout = 15,
    };

    const gpiod_af_p10 = enum(u4) {
        lptim2_ch2 = 2,
        usart3_ck = 7,
        tsc_g6_io1 = 9,
        fmc_d15_fmc_ad15 = 12,
        sai2_sck_a = 13,
        lptim3_etr = 14,
        eventout = 15,
    };

    const gpiod_af_p11 = enum(u4) {
        i2c4_smba = 4,
        usart3_cts = 7,
        tsc_g6_io2 = 9,
        fmc_cle_fmc_a16 = 12,
        sai2_sd_a = 13,
        lptim2_etr = 14,
        eventout = 15,
    };

    const gpiod_af_p12 = enum(u4) {
        tim4_ch1 = 2,
        i2c4_scl = 4,
        usart3_rts_usart3_de = 7,
        tsc_g6_io3 = 9,
        fmc_ale_fmc_a17 = 12,
        sai2_fs_a = 13,
        lptim2_in1 = 14,
        eventout = 15,
    };

    const gpiod_af_p13 = enum(u4) {
        tim4_ch2 = 2,
        i2c4_sda = 4,
        tsc_g6_io4 = 9,
        lpgpio1_p6 = 11,
        fmc_a18 = 12,
        lptim4_in1 = 13,
        lptim2_ch1 = 14,
        eventout = 15,
    };

    const gpiod_af_p14 = enum(u4) {
        tim4_ch3 = 2,
        fmc_d0_fmc_ad0 = 12,
        lptim3_ch1 = 14,
        eventout = 15,
    };

    const gpiod_af_p15 = enum(u4) {
        tim4_ch4 = 2,
        fmc_d1_fmc_ad1 = 12,
        lptim3_ch2 = 14,
        eventout = 15,
    };
};

const gpioe_afr_t = packed struct(u64) {
    afr0: gpioe_af_p0,
    afr1: gpioe_af_p1,
    afr2: gpioe_af_p2,
    afr3: gpioe_af_p3,
    afr4: gpioe_af_p4,
    afr5: gpioe_af_p5,
    afr6: gpioe_af_p6,
    afr7: gpioe_af_p7,
    afr8: gpioe_af_p8,
    afr9: gpioe_af_p9,
    afr10: gpioe_af_p10,
    afr11: gpioe_af_p11,
    afr12: gpioe_af_p12,
    afr13: gpioe_af_p13,
    afr14: gpioe_af_p14,
    afr15: gpioe_af_p15,

    const gpioe_af_p0 = enum(u4) {
        tim4_etr = 2,
        dcmi_d2_pssi_d2 = 10,
        lpgpio1_p13 = 11,
        fmc_nbl0 = 12,
        tim16_ch1 = 14,
        eventout = 15,
    };

    const gpioe_af_p1 = enum(u4) {
        dcmi_d3_pssi_d3 = 10,
        fmc_nbl1 = 12,
        tim17_ch1 = 14,
        eventout = 15,
    };

    const gpioe_af_p2 = enum(u4) {
        traceclk = 0,
        tim3_etr = 2,
        sai1_ck1 = 3,
        tsc_g7_io1 = 9,
        lpgpio1_p14 = 11,
        fmc_a23 = 12,
        sai1_mclk_a = 13,
        eventout = 15,
    };

    const gpioe_af_p3 = enum(u4) {
        traced0 = 0,
        tim3_ch1 = 2,
        octospim_p1_dqs = 3,
        tsc_g7_io2 = 9,
        lpgpio1_p15 = 11,
        fmc_a19 = 12,
        sai1_sd_b = 13,
        eventout = 15,
    };

    const gpioe_af_p4 = enum(u4) {
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

    const gpioe_af_p5 = enum(u4) {
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

    const gpioe_af_p6 = enum(u4) {
        traced3 = 0,
        tim3_ch4 = 2,
        sai1_d1 = 3,
        dcmi_d7_pssi_d7 = 10,
        fmc_a22 = 12,
        sai1_sd_a = 13,
        eventout = 15,
    };

    const gpioe_af_p7 = enum(u4) {
        tim1_etr = 1,
        mdf1_sdi2 = 6,
        fmc_d4_fmc_ad4 = 12,
        sai1_sd_b = 13,
        eventout = 15,
    };

    const gpioe_af_p8 = enum(u4) {
        tim1_ch1n = 1,
        mdf1_cki2 = 6,
        fmc_d5_fmc_ad5 = 12,
        sai1_sck_b = 13,
        eventout = 15,
    };

    const gpioe_af_p9 = enum(u4) {
        tim1_ch1 = 1,
        adf1_cck0 = 3,
        mdf1_cck0 = 6,
        octospim_p1_nclk = 10,
        fmc_d6_fmc_ad6 = 12,
        sai1_fs_b = 13,
        eventout = 15,
    };

    const gpioe_af_p10 = enum(u4) {
        tim1_ch2n = 1,
        adf1_sdi0 = 3,
        mdf1_sdi4 = 6,
        tsc_g5_io1 = 9,
        octospim_p1_clk = 10,
        fmc_d7_fmc_ad7 = 12,
        sai1_mclk_b = 13,
        eventout = 15,
    };

    const gpioe_af_p11 = enum(u4) {
        tim1_ch2 = 1,
        spi1_rdy = 5,
        mdf1_cki4 = 6,
        tsc_g5_io2 = 9,
        octospim_p1_ncs = 10,
        fmc_d8_fmc_ad8 = 12,
        eventout = 15,
    };

    const gpioe_af_p12 = enum(u4) {
        tim1_ch3n = 1,
        spi1_nss = 5,
        mdf1_sdi5 = 6,
        tsc_g5_io3 = 9,
        octospim_p1_io0 = 10,
        fmc_d9_fmc_ad9 = 12,
        eventout = 15,
    };

    const gpioe_af_p13 = enum(u4) {
        tim1_ch3 = 1,
        spi1_sck = 5,
        mdf1_cki5 = 6,
        tsc_g5_io4 = 9,
        octospim_p1_io1 = 10,
        fmc_d10_fmc_ad10 = 12,
        eventout = 15,
    };

    const gpioe_af_p14 = enum(u4) {
        tim1_ch4 = 1,
        tim1_bkin2 = 2,
        spi1_miso = 5,
        octospim_p1_io2 = 10,
        fmc_d11_fmc_ad11 = 12,
        eventout = 15,
    };

    const gpioe_af_p15 = enum(u4) {
        tim1_bkin = 1,
        tim1_ch4n = 3,
        spi1_mosi = 5,
        octospim_p1_io3 = 10,
        fmc_d12_fmc_ad12 = 12,
        eventout = 15,
    };
};

const gpiof_afr_t = packed struct(u64) {
    afr0: gpiof_af_p0,
    afr1: gpiof_af_p1,
    afr2: gpiof_af_p2,
    afr3: gpiof_af_p3,
    afr4: gpiof_af_p4,
    afr5: gpiof_af_p5,
    afr6: gpiof_af_p6,
    afr7: gpiof_af_p7,
    afr8: gpiof_af_p8,
    afr9: gpiof_af_p9,
    afr10: gpiof_af_p10,
    afr11: gpiof_af_p11,
    afr12: gpiof_af_p12,
    afr13: gpiof_af_p13,
    afr14: gpiof_af_p14,
    afr15: gpiof_af_p15,

    const gpiof_af_p0 = enum(u4) {
        eventout = 15,
    };

    const gpiof_af_p1 = enum(u4) {
        eventout = 15,
    };

    const gpiof_af_p2 = enum(u4) {
        eventout = 15,
    };

    const gpiof_af_p3 = enum(u4) {
        eventout = 15,
    };

    const gpiof_af_p4 = enum(u4) {
        eventout = 15,
    };

    const gpiof_af_p5 = enum(u4) {
        eventout = 15,
    };

    const gpiof_af_p6 = enum(u4) {
        eventout = 15,
    };

    const gpiof_af_p7 = enum(u4) {
        eventout = 15,
    };

    const gpiof_af_p8 = enum(u4) {
        eventout = 15,
    };

    const gpiof_af_p9 = enum(u4) {
        eventout = 15,
    };

    const gpiof_af_p10 = enum(u4) {
        eventout = 15,
    };

    const gpiof_af_p11 = enum(u4) {
        eventout = 15,
    };

    const gpiof_af_p12 = enum(u4) {
        eventout = 15,
    };

    const gpiof_af_p13 = enum(u4) {
        eventout = 15,
    };

    const gpiof_af_p14 = enum(u4) {
        eventout = 15,
    };

    const gpiof_af_p15 = enum(u4) {
        eventout = 15,
    };
};

const gpiog_afr_t = packed struct(u64) {
    afr0: gpiog_af_p0,
    afr1: gpiog_af_p1,
    afr2: gpiog_af_p2,
    afr3: gpiog_af_p3,
    afr4: gpiog_af_p4,
    afr5: gpiog_af_p5,
    afr6: gpiog_af_p6,
    afr7: gpiog_af_p7,
    afr8: gpiog_af_p8,
    afr9: gpiog_af_p9,
    afr10: gpiog_af_p10,
    afr11: gpiog_af_p11,
    afr12: gpiog_af_p12,
    afr13: gpiog_af_p13,
    afr14: gpiog_af_p14,
    afr15: gpiog_af_p15,

    const gpiog_af_p0 = enum(u4) {
        eventout = 15,
    };

    const gpiog_af_p1 = enum(u4) {
        eventout = 15,
    };

    const gpiog_af_p2 = enum(u4) {
        eventout = 15,
    };

    const gpiog_af_p3 = enum(u4) {
        eventout = 15,
    };

    const gpiog_af_p4 = enum(u4) {
        eventout = 15,
    };

    const gpiog_af_p5 = enum(u4) {
        eventout = 15,
    };

    const gpiog_af_p6 = enum(u4) {
        eventout = 15,
    };

    const gpiog_af_p7 = enum(u4) {
        eventout = 15,
    };

    const gpiog_af_p8 = enum(u4) {
        eventout = 15,
    };

    const gpiog_af_p9 = enum(u4) {
        eventout = 15,
    };

    const gpiog_af_p10 = enum(u4) {
        eventout = 15,
    };

    const gpiog_af_p11 = enum(u4) {
        eventout = 15,
    };

    const gpiog_af_p12 = enum(u4) {
        eventout = 15,
    };

    const gpiog_af_p13 = enum(u4) {
        eventout = 15,
    };

    const gpiog_af_p14 = enum(u4) {
        eventout = 15,
    };

    const gpiog_af_p15 = enum(u4) {
        eventout = 15,
    };
};

const gpioh_afr_t = packed struct(u64) {
    afr0: gpioh_af_p0,
    afr1: gpioh_af_p1,
    afr2: gpioh_af_p2,
    afr3: gpioh_af_p3,
    afr4: gpioh_af_p4,
    afr5: gpioh_af_p5,
    afr6: gpioh_af_p6,
    afr7: gpioh_af_p7,
    afr8: gpioh_af_p8,
    afr9: gpioh_af_p9,
    afr10: gpioh_af_p10,
    afr11: gpioh_af_p11,
    afr12: gpioh_af_p12,
    afr13: gpioh_af_p13,
    afr14: gpioh_af_p14,
    afr15: gpioh_af_p15,

    const gpioh_af_p0 = enum(u4) {
        eventout = 15,
    };

    const gpioh_af_p1 = enum(u4) {
        eventout = 15,
    };

    const gpioh_af_p2 = enum(u4) {
        octospim_p1_io4 = 3,
        eventout = 15,
    };

    const gpioh_af_p3 = enum(u4) {
        eventout = 15,
    };

    const gpioh_af_p4 = enum(u4) {
        i2c2_scl = 4,
        octospim_p2_dqs = 5,
        pssi_d14 = 10,
        eventout = 15,
    };

    const gpioh_af_p5 = enum(u4) {
        i2c2_sda = 4,
        dcmi_pixclk_pssi_pdck = 10,
        eventout = 15,
    };

    const gpioh_af_p6 = enum(u4) {
        i2c2_smba = 4,
        octospim_p2_clk = 5,
        dcmi_d8_pssi_d8 = 10,
        eventout = 15,
    };

    const gpioh_af_p7 = enum(u4) {
        i2c3_scl = 4,
        octospim_p2_nclk = 5,
        dcmi_d9_pssi_d9 = 10,
        eventout = 15,
    };

    const gpioh_af_p8 = enum(u4) {
        i2c3_sda = 4,
        octospim_p2_io3 = 5,
        dcmi_hsync_pssi_de = 8,
        eventout = 15,
    };

    const gpioh_af_p9 = enum(u4) {
        i2c3_smba = 4,
        octospim_p2_io4 = 5,
        dcmi_d0_pssi_d0 = 9,
        eventout = 15,
    };

    const gpioh_af_p10 = enum(u4) {
        tim5_ch1 = 2,
        octospim_p2_io5 = 5,
        dcmi_d1_pssi_d1 = 10,
        eventout = 15,
    };

    const gpioh_af_p11 = enum(u4) {
        tim5_ch2 = 2,
        octospim_p2_io6 = 5,
        dcmi_d2_pssi_d2 = 10,
        eventout = 15,
    };

    const gpioh_af_p12 = enum(u4) {
        tim5_ch3 = 2,
        tim8_ch4n = 3,
        octospim_p2_io7 = 5,
        dcmi_d3_pssi_d3 = 10,
        eventout = 15,
    };

    const gpioh_af_p13 = enum(u4) {
        tim8_ch1n = 3,
        fdcan1_tx = 9,
        eventout = 15,
    };

    const gpioh_af_p14 = enum(u4) {
        tim8_ch2n = 3,
        fdcan1_rx = 9,
        dcmi_d4_pssi_d4 = 10,
        eventout = 15,
    };

    const gpioh_af_p15 = enum(u4) {
        tim8_ch3n = 3,
        octospim_p2_io6 = 5,
        dcmi_d11_pssi_d11 = 10,
        eventout = 15,
    };
};

const gpioi_afr_t = packed struct(u64) {
    afr0: gpioi_af_p0,
    afr1: gpioi_af_p1,
    afr2: gpioi_af_p2,
    afr3: gpioi_af_p3,
    afr4: gpioi_af_p4,
    afr5: gpioi_af_p5,
    afr6: gpioi_af_p6,
    afr7: gpioi_af_p7,
    afr8: gpioi_af_p8,
    afr9: gpioi_af_p9,
    afr10: gpioi_af_p10,
    afr11: gpioi_af_p11,
    afr12: gpioi_af_p12,
    afr13: gpioi_af_p13,
    afr14: gpioi_af_p14,
    afr15: gpioi_af_p15,

    const gpioi_af_p0 = enum(u4) {
        eventout = 15,
    };

    const gpioi_af_p1 = enum(u4) {
        eventout = 15,
    };

    const gpioi_af_p2 = enum(u4) {
        eventout = 15,
    };

    const gpioi_af_p3 = enum(u4) {
        eventout = 15,
    };

    const gpioi_af_p4 = enum(u4) {
        eventout = 15,
    };

    const gpioi_af_p5 = enum(u4) {
        eventout = 15,
    };

    const gpioi_af_p6 = enum(u4) {
        eventout = 15,
    };

    const gpioi_af_p7 = enum(u4) {
        eventout = 15,
    };

    const gpioi_af_p8 = enum(u4) {
        eventout = 15,
    };

    const gpioi_af_p9 = enum(u4) {
        eventout = 15,
    };

    const gpioi_af_p10 = enum(u4) {
        eventout = 15,
    };

    const gpioi_af_p11 = enum(u4) {
        eventout = 15,
    };

    const gpioi_af_p12 = enum(u4) {
        eventout = 15,
    };

    const gpioi_af_p13 = enum(u4) {
        eventout = 15,
    };

    const gpioi_af_p14 = enum(u4) {
        eventout = 15,
    };

    const gpioi_af_p15 = enum(u4) {
        eventout = 15,
    };
};

const gpio_brr_t = packed struct(u16) {
    br0: u1,
    br1: u1,
    br2: u1,
    br3: u1,
    br4: u1,
    br5: u1,
    br6: u1,
    br7: u1,
    br8: u1,
    br9: u1,
    br10: u1,
    br11: u1,
    br12: u1,
    br13: u1,
    br14: u1,
    br15: u1,
};

const gpio_hslvr_t = packed struct(u16) {
    hslv0: u1,
    hslv1: u1,
    hslv2: u1,
    hslv3: u1,
    hslv4: u1,
    hslv5: u1,
    hslv6: u1,
    hslv7: u1,
    hslv8: u1,
    hslv9: u1,
    hslv10: u1,
    hslv11: u1,
    hslv12: u1,
    hslv13: u1,
    hslv14: u1,
    hslv15: u1,
};

const gpio_seccfgr_t = packed struct(u16) {
    sec0: u1,
    sec1: u1,
    sec2: u1,
    sec3: u1,
    sec4: u1,
    sec5: u1,
    sec6: u1,
    sec7: u1,
    sec8: u1,
    sec9: u1,
    sec10: u1,
    sec11: u1,
    sec12: u1,
    sec13: u1,
    sec14: u1,
    sec15: u1,
};

const gpioa_t = packed struct {
    moder: gpio_moder_t,
    otyper: gpio_otyper_t,
    _reserved0: u16,
    ospeedr: gpio_ospeedr_t,
    pupdr: gpio_pupdr_t,
    idr: gpio_idr_t,
    _reserved1: u16,
    odr: gpio_odr_t,
    _reserved2: u16,
    bsrr: gpio_bsrr_t,
    lckr: gpio_lckr_t,
    _reserved3: u15,
    afr: gpioa_afr_t,
    brr: gpio_brr_t,
    _reserved4: u16,
    hslvr: gpio_hslvr_t,
    _reserved5: u16,
    seccfgr: gpio_seccfgr_t,
    _reserved6: u16,
};

const gpiob_t = packed struct {
    moder: gpio_moder_t,
    otyper: gpio_otyper_t,
    _reserved0: u16,
    ospeedr: gpio_ospeedr_t,
    pupdr: gpio_pupdr_t,
    idr: gpio_idr_t,
    _reserved1: u16,
    odr: gpio_odr_t,
    _reserved2: u16,
    bsrr: gpio_bsrr_t,
    lckr: gpio_lckr_t,
    _reserved3: u15,
    afr: gpiob_afr_t,
    brr: gpio_brr_t,
    _reserved4: u16,
    hslvr: gpio_hslvr_t,
    _reserved5: u16,
    seccfgr: gpio_seccfgr_t,
    _reserved6: u16,
};

const gpioc_t = packed struct {
    moder: gpio_moder_t,
    otyper: gpio_otyper_t,
    _reserved0: u16,
    ospeedr: gpio_ospeedr_t,
    pupdr: gpio_pupdr_t,
    idr: gpio_idr_t,
    _reserved1: u16,
    odr: gpio_odr_t,
    _reserved2: u16,
    bsrr: gpio_bsrr_t,
    lckr: gpio_lckr_t,
    _reserved3: u15,
    afr: gpioc_afr_t,
    brr: gpio_brr_t,
    _reserved4: u16,
    hslvr: gpio_hslvr_t,
    _reserved5: u16,
    seccfgr: gpio_seccfgr_t,
    _reserved6: u16,
};

const gpiod_t = packed struct {
    moder: gpio_moder_t,
    otyper: gpio_otyper_t,
    _reserved0: u16,
    ospeedr: gpio_ospeedr_t,
    pupdr: gpio_pupdr_t,
    idr: gpio_idr_t,
    _reserved1: u16,
    odr: gpio_odr_t,
    _reserved2: u16,
    bsrr: gpio_bsrr_t,
    lckr: gpio_lckr_t,
    _reserved3: u15,
    afr: gpiod_afr_t,
    brr: gpio_brr_t,
    _reserved4: u16,
    hslvr: gpio_hslvr_t,
    _reserved5: u16,
    seccfgr: gpio_seccfgr_t,
    _reserved6: u16,
};

const gpioe_t = packed struct {
    moder: gpio_moder_t,
    otyper: gpio_otyper_t,
    _reserved0: u16,
    ospeedr: gpio_ospeedr_t,
    pupdr: gpio_pupdr_t,
    idr: gpio_idr_t,
    _reserved1: u16,
    odr: gpio_odr_t,
    _reserved2: u16,
    bsrr: gpio_bsrr_t,
    lckr: gpio_lckr_t,
    _reserved3: u15,
    afr: gpioe_afr_t,
    brr: gpio_brr_t,
    _reserved4: u16,
    hslvr: gpio_hslvr_t,
    _reserved5: u16,
    seccfgr: gpio_seccfgr_t,
    _reserved6: u16,
};

const gpiof_t = packed struct {
    moder: gpio_moder_t,
    otyper: gpio_otyper_t,
    _reserved0: u16,
    ospeedr: gpio_ospeedr_t,
    pupdr: gpio_pupdr_t,
    idr: gpio_idr_t,
    _reserved1: u16,
    odr: gpio_odr_t,
    _reserved2: u16,
    bsrr: gpio_bsrr_t,
    lckr: gpio_lckr_t,
    _reserved3: u15,
    afr: gpiof_afr_t,
    brr: gpio_brr_t,
    _reserved4: u16,
    hslvr: gpio_hslvr_t,
    _reserved5: u16,
    seccfgr: gpio_seccfgr_t,
    _reserved6: u16,
};

const gpiog_t = packed struct {
    moder: gpio_moder_t,
    otyper: gpio_otyper_t,
    _reserved0: u16,
    ospeedr: gpio_ospeedr_t,
    pupdr: gpio_pupdr_t,
    idr: gpio_idr_t,
    _reserved1: u16,
    odr: gpio_odr_t,
    _reserved2: u16,
    bsrr: gpio_bsrr_t,
    lckr: gpio_lckr_t,
    _reserved3: u15,
    afr: gpiog_afr_t,
    brr: gpio_brr_t,
    _reserved4: u16,
    hslvr: gpio_hslvr_t,
    _reserved5: u16,
    seccfgr: gpio_seccfgr_t,
    _reserved6: u16,
};

const gpioh_t = packed struct {
    moder: gpio_moder_t,
    otyper: gpio_otyper_t,
    _reserved0: u16,
    ospeedr: gpio_ospeedr_t,
    pupdr: gpio_pupdr_t,
    idr: gpio_idr_t,
    _reserved1: u16,
    odr: gpio_odr_t,
    _reserved2: u16,
    bsrr: gpio_bsrr_t,
    lckr: gpio_lckr_t,
    _reserved3: u15,
    afr: gpioh_afr_t,
    brr: gpio_brr_t,
    _reserved4: u16,
    hslvr: gpio_hslvr_t,
    _reserved5: u16,
    seccfgr: gpio_seccfgr_t,
    _reserved6: u16,
};

const gpioi_t = packed struct {
    moder: gpio_moder_t,
    otyper: gpio_otyper_t,
    _reserved0: u16,
    ospeedr: gpio_ospeedr_t,
    pupdr: gpio_pupdr_t,
    idr: gpio_idr_t,
    _reserved1: u16,
    odr: gpio_odr_t,
    _reserved2: u16,
    bsrr: gpio_bsrr_t,
    lckr: gpio_lckr_t,
    _reserved3: u15,
    afr: gpioi_afr_t,
    brr: gpio_brr_t,
    _reserved4: u16,
    hslvr: gpio_hslvr_t,
    _reserved5: u16,
    seccfgr: gpio_seccfgr_t,
    _reserved6: u16,
};

const gpioa_base = 0x42020000;
const gpiob_base = 0x42020400;
const gpioc_base = 0x42020800;
const gpiod_base = 0x42020c00;
const gpioe_base = 0x42021000;
const gpiof_base = 0x42021400;
const gpiog_base = 0x42021800;
const gpioh_base = 0x42021c00;
const gpioi_base = 0x42022000;

pub const gpioa: *volatile gpioa_t = @ptrFromInt(gpioa_base);
pub const gpiob: *volatile gpiob_t = @ptrFromInt(gpiob_base);
pub const gpioc: *volatile gpioc_t = @ptrFromInt(gpioc_base);
pub const gpiod: *volatile gpiod_t = @ptrFromInt(gpiod_base);
pub const gpioe: *volatile gpioe_t = @ptrFromInt(gpioe_base);
pub const gpiof: *volatile gpiof_t = @ptrFromInt(gpiof_base);
pub const gpiog: *volatile gpiog_t = @ptrFromInt(gpiog_base);
pub const gpioh: *volatile gpioh_t = @ptrFromInt(gpioh_base);
pub const gpioi: *volatile gpioi_t = @ptrFromInt(gpioi_base);
