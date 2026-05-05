pub const Tim1Tim8 = packed struct {
    cr1: Cr1, // TIM control register 1,                   Address offset: 0x00
    cr2: Cr2, // TIM control register 2,                   Address offset: 0x04
    smcr: Smcr, // TIM slave mode control register,          Address offset: 0x08
    dier: Dier, // TIM DMA/interrupt enable register,        Address offset: 0x0C
    sr: u32, // TIM status register,                      Address offset: 0x10
    egr: u32, // TIM event generation register,            Address offset: 0x14
    ccmr1: u32, // TIM capture/compare mode register 1,      Address offset: 0x18
    ccmr2: u32, // TIM capture/compare mode register 2,      Address offset: 0x1C
    ccer: u32, // TIM capture/compare enable register,      Address offset: 0x20
    cnt: u32, // TIM counter register,                     Address offset: 0x24
    psc: u32, // TIM prescaler,                            Address offset: 0x28
    arr: u32, // TIM auto-reload register,                 Address offset: 0x2C
    rcr: u32, // TIM repetition counter register,          Address offset: 0x30
    ccr1: u32, // TIM capture/compare register 1,           Address offset: 0x34
    ccr2: u32, // TIM capture/compare register 2,           Address offset: 0x38
    ccr3: u32, // TIM capture/compare register 3,           Address offset: 0x3C
    ccr4: u32, // TIM capture/compare register 4,           Address offset: 0x40
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
    _reserved0: [220]u32, // Reserved,                               Address offset: 0x6C
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
        uie: u1, // Update interrup enable
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
};
