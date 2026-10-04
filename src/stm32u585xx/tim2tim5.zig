pub const Tim2tim5 = extern struct {
    cr1: Cr1, // TIMx control register 1, Address offset 0x000
    cr2: Cr1, // TIMx control register 2, Address offset 0x004
    smcr: Smcr, // TIMx , Address offset 0x008
    dier: Dier, // TIMx , Address offset 0x00c
    sr: u32, // TIMx , Address offset 0x010
    egr: u32, // TIMx , Address offset 0x014
    ccmr1: u32, // TIMx , Address offset 0x018
    ccmr2: u32, // TIMx , Address offset 0x01c
    ccer: u32, // TIMx , Address offset 0x020
    cnt: u32, // TIMx , Address offset 0x024
    psc: u32, // TIMx , Address offset 0x028
    arr: u32, // TIMx , Address offset 0x02c
    _reserved0: u32, // Address offset 0x030
    ccr1: u32, // TIMx , Address offset 0x034
    ccr2: u32, // TIMx , Address offset 0x038
    ccr3: u32, // TIMx , Address offset 0x03c
    ccr4: u32, // TIMx , Address offset 0x040
    _reserved1: [5]u32, // Address offset 0x044..0x054
    ecr: u32, // TIMx , Address offset 0x058
    tisel: u32, // TIMx, Address offset 0x05c
    af1: u32, // TIMx , Address offset 0x060
    af2: u32, // TIMx , Address offset 0x064
    _reserved2: [221]u32, // Address offset 0x068..0x3d8
    dcr: u32, // TIMx , Address offset 0x3dc
    dmar: u32, // TIMx , Address offset 0x3e0

    pub const Cr1 = packed struct(u32) {
        cen: u1, // Counter enable
        udis: u1, // Update disable
        urs: u1, // Update request source
        opm: u1, // One-pulse mode
        dir: u1, // Direction
        cms: u2, // Center aligned mode selection
        arpe: u1, // Autoreload preload enable
        ckd: u2, // Clock division
        _reserved0: u1,
        uifremap: u1, // UIF status bit remapping
        dithen: u1, // Dithering enable
        _reserved1: u19,
    };

    pub const Cr2 = packed struct(u32) {
        _reserved0: u3,
        ccds: u1, // Capture/compare DMA selection
        mms_0: u3, // Master mode selection
        ti1s: u1, // tim_ti1 selection
        _reserved1: u17,
        mms_1: u1, // Master mode selection
        _reserved2: u6,
    };

    pub const Smcr = packed struct(u32) {
        sms_0: u3, // Slave mode selection
        occs: u1, // OCREF clear selection
        ts_0: u3, // Trigger selection
        msm: u1, // Master/Slave mode
        etf: u4, // External trigger filter
        etps: u2, // External trigger prescaler
        ece: u1, // External clock enable
        etp: u1, // External trigger polarity
        sms_1: u1, // Slave mode selection
        _reserved0: u3,
        ts_1: u2, // Trigger selection
        _reserved1: u2,
        smspe: u1, // SMS preload source
        smsps: u1, // SMS preload enable
        _reserved2: u6,
    };

    pub const Dier = packed struct(u32) {
        uie: u1, // Update interrupt enable
        cc1ie: u1, // Capture/compare 1 interrupt enable
        cc2ie: u1, // Capture/compare 2 interrupt enable
        cc3ie: u1, // Capture/compare 3 interrupt enable
        cc4ie: u1, // Capture/compare 4 interrupt enable
        _reserved0: u1,
        tie: u1, // Trigger interrupt enable
        _reserved1: u1,
        ude: u1, // Update DMA request enable
        cc1de: u1, // Capture/Compare 1 DMA request enable
        cc2de: u1, // Capture/Compare 2 DMA request enable
        cc3de: u1, // Capture/Compare 3 DMA request enable
        cc4de: u1, // Capture/Compare 4 DMA request enable
        _reserved2: u1,
        tde: u1, // Trigger DMA request enable
        _reserved3: u5,
    };
};
