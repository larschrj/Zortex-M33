pub const Rcc = packed struct {
    cr: Cr,
    _reserved0: u32,
    icscr1: Icscr1,
    icscr2: Icscr2,
    icscr3: Icscr3,
    crrcr: Crrcr,
    _reserved1: u32,
    cfgr1: Cfgr1,
    cfgr2: Cfgr2,
    cfgr3: Cfgr3,
    pll1cfgr: Pll1cfgr,
    pll2cfgr: Pll2cfgr,
    pll3cfgr: Pll3cfgr,
    pll1divr: Pll1divr,
    pll1fracr: Pll1fracr,
    pll2divr: Pll2divr,
    pll2fracr: Pll2fracr,
    pll3divr: Pll3divr,
    pll3fracr: Pll3fracr,
    _reserved2: u32,
    cier: Cier,
    cifr: Cifr,
    cicr: Cicr,
    _reserved3: u32,
    ahb1rstr: Ahb1rstr,
    ahb2rstr1: Ahb2rstr1,
    ahb2rstr2: Ahb2rstr2,
    ahb3rstr: Ahb3rstr,
    _reserved4: u32,
    apb1rstr1: Apb1rstr1,
    apb1rstr2: Apb1rstr2,
    apb2rstr: Apb2rstr,
    apb3rstr: Apb3rstr,
    _reserved5: u32,
    ahb1enr: Ahb1enr,
    ahb2enr1: Ahb2enr1,
    ahb2enr2: Ahb2enr2,
    ahb3enr: Ahb3enr,
    _reserved6: u32,
    apb1enr1: Apb1enr1,
    apb1enr2: Apb1enr2,
    apb2enr: Apb2enr,
    apb3enr: Apb3enr,
    _reserved7: u32,
    ahb1smenr: Ahb1smenr,
    ahb2smenr1: Ahb2smenr1,
    ahb2smenr2: Ahb2smenr2,
    ahb3smenr: Ahb3smenr,
    _reserved8: u32,
    apb1smenr1: Apb1smenr1,
    apb1smenr2: Apb1smenr2,
    apb2smenr: Apb2smenr,
    apb3smenr: Apb3smenr,
    _reserved9: u32,
    srdamr: Srdamr,
    _reserved10: u32,
    ccipr1: Ccipr1,
    ccipr2: Ccipr2,
    ccipr3: Ccipr3,
    _reserved11: u32,
    bdcr: Bdcr,
    csr: Csr,
    _reserved12: u192,
    seccfgr: Seccfgr,
    privcfgr: Privcfgr,

    const Cr = packed struct(u32) {
        msison: Status,
        msikeron: Status,
        msisrdy: Rdy,
        msiplen: Enable,
        msikon: Status,
        msikrdy: Rdy,
        msipllsel: u1,
        msipllfast: u1,
        hsion: Status,
        hsikeron: Status,
        hsirdy: Rdy,
        _reserved0: u1,
        hsi48on: Status,
        hsi48rdy: Rdy,
        shsion: Status,
        shsirdy: Rdy,
        hseon: Status,
        hserdy: Rdy,
        hsebyp: u1,
        csson: Status,
        hseext: u1,
        _reserved1: u3,
        pll1on: Status,
        pll1rdy: Rdy,
        pll2on: Status,
        pll2rdy: Rdy,
        pll3on: Status,
        pll3rdy: Rdy,
        _reserved2: u2,
    };

    const Icscr1 = packed struct(u32) {
        msical3: u5,
        msical2: u5,
        msical1: u5,
        msical0: u5,
        _reserved0: u2,
        msibias: u1,
        msirgsel: Msirgsel,
        msikrange: Msirange,
        msisrange: Msirange,

        const Msirgsel = enum(u1) {
            csr = 0b0,
            icscr1 = 0b1,
        };

        const Msirange = enum(u4) {
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

    const Icscr2 = packed struct(u32) {
        msitrim3: u5,
        msitrim2: u5,
        msitrim1: u5,
        msitrim0: u5,
        _reserved0: u12,
    };

    const Icscr3 = packed struct(u32) {
        hsical: u12,
        _reserved0: u4,
        hsitrim: u5,
        _reserved1: u11,
    };

    const Crrcr = packed struct(u32) {
        hsi48cal: u9,
        _reserved0: u23,
    };

    const Cfgr1 = packed struct(u32) {
        sw: Sw,
        sws: Sw,
        stopwuck: u1,
        stopkerwuck: u1,
        _reserved0: u18,
        mcosel: u4,
        mcopre: u3,
        _reserved1: u1,

        const Sw = enum(u2) {
            msis = 0b00,
            hsi16 = 0b01,
            hse = 0b10,
            pll1_r_ck = 0b11,
        };
    };

    const Cfgr2 = packed struct(u32) {
        hpre: Hpre,
        ppre1: Ppre,
        _reserved0: u1,
        ppre2: Ppre,
        _reserved1: u1,
        dpre: Ppre,
        _reserved2: u1,
        ahb1dis: u1,
        ahb2dis1: u1,
        ahb2dis2: u1,
        apb1dis: u1,
        apb2dis: u1,
        _reserved3: u11,

        const Hpre = enum(u4) {
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

        const Ppre = enum(u3) {
            div1 = 0b000,
            div2 = 0b100,
            div4 = 0b101,
            div8 = 0b110,
            div16 = 0b111,
        };
    };

    const Cfgr3 = packed struct(u32) {
        _reserved0: u4,
        ppre3: u3,
        _reserved1: u9,
        ahb3dis: u1,
        apb3dis: u1,
        _reserved2: u14,
    };

    const Pll1cfgr = packed struct(u32) {
        pll1src: u2,
        pll1rge: u2,
        pll1fracen: Enable,
        _reserved0: u3,
        pll1m: u4,
        pll1mboost: u4,
        pll1pen: Enable,
        pll1qen: Enable,
        pll1ren: Enable,
        _reserved1: u13,
    };

    const Pll2cfgr = packed struct(u32) {
        pll2src: u2,
        pll2rge: u2,
        pll2fracen: Enable,
        _reserved0: u3,
        pll2m: u4,
        _reserved1: u4,
        pll2pen: Enable,
        pll2qen: Enable,
        pll2ren: Enable,
        _reserved2: u13,
    };

    const Pll3cfgr = packed struct(u32) {
        pll3src: u2,
        pll3rge: u2,
        pll3fracen: Enable,
        _reserved0: u3,
        pll3m: u4,
        _reserved1: u4,
        pll3pen: Enable,
        pll3qen: Enable,
        pll3ren: Enable,
        _reserved2: u13,
    };

    const Pll1divr = packed struct(u32) {
        pll1n: u9,
        pll1p: u7,
        pll1q: u7,
        _reserved0: u1,
        pll1r: u7,
        _reserved1: u1,
    };

    const Pll1fracr = packed struct(u32) {
        _reserved0: u3,
        pll1fracn: u13,
        _reserved1: u16,
    };

    const Pll2divr = packed struct(u32) {
        pll2n: u9,
        pll2p: u7,
        pll2q: u7,
        _reserved0: u1,
        pll2r: u7,
        _reserved1: u1,
    };

    const Pll2fracr = packed struct(u32) {
        _reserved0: u3,
        pll2fracn: u13,
        _reserved1: u16,
    };

    const Pll3divr = packed struct(u32) {
        pll3n: u9,
        pll3p: u7,
        pll3q: u7,
        _reserved0: u1,
        pll3r: u7,
        _reserved1: u1,
    };

    const Pll3fracr = packed struct(u32) {
        _reserved0: u3,
        pll3fracn: u13,
        _reserved1: u16,
    };

    const Cier = packed struct(u32) {
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

    const Cifr = packed struct(u32) {
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

    const Cicr = packed struct(u32) {
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

    const Ahb1rstr = packed struct(u32) {
        gpdma1rst: Rst,
        cordicrst: Rst,
        fmacrst: Rst,
        _reserved0: u8,
        crcrst: Rst,
        _reserved1: u2,
        jpegrst: Rst,
        tscrst: Rst,
        ramcfgrst: Rst,
        dma2drst: Rst,
        gfxmmurst: Rst,
        gpu2drst: Rst,
        _reserved2: u12,
    };

    const Ahb2rstr1 = packed struct(u32) {
        gpioarst: Rst,
        gpiobrst: Rst,
        gpiocrst: Rst,
        gpiodrst: Rst,
        gpioerst: Rst,
        gpiofrst: Rst,
        gpiogrst: Rst,
        gpiohrst: Rst,
        gpioirst: Rst,
        gpiojrst: Rst,
        adc12rst: Rst,
        _reserved0: u1,
        dcmi_pssirst: Rst,
        _reserved1: u1,
        otgrst: Rst,
        _reserved2: u1,
        aesrst: Rst,
        hashrst: Rst,
        rngrst: Rst,
        pkarst: Rst,
        saesrst: Rst,
        octospimrst: Rst,
        _reserved3: u1,
        otfdec1rst: Rst,
        otfdec2rst: Rst,
        _reserved4: u2,
        sdmmc1rst: Rst,
        sdmmc2rst: Rst,
        _reserved5: u3,
    };

    const Ahb2rstr2 = packed struct(u32) {
        fsmcrst: Rst,
        _reserved0: u3,
        octospi1rst: Rst,
        _reserved1: u3,
        octospi2rst: Rst,
        _reserved2: u3,
        hspi1rst: Rst,
        _reserved3: u19,
    };

    const Ahb3rstr = packed struct(u32) {
        lpgpio1rst: Rst,
        _reserved0: u4,
        adc4rst: Rst,
        dac1rst: Rst,
        _reserved1: u2,
        lpdma1rst: Rst,
        adf1rst: Rst,
        _reserved2: u21,
    };

    const Apb1rstr1 = packed struct(u32) {
        tim2rst: Rst,
        tim3rst: Rst,
        tim4rst: Rst,
        tim5rst: Rst,
        tim6rst: Rst,
        tim7rst: Rst,
        _reserved0: u8,
        spi2rst: Rst,
        _reserved1: u2,
        usart2rst: Rst,
        usart3rst: Rst,
        uart4rst: Rst,
        uart5rst: Rst,
        i2c1rst: Rst,
        i2c2rst: Rst,
        _reserved2: u1,
        crsrst: Rst,
        usart6rst: Rst,
        _reserved3: u6,
    };

    const Apb1rstr2 = packed struct(u32) {
        _reserved0: u1,
        i2c4rst: Rst,
        _reserved1: u3,
        lptim2rst: Rst,
        i2c5rst: Rst,
        i2c6rst: Rst,
        _reserved2: u1,
        fdcan1rst: Rst,
        _reserved3: u13,
        ucpd1rst: Rst,
        _reserved4: u8,
    };

    const Apb2rstr = packed struct(u32) {
        _reserved0: u11,
        tim1rst: Rst,
        spi1rst: Rst,
        tim8rst: Rst,
        usart1rst: Rst,
        _reserved1: u1,
        tim15rst: Rst,
        tim16rst: Rst,
        tim17rst: Rst,
        _reserved2: u2,
        sai1rst: Rst,
        sai2rst: Rst,
        _reserved3: u1,
        usbrst: Rst,
        gfxtimrst: Rst,
        ltdcrst: Rst,
        dsirst: Rst,
        _reserved4: u4,
    };

    const Apb3rstr = packed struct(u32) {
        _reserved0: u1,
        syscfgrst: Rst,
        _reserved1: u3,
        spi3rst: Rst,
        lpuart1rst: Rst,
        i2c3rst: Rst,
        _reserved2: u3,
        lptim1rst: Rst,
        lptim3rst: Rst,
        lptim4rst: Rst,
        opamprst: Rst,
        comprst: Rst,
        _reserved3: u4,
        vrefrst: Rst,
        _reserved4: u11,
    };

    const Ahb1enr = packed struct(u32) {
        gpdma1en: Enable,
        cordicen: Enable,
        fmacen: Enable,
        mdf1en: Enable,
        _reserved0: u4,
        flashen: Enable,
        _reserved1: u3,
        crcen: Enable,
        _reserved2: u2,
        jpegen: Enable,
        tscen: Enable,
        ramcfgen: Enable,
        dma2den: Enable,
        gfxmuen: Enable,
        gpu2den: Enable,
        dcache2en: Enable,
        _reserved3: u2,
        gtzc1en: Enable,
        _reserved4: u3,
        bkpsramen: Enable,
        _reserved5: u1,
        dcache1en: Enable,
        sram1en: Enable,
    };

    const Ahb2enr1 = packed struct(u32) {
        gpioaen: Enable,
        gpioben: Enable,
        gpiocen: Enable,
        gpioden: Enable,
        gpioeen: Enable,
        gpiofen: Enable,
        gpiogen: Enable,
        gpiohen: Enable,
        gpioien: Enable,
        gpiojen: Enable,
        adc12en: Enable,
        _reserved0: u1,
        dcmi_pssien: Enable,
        _reserved1: u1,
        otgen: Enable,
        otghsphyen: Enable,
        aesen: Enable,
        hashen: Enable,
        rngen: Enable,
        pkaen: Enable,
        saesen: Enable,
        octospimen: Enable,
        _reserved2: u1,
        otfdec1en: Enable,
        otfdec2en: Enable,
        _reserved3: u2,
        sdmmc1en: Enable,
        sdmmc2en: Enable,
        _reserved4: u1,
        sram2en: Enable,
        sram3en: Enable,
    };

    const Ahb2enr2 = packed struct(u32) {
        fsmcen: Enable,
        _reserved0: u3,
        octospi1en: Enable,
        _reserved1: u3,
        octospi2en: Enable,
        _reserved2: u3,
        hspi1en: Enable,
        _reserved3: u17,
        sram6en: Enable,
        sram5en: Enable,
    };

    const Ahb3enr = packed struct(u32) {
        lpgpio1en: Enable,
        _reserved0: u1,
        pwren: Enable,
        _reserved1: u2,
        adc4en: Enable,
        dac1en: Enable,
        _reserved2: u2,
        lpdma1en: Enable,
        adf1en: Enable,
        _reserved3: u1,
        gtzc2en: Enable,
        _reserved4: u18,
        sram4en: Enable,
    };

    const Apb1enr1 = packed struct(u32) {
        tim2en: Enable,
        tim3en: Enable,
        tim4en: Enable,
        tim5en: Enable,
        tim6en: Enable,
        tim7en: Enable,
        _reserved0: u5,
        wwdgen: Enable,
        _reserved1: u2,
        spi2en: Enable,
        _reserved2: u2,
        usart2en: Enable,
        usart3en: Enable,
        uart4en: Enable,
        uart5en: Enable,
        i2c1en: Enable,
        i2c2en: Enable,
        _reserved3: u1,
        crsen: Enable,
        usart6en: Enable,
        _reserved4: u6,
    };

    const Apb1enr2 = packed struct(u32) {
        _reserved0: u1,
        i2c4en: Enable,
        _reserved1: u3,
        lptim2en: Enable,
        i2c5en: Enable,
        i2c6en: Enable,
        _reserved2: u1,
        fdcan1en: Enable,
        _reserved3: u13,
        ucpd1en: Enable,
        _reserved4: u8,
    };

    const Apb2enr = packed struct(u32) {
        _reserved0: u11,
        tim1en: Enable,
        spi1en: Enable,
        tim8en: Enable,
        usart1en: Enable,
        _reserved1: u1,
        tim15en: Enable,
        tim16en: Enable,
        tim17en: Enable,
        _reserved2: u2,
        sai1en: Enable,
        sai2en: Enable,
        _reserved3: u1,
        usben: Enable,
        gfxtimen: Enable,
        ltdcen: Enable,
        dsien: Enable,
        _reserved4: u4,
    };

    const Apb3enr = packed struct(u32) {
        _reserved0: u1,
        syscfgen: Enable,
        _reserved1: u3,
        spi3en: Enable,
        lpuart1en: Enable,
        i2c3en: Enable,
        _reserved2: u3,
        lptim1en: Enable,
        lptim3en: Enable,
        lptim4en: Enable,
        opampen: Enable,
        compen: Enable,
        _reserved3: u4,
        vrefen: Enable,
        rtcapben: Enable,
        _reserved4: u10,
    };

    const Ahb1smenr = packed struct(u32) {
        gpdma1smen: Enable,
        cordicsmen: Enable,
        fmacsmen: Enable,
        mdf1smen: Enable,
        _reserved0: u4,
        flashsmen: Enable,
        _reserved1: u3,
        crcsmen: Enable,
        _reserved2: u2,
        jpegsmen: Enable,
        tscsmen: Enable,
        ramcfgsmen: Enable,
        dma2dsmen: Enable,
        gfxmmusmen: Enable,
        gpu2dsmen: Enable,
        dcache2smen: Enable,
        _reserved3: u2,
        gtzc1smen: Enable,
        _reserved4: u3,
        bkpsramsmen: Enable,
        icachesmen: Enable,
        dcache1smen: Enable,
        sram1smen: Enable,
    };

    const Ahb2smenr1 = packed struct(u32) {
        gpioasmen: Enable,
        gpiobsmen: Enable,
        gpiocsmen: Enable,
        gpiodsmen: Enable,
        gpioesmen: Enable,
        gpiofsmen: Enable,
        gpiogsmen: Enable,
        gpiohsmen: Enable,
        gpioismen: Enable,
        gpiojsmen: Enable,
        adc12smen: Enable,
        _reserved0: u1,
        dcmi_pssismen: Enable,
        _reserved1: u1,
        otgsmen: Enable,
        otghsphysmen: Enable,
        aessmen: Enable,
        hashsmen: Enable,
        rngsmen: Enable,
        pkasmen: Enable,
        saessmen: Enable,
        octospimsmen: Enable,
        _reserved2: u1,
        otfdec1smen: Enable,
        otfdec2smen: Enable,
        _reserved3: u2,
        sdmmc1smen: Enable,
        sdmmc2smen: Enable,
        _reserved4: u1,
        sram2smen: Enable,
        sram3smen: Enable,
    };

    const Ahb2smenr2 = packed struct(u32) {
        fsmcsmen: Enable,
        _reserved0: u3,
        octospi1smen: Enable,
        _reserved1: u3,
        octospi2smen: Enable,
        _reserved2: u3,
        hspi1smen: Enable,
        _reserved3: u17,
        sram6smen: Enable,
        sram5smen: Enable,
    };

    const Ahb3smenr = packed struct(u32) {
        lpgpio1smen: Enable,
        _reserved0: u1,
        pwrsmen: Enable,
        _reserved1: u2,
        adc4smen: Enable,
        dac1smen: Enable,
        _reserved2: u2,
        lpdma1smen: Enable,
        adf1smen: Enable,
        _reserved3: u1,
        gtzc2smen: Enable,
        _reserved4: u18,
        sram4smen: Enable,
    };

    const Apb1smenr1 = packed struct(u32) {
        tim2smen: Enable,
        tim3smen: Enable,
        tim4smen: Enable,
        tim5smen: Enable,
        tim6smen: Enable,
        tim7smen: Enable,
        _reserved0: u5,
        wwdgsmen: Enable,
        _reserved1: u2,
        spi2smen: Enable,
        _reserved2: u2,
        usart2smen: Enable,
        usart3smen: Enable,
        uart4smen: Enable,
        uart5smen: Enable,
        i2c1smen: Enable,
        i2c2smen: Enable,
        _reserved3: u1,
        crssmen: Enable,
        usart6smen: Enable,
        _reserved4: u6,
    };

    const Apb1smenr2 = packed struct(u32) {
        _reserved0: u1,
        i2c4smen: Enable,
        _reserved1: u3,
        lptim2smen: Enable,
        i2c5smen: Enable,
        i2c6smen: Enable,
        _reserved2: u1,
        fdcan1smen: Enable,
        _reserved3: u13,
        ucpd1smen: Enable,
        _reserved4: u8,
    };

    const Apb2smenr = packed struct(u32) {
        _reserved0: u11,
        tim1smen: Enable,
        spi1smen: Enable,
        tim8smen: Enable,
        usart1smen: Enable,
        _reserved1: u1,
        tim15smen: Enable,
        tim16smen: Enable,
        tim17smen: Enable,
        _reserved2: u2,
        sai1smen: Enable,
        sai2smen: Enable,
        _reserved3: u1,
        usbsmen: Enable,
        gfxtimsmen: Enable,
        ltdcsmen: Enable,
        dsismen: Enable,
        _reserved4: u4,
    };

    const Apb3smenr = packed struct(u32) {
        _reserved0: u1,
        syscfgsmen: Enable,
        _reserved1: u3,
        spi3smen: Enable,
        lpuart1smen: Enable,
        i2c3smen: Enable,
        _reserved2: u3,
        lptim1smen: Enable,
        lptim3smen: Enable,
        lptim4smen: Enable,
        opampsmen: Enable,
        compsmen: Enable,
        _reserved3: u4,
        vrefsmen: Enable,
        rtcapbsmen: Enable,
        _reserved4: u10,
    };

    const Srdamr = packed struct(u32) {
        _reserved0: u5,
        spi3amen: Enable,
        lpuart1amen: Enable,
        i2c3amen: Enable,
        _reserved1: u3,
        lptim1amen: Enable,
        lptim3amen: Enable,
        lptim4amen: Enable,
        opampamen: Enable,
        compamen: Enable,
        _reserved2: u4,
        vrefamen: Enable,
        rtcapbamen: Enable,
        _reserved3: u3,
        adc4amen: Enable,
        lpgpio1amen: Enable,
        dac1amen: Enable,
        lpdma1amen: Enable,
        adf1amen: Enable,
        _reserved4: u1,
        sram4amen: Enable,
    };

    const Ccipr1 = packed struct(u32) {
        usart1sel: Usart1sel,
        usart2sel: Usart2sel,
        usart3sel: Usart3sel,
        uart4sel: Uart4sel,
        uart5sel: Uart5sel,
        i2c1sel: I2c1sel,
        i2c2sel: I2c2sel,
        i2c4sel: I2c4sel,
        spi2sel: Spi2sel,
        lptim2sel: Lptim2sel,
        spi1sel: Spi1sel,
        systicksel: Systicksel,
        fdcan1sel: Fdcan1sel,
        iclksel: Iclksel,
        _reserved0: u1,
        timicsel: u3,

        const Usart1sel = enum(u2) {
            pclk2 = 0b00,
            sysclk = 0b01,
            hsi16 = 0b10,
            lse = 0b11,
        };

        const Usart2sel = enum(u2) {
            pclk1 = 0b00,
            sysclk = 0b01,
            hsi16 = 0b10,
            lse = 0b11,
        };

        const Usart3sel = enum(u2) {
            pclk1 = 0b00,
            sysclk = 0b01,
            hsi16 = 0b10,
            lse = 0b11,
        };

        const Uart4sel = enum(u2) {
            pclk1 = 0b00,
            sysclk = 0b01,
            hsi16 = 0b10,
            lse = 0b11,
        };

        const Uart5sel = enum(u2) {
            pclk1 = 0b00,
            sysclk = 0b01,
            hsi16 = 0b10,
            lse = 0b11,
        };

        const I2c1sel = enum(u2) {
            pclk1 = 0b00,
            sysclk = 0b01,
            hsi16 = 0b10,
            msik = 0b11,
        };

        const I2c2sel = enum(u2) {
            pclk1 = 0b00,
            sysclk = 0b01,
            hsi16 = 0b10,
            msik = 0b11,
        };

        const I2c4sel = enum(u2) {
            pclk1 = 0b00,
            sysclk = 0b01,
            hsi16 = 0b10,
            msik = 0b11,
        };

        const Spi2sel = enum(u2) {
            pclk1 = 0b00,
            sysclk = 0b01,
            hsi16 = 0b10,
            msik = 0b11,
        };

        const Lptim2sel = enum(u2) {
            pclk1 = 0b00,
            lsi = 0b01,
            hsi16 = 0b10,
            lse = 0b11,
        };

        const Spi1sel = enum(u2) {
            pclk2 = 0b00,
            sysclk = 0b01,
            hsi16 = 0b10,
            msik = 0b11,
        };

        const Systicksel = enum(u2) {
            hclkdiv8 = 0b00,
            lsi = 0b01,
            lse = 0b10,
        };

        const Fdcan1sel = enum(u2) {
            hse = 0b00,
            pll1q = 0b01,
            pll2p = 0b10,
        };

        const Iclksel = enum(u2) {
            hse = 0b00,
            pll2q = 0b01,
            pll1q = 0b10,
            msik = 0b11,
        };
    };

    const Ccipr2 = packed struct(u32) {
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

    const Ccipr3 = packed struct(u32) {
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

    const Bdcr = packed struct(u32) {
        lseon: Status,
        lserdy: Rdy,
        lsebyp: u1,
        lsedrv: u2,
        lsecsson: Status,
        lsecssd: u1,
        lsesysen: Enable,
        rtcsel: u2,
        _reserved0: u1,
        lsesysrdy: Rdy,
        lsegfon: Status,
        _reserved1: u2,
        rtcen: Enable,
        bdrst: Rst,
        _reserved2: u7,
        lscoen: Enable,
        lscosel: u1,
        lsion: Status,
        lsirdy: Rdy,
        lsiprediv: u1,
        _reserved3: u3,
    };

    const Csr = packed struct(u32) {
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

    const Seccfgr = packed struct(u32) {
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

    const Privcfgr = packed struct(u32) {
        spriv: u1,
        nspriv: u1,
        _reserved0: u30,
    };

    const Status = enum(u1) {
        off = 0,
        on = 1,
    };

    const Rdy = enum(u1) {
        notReady = 0,
        ready = 1,
    };

    const Rst = enum(u1) {
        noClockReset = 0,
        resetClock = 1,
    };

    const Enable = enum(u1) {
        disable = 0,
        enable = 1,
    };
};
