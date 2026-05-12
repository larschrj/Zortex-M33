pub const Tim1Tim8 = packed struct {
    cr1: Cr1, // TIM control register 1,                   Address offset: 0x00
    cr2: Cr2, // TIM control register 2,                   Address offset: 0x04
    smcr: Smcr, // TIM slave mode control register,          Address offset: 0x08
    dier: Dier, // TIM DMA/interrupt enable register,        Address offset: 0x0C
    sr: Sr, // TIM status register,                      Address offset: 0x10
    egr: Egr, // TIM event generation register,            Address offset: 0x14
    ccmr1: Ccmr1, // TIM capture/compare mode register 1,      Address offset: 0x18
    ccmr2: Ccmr2, // TIM capture/compare mode register 2,      Address offset: 0x1C
    ccer: Ccer, // TIM capture/compare enable register,      Address offset: 0x20
    cnt: Cnt, // TIM counter register,                     Address offset: 0x24
    psc: u16, // TIM prescaler,                            Address offset: 0x28
    _reserved0: u16,
    arr: u20, // TIM auto-reload register,                 Address offset: 0x2C
    _reserved1: u12,
    rcr: u16, // TIM repetition counter register,          Address offset: 0x30
    _reserved2: u16,
    ccr1: u20, // TIM capture/compare register 1,           Address offset: 0x34
    _reserved3: u12,
    ccr2: u20, // TIM capture/compare register 2,           Address offset: 0x38
    _reserved4: u12,
    ccr3: u20, // TIM capture/compare register 3,           Address offset: 0x3C
    _reserved5: u12,
    ccr4: u20, // TIM capture/compare register 4,           Address offset: 0x40
    _reserved6: u12,
    bdtr: u32, // TIM break and dead-time register,         Address offset: 0x44
    ccr5: u32, // TIM capture/compare register 5,           Address offset: 0x48
    ccr6: u32, // TIM capture/compare register 6,           Address offset: 0x4C
    ccmr3: u32, // TIM capture/compare mode register 3,      Address offset: 0x50
    dtr2: u32, // TIM deadtime register 2,                  Address offset: 0x54
    ecr: u32, // TIM encoder control register,             Address offset: 0x58
    tisel: u32, // TIM Input Selection register,             Address offset: 0x5C
    af1: u32, // TIM alternate function option register 1, Address offset: 0x60
    af2: u32, // TIM alternate function option register 2, Address offset: 0x64
    or1: u32, // TIM option register,                      Address offset: 0x68
    _reserved7: [220]u32, // Reserved,                               Address offset: 0x6C
    dcr: u32, // TIM DMA control register,                 Address offset: 0x3DC
    dmar: u32, // TIM DMA address for full transfer,        Address offset: 0x3E0

    pub const Cr1 = packed struct(u32) {
        cen: u1, // Counter enable
        udis: u1, // Update Disable
        urs: u1, // Update request source
        opm: u1, // One-pulse mode
        dir: u1, // Direction
        cms: u2, // Center-aligned mode Selection
        arpe: u1, // Autoreload preload enable
        ckd: u2, // Clock division
        _reserved0: u1, // Reserved
        uifremap: u1, // UIF status bit remapping
        dithen: u1, // Dithering enable
        _reserved1: u19, // Reserved
    };

    pub const Cr2 = packed struct(u32) {
        ccpc: u1, // Capture/compare preloaded control
        _reserved0: u1,
        ccus: u1, // Capture/compare control update selection
        ccds: u1, // Capture/compare DMA selection
        mms_0: u3, // Master mode selection
        ti1s: u1, // tim_ti1 selection
        ois1: u1, // Output idle state 1 (tim_oc1 output)
        ois1n: u1, // Output idle state 1 (tim_oc1n output)
        ois2: u1, // Output idle state 2 (tim_oc2 output)
        ois2n: u1, // Output idle state 2 (tim_oc2n output)
        ois3: u1, // Output idle state 3 (tim_oc3 output)
        ois3n: u1, // Output idle state 3 (tim_oc3n output)
        ois4: u1, // Output idle state 4 (tim_oc4 output)
        ois4n: u1, // Output idle state 4 (tim_oc4n output)
        ois5: u1, // Output idle state 5 (tim_oc5 output)
        _reserved1: u1,
        ois6: u1, // Output idle state 6 (tim_oc6 output)
        _reserved2: u1,
        mms2: u4, // Master mode selection 2
        _reserved3: u1,
        mms_1: u1, // Master mode selection
        _reserved4: u6,
    };

    pub const Smcr = packed struct(u32) {
        sms_0: u3, // Slave mode selection
        occs: u1, // OCREF clear selection
        ts_0: u3, // Trigger selection
        msm: u1, // Master/slave mode
        etf: u4, // External trigger filter
        etps: u2, // External trigger prescaler
        ece: u1, // External clock enable
        etp: u1, // External trigger polarity
        sms_1: u1, // Slave mode selection
        _reserved0: u3,
        ts_1: u2, // Trigger selection
        _reserved1: u2,
        smspe: u1, // SMS preload enable
        smsps: u1, // SMS preload source
        _reserved2: u6,
    };

    pub const Dier = packed struct(u32) {
        uie: u1, // Update interrupt enable
        cc1ie: u1, // Capture/compare 1 interrupt enable
        cc2ie: u1, // Capture/compare 2 interrupt enable
        cc3ie: u1, // Capture/compare 3 interrupt enable
        cc4ie: u1, // Capture/compare 4 interrupt enable
        comie: u1, // COM interrupt enable
        tie: u1, // Trigger interrupt enable
        bie: u1, // Break interrupt enable
        ude: u1, // Update DMA request enable
        cc1de: u1, // Capture/compare 1 DMA request enable
        cc2de: u1, // Capture/compare 2 DMA request enable
        cc3de: u1, // Capture/compare 3 DMA request enable
        cc4de: u1, // Capture/compare 4 DMA request enable
        comde: u1, // COM DMA request enable
        tde: u1, // Trigger DMA request enable
        _reserved0: u5,
        idxie: u1, // Index interrupt enable
        dirie: u1, // Direction change interrupt enable
        ierrie: u1, // Index error interrupt enable
        terrie: u1, // Transition error interrupt enable
        _reserved1: u8,
    };

    pub const Sr = packed struct(u32) {
        uif: u1, // Update interrupt flag
        cc1if: u1, // Capture/compare 1 interrupt flag
        cc2if: u1, // Capture/compare 2 interrupt flag
        cc3if: u1, // Capture/compare 3 interrupt flag
        cc4if: u1, // Capture/compare 4 interrupt flag
        comif: u1, // COM interrupt flag
        tif: u1, // Trigger interrupt flag
        bif: u1, // Break interrupt flag
        b2if: u1, // Break 2 interrupt flag
        cc1of: u1, // Capture/compare 1 overcapture flag
        cc2of: u1, // Capture/compare 2 overcapture flag
        cc3of: u1, // Capture/compare 3 overcapture flag
        cc4of: u1, // Capture/compare 4 overcapture flag
        sbif: u1, // System break interrupt flag
        _reserved0: u2,
        cc5if: u1, // Compare 5 interrupt flag
        cc6if: u1, // Compare 6 interrupt flag
        _reserved1: u2,
        idxf: u1, // Index interrupt flag
        dirf: u1, // Direction change interrupt flag
        ierrf: u1, // Index error interrupt flag
        terrf: u1, // Transition error interrupt flag
        _reserved2: u8,
    };

    pub const Egr = packed struct(u16) {
        ug: u1, // Update generation
        cc1g: u1, // Capture/compare 1 generation
        cc2g: u1, // Capture/compare 2 generation
        cc3g: u1, // Capture/compare 3 generation
        cc4g: u1, // Capture/compare 4 generation
        comg: u1, // Capture/compare control update generation
        tg: u1, // Trigger generation
        bg: u1, // Break generation
        b2g: u1, // Break 2 generation
        _reserved0: u7,
    };

    pub const Ccmr1 = packed union(u32) {
        input_capture: InputCapture,
        output_compare: OutputCompare,

        pub const InputCapture = packed struct(u32) {
            cc1s: u2, // Capture/compare 1 selection
            ic1psc: u2, // Input capture 1 prescaler
            ic1f: u4, // Input capture 1 filter
            cc2s: u2, // Capture/compare 2 selection
            ic2psc: u2, // Input capture 2 prescaler
            ic2f: u4, // Input capture 2 filter
            _reserved0: u16,
        };

        pub const OutputCompare = packed struct(u32) {
            cc1s: u2, // Capture/compare 1 selection
            oc1fe: u1, // Output compare 1 fast enable
            oc1pe: u1, // Output compare 1 preload enable
            oc1m_0: u3, // Output compare 1 mode
            oc1ce: u1, // Output compare 1 clear enable
            cc2s: u2, // Capture/compare 2 selection
            oc2fe: u1, // Output compare 2 fast enable
            oc2pe: u1, // Output compare 2 preload enable
            oc2m_0: u3, // Output compare 2 mode
            oc2ce: u1, // Output compare 2 clear enable
            oc1m_1: u1, // Output compare 1 mode
            _reserved0: u7,
            oc2m_1: u1, // Output compare 2 mode
            _reserved1: u7,
        };
    };

    pub const Ccmr2 = packed union(u32) {
        input_capture: InputCapture,
        output_compare: OutputCompare,

        pub const InputCapture = packed struct(u32) {
            cc3s: u2, // Capture/compare 3 selection
            ic3psc: u2, // Input capture 3 prescaler
            ic3f: u4, // Input capture 3 filter
            cc4s: u2, // Capture/compare 4 selection
            ic4psc: u2, // Input capture 4 prescaler
            ic4f: u4, // Input capture 4 filter
            _reserved0: u16,
        };

        pub const OutputCompare = packed struct(u32) {
            cc3s: u2, // Capture/compare 3 selection
            oc3fe: u1, // Output compare 3 fast enable
            oc3pe: u1, // Output compare 3 preload enable
            oc3m_0: u3, // Output compare 3 mode
            oc3ce: u1, // Output compare 3 clear enable
            cc4s: u2, // Capture/compare 4 selection
            oc4fe: u1, // Output compare 4 fast enable
            oc4pe: u1, // Output compare 4 preload enable
            oc4m_0: u3, // Output compare 4 mode
            oc4ce: u1, // Output compare 4 clear enable
            oc3m_1: u1, // Output compare 3 mode
            _reserved0: u7,
            oc4m_1: u1, // Output compare 4 mode
            _reserved1: u7,
        };
    };

    pub const Ccer = packed struct(u32) {
        cc1e: u1, // Capture/compare 1 output enable
        cc1p: u1, // Capture/compare 1 output polarity
        cc1ne: u1, // Capture/compare 1 complementary output enable
        cc1np: u1, // Capture/compare 1 complementary output polarity
        cc2e: u1, // Capture/compare 2 output enable
        cc2p: u1, // Capture/compare 2 output polarity
        cc2ne: u1, // Capture/compare 2 complementary output enable
        cc2np: u1, // Capture/compare 2 complementary output polarity
        cc3e: u1, // Capture/compare 3 output enable
        cc3p: u1, // Capture/compare 3 output polarity
        cc3ne: u1, // Capture/compare 3 complementary output enable
        cc3np: u1, // Capture/compare 3 complementary output polarity
        cc4e: u1, // Capture/compare 4 output enable
        cc4p: u1, // Capture/compare 4 output polarity
        cc4ne: u1, // Capture/compare 4 complementary output enable
        cc4np: u1, // Capture/compare 4 complementary output polarity
        cc5e: u1, // Capture/compare 5 output enable
        cc5p: u1, // Capture/compare 5 output polarity
        _reserved0: u2,
        cc6e: u1, // Capture/compare 6 output enable
        cc6p: u1, // Capture/compare 6 output polarity
        _reserved1: u10,
    };

    pub const Cnt = packed struct(u32) {
        cnt: u16, // Counter value
        _reserved0: u15,
        uifcpy: u1, // UIF copy
    };

    pub const Arr = packed struct(u32) {};
};
