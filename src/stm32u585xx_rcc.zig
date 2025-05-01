const rcc_t = packed struct {
    cr: cr_t,
    _reserved0: u32,
    icscr1: icscr1_t,
    icscr2: icscr2_t,
    icscr3: icscr3_t,
    crrcr: crrcr_t,
    _reserved1: u32,
    cfgr1: cfgr1_t,
    cfgr2: cfgr2_t,
    cfgr3: cfgr3_t,
    pll1cfgr: pll1cfgr_t,
    pll2cfgr: pll2cfgr_t,
    pll3cfgr: pll3cfgr_t,
    pll1divr: pll1divr_t,
    pll1fracr: pll1fracr_t,
    pll2divr: pll2divr_t,
    pll2fracr: pll2fracr_t,
    pll3divr: pll3divr_t,
    pll3fracr: pll3fracr_t,
    _reserved2: u32,
    cier: cier_t,
    cifr: cifr_t,
    cicr: cicr_t,
    _reserved3: u32,
    ahb1rstr: ahb1rstr_t,
    ahb2rstr1: ahb2rstr1_t,
    ahb2rstr2: ahb2rstr2_t,
    ahb3rstr: ahb3rstr_t,
    _reserved4: u32,
    apb1rstr1: apb1rstr1_t,
    apb1rstr2: apb1rstr2_t,
    apb2rstr: apb2rstr_t,
    apb3rstr: apb3rstr_t,
    _reserved5: u32,
    ahb1enr: ahb1enr_t,
    ahb2enr1: ahb2enr1_t,
    ahb2enr2: ahb2enr2_t,
    ahb3enr: ahb3enr_t,
    _reserved6: u32,
    apb1enr1: apb1enr1_t,
    apb1enr2: apb1enr2_t,
    apb2enr: apb2enr_t,
    apb3enr: apb3enr_t,
    _reserved7: u32,
    ahb1smenr: ahb1smenr_t,
    ahb2smenr1: ahb2smenr1_t,
    ahb2smenr2: ahb2smenr2_t,
    ahb3smenr: ahb3smenr_t,
    _reserved8: u32,
    apb1smenr1: apb1smenr1_t,
    apb1smenr2: apb1smenr2_t,
    apb2smenr: apb2smenr_t,
    apb3smenr: apb3smenr_t,
    _reserved9: u32,
    srdamr: srdamr_t,
    _reserved10: u32,
    ccipr1: ccipr1_t,
    ccipr2: ccipr2_t,
    ccipr3: ccipr3_t,
    _reserved11: u32,
    bdcr: bdcr_t,
    csr: csr_t,
    _reserved12: u192,
    seccfgr: seccfgr_t,
    privcfgr: privcfgr_t,

    const cr_t = packed struct(u32) {
        msison: status_t,
        msikeron: status_t,
        msisrdy: rdy_t,
        msiplen: enable_t,
        msikon: status_t,
        msikrdy: rdy_t,
        msipllsel: u1,
        msipllfast: u1,
        hsion: status_t,
        hsikeron: status_t,
        hsirdy: rdy_t,
        _reserved0: u1,
        hsi48on: status_t,
        hsi48rdy: rdy_t,
        shsion: status_t,
        shsirdy: rdy_t,
        hseon: status_t,
        hserdy: rdy_t,
        hsebyp: u1,
        csson: status_t,
        hseext: u1,
        _reserved1: u3,
        pll1on: status_t,
        pll1rdy: rdy_t,
        pll2on: status_t,
        pll2rdy: rdy_t,
        pll3on: status_t,
        pll3rdy: rdy_t,
        _reserved2: u2,
    };

    const icscr1_t = packed struct(u32) {
        msical3: u5,
        msical2: u5,
        msical1: u5,
        msical0: u5,
        _reserved0: u2,
        msibias: u1,
        msirgsel: msirgsel_t,
        msikrange: msirange_t,
        msisrange: msirange_t,

        const msirgsel_t = enum(u1) {
            csr = 0b0,
            icscr1 = 0b1,
        };

        const msirange_t = enum(u4) {
            @"48MHz" = 0b0000,
            @"24MHz" = 0b0001,
            @"16MHz" = 0b0010,
            @"12MHz" = 0b0011,
            @"4MHz" = 0b0100,
            @"2MHz" = 0b0101,
            @"1.33MHz" = 0b0110,
            @"1MHz" = 0b0111,
            @"3.072MHz" = 0b1000,
            @"1.536MHz" = 0b1001,
            @"1.024MHz" = 0b1010,
            @"768kHz" = 0b1011,
            @"400kHz" = 0b1100,
            @"200kHz" = 0b1101,
            @"133kHz" = 0b1110,
            @"100kHz" = 0b1111,
        };
    };

    const icscr2_t = packed struct(u32) {
        msitrim3: u5,
        msitrim2: u5,
        msitrim1: u5,
        msitrim0: u5,
        _reserved0: u12,
    };

    const icscr3_t = packed struct(u32) {
        hsical: u12,
        _reserved0: u4,
        hsitrim: u5,
        _reserved1: u11,
    };

    const crrcr_t = packed struct(u32) {
        hsi48cal: u9,
        _reserved0: u23,
    };

    const cfgr1_t = packed struct(u32) {
        sw: sw_t,
        sws: sw_t,
        stopwuck: u1,
        stopkerwuck: u1,
        _reserved0: u18,
        mcosel: u4,
        mcopre: u3,
        _reserved1: u1,

        const sw_t = enum(u2) {
            msis = 0b00,
            hsi16 = 0b01,
            hse = 0b10,
            pll1_r_ck = 0b11,
        };
    };

    const cfgr2_t = packed struct(u32) {
        hpre: hpre_t,
        ppre1: ppre_t,
        _reserved0: u1,
        ppre2: ppre_t,
        _reserved1: u1,
        dpre: ppre_t,
        _reserved2: u1,
        ahb1dis: u1,
        ahb2dis1: u1,
        ahb2dis2: u1,
        apb1dis: u1,
        apb2dis: u1,
        _reserved3: u11,

        const hpre_t = enum(u4) {
            div1 = 0b0000,
            div2 = 0b1000,
            div4 = 0b1001,
            div8 = 0b1010,
            div16 = 0b1011,
            div64 = 0b1100,
            div128 = 0b1101,
            div256 = 0b1110,
            div512 = 0b1111,
        };

        const ppre_t = enum(u3) {
            div1 = 0b000,
            div2 = 0b100,
            div4 = 0b101,
            div8 = 0b110,
            div16 = 0b111,
        };
    };

    const cfgr3_t = packed struct(u32) {
        _reserved0: u4,
        ppre3: u3,
        _reserved1: u9,
        ahb3dis: u1,
        apb3dis: u1,
        _reserved2: u14,
    };

    const pll1cfgr_t = packed struct(u32) {
        pll1src: u2,
        pll1rge: u2,
        pll1fracen: enable_t,
        _reserved0: u3,
        pll1m: u4,
        pll1mboost: u4,
        pll1pen: enable_t,
        pll1qen: enable_t,
        pll1ren: enable_t,
        _reserved1: u13,
    };

    const pll2cfgr_t = packed struct(u32) {
        pll2src: u2,
        pll2rge: u2,
        pll2fracen: enable_t,
        _reserved0: u3,
        pll2m: u4,
        _reserved1: u4,
        pll2pen: enable_t,
        pll2qen: enable_t,
        pll2ren: enable_t,
        _reserved2: u13,
    };

    const pll3cfgr_t = packed struct(u32) {
        pll3src: u2,
        pll3rge: u2,
        pll3fracen: enable_t,
        _reserved0: u3,
        pll3m: u4,
        _reserved1: u4,
        pll3pen: enable_t,
        pll3qen: enable_t,
        pll3ren: enable_t,
        _reserved2: u13,
    };

    const pll1divr_t = packed struct(u32) {
        pll1n: u9,
        pll1p: u7,
        pll1q: u7,
        _reserved0: u1,
        pll1r: u7,
        _reserved1: u1,
    };

    const pll1fracr_t = packed struct(u32) {
        _reserved0: u3,
        pll1fracn: u13,
        _reserved1: u16,
    };

    const pll2divr_t = packed struct(u32) {
        pll2n: u9,
        pll2p: u7,
        pll2q: u7,
        _reserved0: u1,
        pll2r: u7,
        _reserved1: u1,
    };

    const pll2fracr_t = packed struct(u32) {
        _reserved0: u3,
        pll2fracn: u13,
        _reserved1: u16,
    };

    const pll3divr_t = packed struct(u32) {
        pll3n: u9,
        pll3p: u7,
        pll3q: u7,
        _reserved0: u1,
        pll3r: u7,
        _reserved1: u1,
    };

    const pll3fracr_t = packed struct(u32) {
        _reserved0: u3,
        pll3fracn: u13,
        _reserved1: u16,
    };

    const cier_t = packed struct(u32) {
        lsirdyie: u1,
        lserdyie: u1,
        msisrdyie: u1,
        hsirdyie: u1,
        hserdyie: u1,
        hsi48rdyie: u1,
        pll1rdyie: u1,
        pll2rdyie: u1,
        pll3rdyie: u1,
        _reserved0: u2,
        msikrdyie: u1,
        shsirdyie: u1,
        _reserved1: u19,
    };

    const cifr_t = packed struct(u32) {
        lsirdyf: u1,
        lserdyf: u1,
        msisrdyf: u1,
        hsirdyf: u1,
        hserdyf: u1,
        hsi48rdyf: u1,
        pll1rdyf: u1,
        pll2rdyf: u1,
        pll3rdyf: u1,
        _reserved0: u1,
        cssf: u1,
        msikrdyf: u1,
        shsirdyf: u1,
        _reserved1: u19,
    };

    const cicr_t = packed struct(u32) {
        lsirdyc: u1,
        lserdyc: u1,
        msisrdyc: u1,
        hsirdyc: u1,
        hserdyc: u1,
        hsi48rdyc: u1,
        pll1rdyc: u1,
        pll2rdyc: u1,
        pll3rdyc: u1,
        _reserved0: u1,
        cssc: u1,
        msikrdyc: u1,
        shsirdyc: u1,
        _reserved1: u19,
    };

    const ahb1rstr_t = packed struct(u32) {
        gpdma1rst: rst_t,
        cordicrst: rst_t,
        fmacrst: rst_t,
        _reserved0: u8,
        crcrst: rst_t,
        _reserved1: u2,
        jpegrst: rst_t,
        tscrst: rst_t,
        ramcfgrst: rst_t,
        dma2drst: rst_t,
        gfxmmurst: rst_t,
        gpu2drst: rst_t,
        _reserved2: u12,
    };

    const ahb2rstr1_t = packed struct(u32) {
        gpioarst: rst_t,
        gpiobrst: rst_t,
        gpiocrst: rst_t,
        gpiodrst: rst_t,
        gpioerst: rst_t,
        gpiofrst: rst_t,
        gpiogrst: rst_t,
        gpiohrst: rst_t,
        gpioirst: rst_t,
        gpiojrst: rst_t,
        adc12rst: rst_t,
        _reserved0: u1,
        dcmi_pssirst: rst_t,
        _reserved1: u1,
        otgrst: rst_t,
        _reserved2: u1,
        aesrst: rst_t,
        hashrst: rst_t,
        rngrst: rst_t,
        pkarst: rst_t,
        saesrst: rst_t,
        octospimrst: rst_t,
        _reserved3: u1,
        otfdec1rst: rst_t,
        otfdec2rst: rst_t,
        _reserved4: u2,
        sdmmc1rst: rst_t,
        sdmmc2rst: rst_t,
        _reserved5: u3,
    };

    const ahb2rstr2_t = packed struct(u32) {
        fsmcrst: rst_t,
        _reserved0: u3,
        octospi1rst: rst_t,
        _reserved1: u3,
        octospi2rst: rst_t,
        _reserved2: u3,
        hspi1rst: rst_t,
        _reserved3: u19,
    };

    const ahb3rstr_t = packed struct(u32) {
        lpgpio1rst: rst_t,
        _reserved0: u4,
        adc4rst: rst_t,
        dac1rst: rst_t,
        _reserved1: u2,
        lpdma1rst: rst_t,
        adf1rst: rst_t,
        _reserved2: u21,
    };

    const apb1rstr1_t = packed struct(u32) {
        tim2rst: rst_t,
        tim3rst: rst_t,
        tim4rst: rst_t,
        tim5rst: rst_t,
        tim6rst: rst_t,
        tim7rst: rst_t,
        _reserved0: u8,
        spi2rst: rst_t,
        _reserved1: u2,
        usart2rst: rst_t,
        usart3rst: rst_t,
        uart4rst: rst_t,
        uart5rst: rst_t,
        i2c1rst: rst_t,
        i2c2rst: rst_t,
        _reserved2: u1,
        crsrst: rst_t,
        usart6rst: rst_t,
        _reserved3: u6,
    };

    const apb1rstr2_t = packed struct(u32) {
        _reserved0: u1,
        i2c4rst: rst_t,
        _reserved1: u3,
        lptim2rst: rst_t,
        i2c5rst: rst_t,
        i2c6rst: rst_t,
        _reserved2: u1,
        fdcan1rst: rst_t,
        _reserved3: u13,
        ucpd1rst: rst_t,
        _reserved4: u8,
    };

    const apb2rstr_t = packed struct(u32) {
        _reserved0: u11,
        tim1rst: rst_t,
        spi1rst: rst_t,
        tim8rst: rst_t,
        usart1rst: rst_t,
        _reserved1: u1,
        tim15rst: rst_t,
        tim16rst: rst_t,
        tim17rst: rst_t,
        _reserved2: u2,
        sai1rst: rst_t,
        sai2rst: rst_t,
        _reserved3: u1,
        usbrst: rst_t,
        gfxtimrst: rst_t,
        ltdcrst: rst_t,
        dsirst: rst_t,
        _reserved4: u4,
    };

    const apb3rstr_t = packed struct(u32) {
        _reserved0: u1,
        syscfgrst: rst_t,
        _reserved1: u3,
        spi3rst: rst_t,
        lpuart1rst: rst_t,
        i2c3rst: rst_t,
        _reserved2: u3,
        lptim1rst: rst_t,
        lptim3rst: rst_t,
        lptim4rst: rst_t,
        opamprst: rst_t,
        comprst: rst_t,
        _reserved3: u4,
        vrefrst: rst_t,
        _reserved4: u11,
    };

    const ahb1enr_t = packed struct(u32) {
        gpdma1en: enable_t,
        cordicen: enable_t,
        fmacen: enable_t,
        mdf1en: enable_t,
        _reserved0: u4,
        flashen: enable_t,
        _reserved1: u3,
        crcen: enable_t,
        _reserved2: u2,
        jpegen: enable_t,
        tscen: enable_t,
        ramcfgen: enable_t,
        dma2den: enable_t,
        gfxmuen: enable_t,
        gpu2den: enable_t,
        dcache2en: enable_t,
        _reserved3: u2,
        gtzc1en: enable_t,
        _reserved4: u3,
        bkpsramen: enable_t,
        _reserved5: u1,
        dcache1en: enable_t,
        sram1en: enable_t,
    };

    const ahb2enr1_t = packed struct(u32) {
        gpioaen: enable_t,
        gpioben: enable_t,
        gpiocen: enable_t,
        gpioden: enable_t,
        gpioeen: enable_t,
        gpiofen: enable_t,
        gpiogen: enable_t,
        gpiohen: enable_t,
        gpioien: enable_t,
        gpiojen: enable_t,
        adc12en: enable_t,
        _reserved0: u1,
        dcmi_pssien: enable_t,
        _reserved1: u1,
        otgen: enable_t,
        otghsphyen: enable_t,
        aesen: enable_t,
        hashen: enable_t,
        rngen: enable_t,
        pkaen: enable_t,
        saesen: enable_t,
        octospimen: enable_t,
        _reserved2: u1,
        otfdec1en: enable_t,
        otfdec2en: enable_t,
        _reserved3: u2,
        sdmmc1en: enable_t,
        sdmmc2en: enable_t,
        _reserved4: u1,
        sram2en: enable_t,
        sram3en: enable_t,
    };

    const ahb2enr2_t = packed struct(u32) {
        fsmcen: enable_t,
        _reserved0: u3,
        octospi1en: enable_t,
        _reserved1: u3,
        octospi2en: enable_t,
        _reserved2: u3,
        hspi1en: enable_t,
        _reserved3: u17,
        sram6en: enable_t,
        sram5en: enable_t,
    };

    const ahb3enr_t = packed struct(u32) {
        lpgpio1en: enable_t,
        _reserved0: u1,
        pwren: enable_t,
        _reserved1: u2,
        adc4en: enable_t,
        dac1en: enable_t,
        _reserved2: u2,
        lpdma1en: enable_t,
        adf1en: enable_t,
        _reserved3: u1,
        gtzc2en: enable_t,
        _reserved4: u18,
        sram4en: enable_t,
    };

    const apb1enr1_t = packed struct(u32) {
        tim2en: enable_t,
        tim3en: enable_t,
        tim4en: enable_t,
        tim5en: enable_t,
        tim6en: enable_t,
        tim7en: enable_t,
        _reserved0: u5,
        wwdgen: enable_t,
        _reserved1: u2,
        spi2en: enable_t,
        _reserved2: u2,
        usart2en: enable_t,
        usart3en: enable_t,
        uart4en: enable_t,
        uart5en: enable_t,
        i2c1en: enable_t,
        i2c2en: enable_t,
        _reserved3: u1,
        crsen: enable_t,
        usart6en: enable_t,
        _reserved4: u6,
    };

    const apb1enr2_t = packed struct(u32) {
        _reserved0: u1,
        i2c4en: enable_t,
        _reserved1: u3,
        lptim2en: enable_t,
        i2c5en: enable_t,
        i2c6en: enable_t,
        _reserved2: u1,
        fdcan1en: enable_t,
        _reserved3: u13,
        ucpd1en: enable_t,
        _reserved4: u8,
    };

    const apb2enr_t = packed struct(u32) {
        _reserved0: u11,
        tim1en: enable_t,
        spi1en: enable_t,
        tim8en: enable_t,
        usart1en: enable_t,
        _reserved1: u1,
        tim15en: enable_t,
        tim16en: enable_t,
        tim17en: enable_t,
        _reserved2: u2,
        sai1en: enable_t,
        sai2en: enable_t,
        _reserved3: u1,
        usben: enable_t,
        gfxtimen: enable_t,
        ltdcen: enable_t,
        dsien: enable_t,
        _reserved4: u4,
    };

    const apb3enr_t = packed struct(u32) {
        _reserved0: u1,
        syscfgen: enable_t,
        _reserved1: u3,
        spi3en: enable_t,
        lpuart1en: enable_t,
        i2c3en: enable_t,
        _reserved2: u3,
        lptim1en: enable_t,
        lptim3en: enable_t,
        lptim4en: enable_t,
        opampen: enable_t,
        compen: enable_t,
        _reserved3: u4,
        vrefen: enable_t,
        rtcapben: enable_t,
        _reserved4: u10,
    };

    const ahb1smenr_t = packed struct(u32) {
        gpdma1smen: enable_t,
        cordicsmen: enable_t,
        fmacsmen: enable_t,
        mdf1smen: enable_t,
        _reserved0: u4,
        flashsmen: enable_t,
        _reserved1: u3,
        crcsmen: enable_t,
        _reserved2: u2,
        jpegsmen: enable_t,
        tscsmen: enable_t,
        ramcfgsmen: enable_t,
        dma2dsmen: enable_t,
        gfxmmusmen: enable_t,
        gpu2dsmen: enable_t,
        dcache2smen: enable_t,
        _reserved3: u2,
        gtzc1smen: enable_t,
        _reserved4: u3,
        bkpsramsmen: enable_t,
        icachesmen: enable_t,
        dcache1smen: enable_t,
        sram1smen: enable_t,
    };

    const ahb2smenr1_t = packed struct(u32) {
        gpioasmen: enable_t,
        gpiobsmen: enable_t,
        gpiocsmen: enable_t,
        gpiodsmen: enable_t,
        gpioesmen: enable_t,
        gpiofsmen: enable_t,
        gpiogsmen: enable_t,
        gpiohsmen: enable_t,
        gpioismen: enable_t,
        gpiojsmen: enable_t,
        adc12smen: enable_t,
        _reserved0: u1,
        dcmi_pssismen: enable_t,
        _reserved1: u1,
        otgsmen: enable_t,
        otghsphysmen: enable_t,
        aessmen: enable_t,
        hashsmen: enable_t,
        rngsmen: enable_t,
        pkasmen: enable_t,
        saessmen: enable_t,
        octospimsmen: enable_t,
        _reserved2: u1,
        otfdec1smen: enable_t,
        otfdec2smen: enable_t,
        _reserved3: u2,
        sdmmc1smen: enable_t,
        sdmmc2smen: enable_t,
        _reserved4: u1,
        sram2smen: enable_t,
        sram3smen: enable_t,
    };

    const ahb2smenr2_t = packed struct(u32) {
        fsmcsmen: enable_t,
        _reserved0: u3,
        octospi1smen: enable_t,
        _reserved1: u3,
        octospi2smen: enable_t,
        _reserved2: u3,
        hspi1smen: enable_t,
        _reserved3: u17,
        sram6smen: enable_t,
        sram5smen: enable_t,
    };

    const ahb3smenr_t = packed struct(u32) {
        lpgpio1smen: enable_t,
        _reserved0: u1,
        pwrsmen: enable_t,
        _reserved1: u2,
        adc4smen: enable_t,
        dac1smen: enable_t,
        _reserved2: u2,
        lpdma1smen: enable_t,
        adf1smen: enable_t,
        _reserved3: u1,
        gtzc2smen: enable_t,
        _reserved4: u18,
        sram4smen: enable_t,
    };

    const apb1smenr1_t = packed struct(u32) {
        tim2smen: enable_t,
        tim3smen: enable_t,
        tim4smen: enable_t,
        tim5smen: enable_t,
        tim6smen: enable_t,
        tim7smen: enable_t,
        _reserved0: u5,
        wwdgsmen: enable_t,
        _reserved1: u2,
        spi2smen: enable_t,
        _reserved2: u2,
        usart2smen: enable_t,
        usart3smen: enable_t,
        uart4smen: enable_t,
        uart5smen: enable_t,
        i2c1smen: enable_t,
        i2c2smen: enable_t,
        _reserved3: u1,
        crssmen: enable_t,
        usart6smen: enable_t,
        _reserved4: u6,
    };

    const apb1smenr2_t = packed struct(u32) {
        _reserved0: u1,
        i2c4smen: enable_t,
        _reserved1: u3,
        lptim2smen: enable_t,
        i2c5smen: enable_t,
        i2c6smen: enable_t,
        _reserved2: u1,
        fdcan1smen: enable_t,
        _reserved3: u13,
        ucpd1smen: enable_t,
        _reserved4: u8,
    };

    const apb2smenr_t = packed struct(u32) {
        _reserved0: u11,
        tim1smen: enable_t,
        spi1smen: enable_t,
        tim8smen: enable_t,
        usart1smen: enable_t,
        _reserved1: u1,
        tim15smen: enable_t,
        tim16smen: enable_t,
        tim17smen: enable_t,
        _reserved2: u2,
        sai1smen: enable_t,
        sai2smen: enable_t,
        _reserved3: u1,
        usbsmen: enable_t,
        gfxtimsmen: enable_t,
        ltdcsmen: enable_t,
        dsismen: enable_t,
        _reserved4: u4,
    };

    const apb3smenr_t = packed struct(u32) {
        _reserved0: u1,
        syscfgsmen: enable_t,
        _reserved1: u3,
        spi3smen: enable_t,
        lpuart1smen: enable_t,
        i2c3smen: enable_t,
        _reserved2: u3,
        lptim1smen: enable_t,
        lptim3smen: enable_t,
        lptim4smen: enable_t,
        opampsmen: enable_t,
        compsmen: enable_t,
        _reserved3: u4,
        vrefsmen: enable_t,
        rtcapbsmen: enable_t,
        _reserved4: u10,
    };

    const srdamr_t = packed struct(u32) {
        _reserved0: u5,
        spi3amen: enable_t,
        lpuart1amen: enable_t,
        i2c3amen: enable_t,
        _reserved1: u3,
        lptim1amen: enable_t,
        lptim3amen: enable_t,
        lptim4amen: enable_t,
        opampamen: enable_t,
        compamen: enable_t,
        _reserved2: u4,
        vrefamen: enable_t,
        rtcapbamen: enable_t,
        _reserved3: u3,
        adc4amen: enable_t,
        lpgpio1amen: enable_t,
        dac1amen: enable_t,
        lpdma1amen: enable_t,
        adf1amen: enable_t,
        _reserved4: u1,
        sram4amen: enable_t,
    };

    const ccipr1_t = packed struct(u32) {
        usart1sel: usart1sel_t,
        usart2sel: usart2sel_t,
        usart3sel: usart3sel_t,
        uart4sel: uart4sel_t,
        uart5sel: uart5sel_t,
        i2c1sel: i2c1sel_t,
        i2c2sel: i2c2sel_t,
        i2c4sel: i2c4sel_t,
        spi2sel: spi2sel_t,
        lptim2sel: lptim2sel_t,
        spi1sel: spi1sel_t,
        systicksel: systicksel_t,
        fdcan1sel: fdcan1sel_t,
        iclksel: iclksel_t,
        _reserved0: u1,
        timicsel: u3,

        const usart1sel_t = enum(u2) {
            pclk2 = 0b00,
            sysclk = 0b01,
            hsi16 = 0b10,
            lse = 0b11,
        };

        const usart2sel_t = enum(u2) {
            pclk1 = 0b00,
            sysclk = 0b01,
            hsi16 = 0b10,
            lse = 0b11,
        };

        const usart3sel_t = enum(u2) {
            pclk1 = 0b00,
            sysclk = 0b01,
            hsi16 = 0b10,
            lse = 0b11,
        };

        const uart4sel_t = enum(u2) {
            pclk1 = 0b00,
            sysclk = 0b01,
            hsi16 = 0b10,
            lse = 0b11,
        };

        const uart5sel_t = enum(u2) {
            pclk1 = 0b00,
            sysclk = 0b01,
            hsi16 = 0b10,
            lse = 0b11,
        };

        const i2c1sel_t = enum(u2) {
            pclk1 = 0b00,
            sysclk = 0b01,
            hsi16 = 0b10,
            msik = 0b11,
        };

        const i2c2sel_t = enum(u2) {
            pclk1 = 0b00,
            sysclk = 0b01,
            hsi16 = 0b10,
            msik = 0b11,
        };

        const i2c4sel_t = enum(u2) {
            pclk1 = 0b00,
            sysclk = 0b01,
            hsi16 = 0b10,
            msik = 0b11,
        };

        const spi2sel_t = enum(u2) {
            pclk1 = 0b00,
            sysclk = 0b01,
            hsi16 = 0b10,
            msik = 0b11,
        };

        const lptim2sel_t = enum(u2) {
            pclk1 = 0b00,
            lsi = 0b01,
            hsi16 = 0b10,
            lse = 0b11,
        };

        const spi1sel_t = enum(u2) {
            pclk2 = 0b00,
            sysclk = 0b01,
            hsi16 = 0b10,
            msik = 0b11,
        };

        const systicksel_t = enum(u2) {
            hclkdiv8 = 0b00,
            lsi = 0b01,
            lse = 0b10,
        };

        const fdcan1sel_t = enum(u2) {
            hse = 0b00,
            pll1q = 0b01,
            pll2p = 0b10,
        };

        const iclksel_t = enum(u2) {
            hse = 0b00,
            pll2q = 0b01,
            pll1q = 0b10,
            msik = 0b11,
        };
    };

    const ccipr2_t = packed struct(u32) {
        mdf1sel: u3,
        _reserved0: u2,
        sai1sel: u3,
        sai2sel: u3,
        saessel: u1,
        rngsel: u2,
        sdmmcsel: u1,
        dsisel: u1,
        usart6sel: u2,
        ltdcsel: u1,
        _reserved1: u1,
        octospiel: u2,
        hspi1sel: u2,
        i2c5sel: u2,
        i2c6sel: u2,
        _reserved2: u2,
        otghssel: u2,
    };

    const ccipr3_t = packed struct(u32) {
        lpuart1sel: u3,
        spi3sel: u2,
        _reserved0: u1,
        i2c3sel: u2,
        lptim34sel: u2,
        lptim1sel: u2,
        adcdacsel: u3,
        dac1sel: u1,
        adf1sel: u3,
        _reserved1: u13,
    };

    const bdcr_t = packed struct(u32) {
        lseon: status_t,
        lserdy: rdy_t,
        lsebyp: u1,
        lsedrv: u2,
        lsecsson: status_t,
        lsecssd: u1,
        lsesysen: enable_t,
        rtcsel: u2,
        _reserved0: u1,
        lsesysrdy: rdy_t,
        lsegfon: status_t,
        _reserved1: u2,
        rtcen: enable_t,
        bdrst: rst_t,
        _reserved2: u7,
        lscoen: enable_t,
        lscosel: u1,
        lsion: status_t,
        lsirdy: rdy_t,
        lsiprediv: u1,
        _reserved3: u3,
    };

    const csr_t = packed struct(u32) {
        _reserved0: u8,
        msiksrange: u4,
        msissrange: u4,
        _reserved1: u7,
        rmvf: u1,
        _reserved2: u1,
        oblrstf: u1,
        pinrstf: u1,
        borrstf: u1,
        sftrstf: u1,
        iwdgrstf: u1,
        wwdgrstf: u1,
        lpwrrstf: u1,
    };

    const seccfgr_t = packed struct(u32) {
        hsisec: u1,
        hsesec: u1,
        msisec: u1,
        lsisec: u1,
        lsesec: u1,
        sysclksec: u1,
        prescsec: u1,
        pll1sec: u1,
        pll2sec: u1,
        pll3sec: u1,
        iclksec: u1,
        hsi48sec: u1,
        rmvfsec: u1,
        _reserved0: u19,
    };

    const privcfgr_t = packed struct(u32) {
        spriv: u1,
        nspriv: u1,
        _reserved0: u30,
    };

    const status_t = enum(u1) {
        off = 0,
        on = 1,
    };

    const rdy_t = enum(u1) {
        notReady = 0,
        ready = 1,
    };

    const rst_t = enum(u1) {
        noClockReset = 0,
        resetClock = 1,
    };

    const enable_t = enum(u1) {
        disable = 0,
        enable = 1,
    };
};

const rcc_base: u32 = 0x46020c00;
pub const rcc: *volatile rcc_t = @ptrFromInt(rcc_base);
