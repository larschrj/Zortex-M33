const std = @import("std");

pub const Tim1Tim8 = extern struct {
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
    psc: Psc, // TIM prescaler,                            Address offset: 0x28
    arr: Arr, // TIM auto-reload register,                 Address offset: 0x2C
    rcr: Rcr, // TIM repetition counter register,          Address offset: 0x30
    ccr1: Ccr1, // TIM capture/compare register 1,           Address offset: 0x34
    ccr2: Ccr2, // TIM capture/compare register 2,           Address offset: 0x38
    ccr3: Ccr3, // TIM capture/compare register 3,           Address offset: 0x3C
    ccr4: Ccr4, // TIM capture/compare register 4,           Address offset: 0x40
    bdtr: Bdtr, // TIM break and dead-time register,         Address offset: 0x44
    ccr5: Ccr5, // TIM capture/compare register 5,           Address offset: 0x48
    ccr6: Ccr6, // TIM capture/compare register 6,           Address offset: 0x4C
    ccmr3: Ccmr3, // TIM capture/compare mode register 3,      Address offset: 0x50
    dtr2: Dtr2, // TIM deadtime register 2,                  Address offset: 0x54
    ecr: Ecr, // TIM encoder control register,             Address offset: 0x58
    tisel: Tisel, // TIM Input Selection register,             Address offset: 0x5C
    af1: Af1, // TIM alternate function option register 1, Address offset: 0x60
    af2: Af2, // TIM alternate function option register 2, Address offset: 0x64
    _reserved8: [221]u32, // Reserved,                               Address offset: 0x6C
    dcr: Dcr, // TIM DMA control register,                 Address offset: 0x3DC
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

    pub const Psc = packed struct(u32) {
        psc: u16,
        _reserved0: u16,
    };

    pub const Arr = packed struct(u32) {
        arr: u20,
        _reserved0: u12,
    };

    pub const Rcr = packed struct {
        rcr: u16,
        _reserved0: u16,
    };

    pub const Ccr1 = packed struct {
        ccr1: u20,
        _reserved0: u12,
    };

    pub const Ccr2 = packed struct {
        ccr2: u20,
        _reserved0: u12,
    };

    pub const Ccr3 = packed struct {
        ccr3: u20,
        _reserved0: u12,
    };

    pub const Ccr4 = packed struct {
        ccr4: u20,
        _reserved0: u12,
    };

    pub const Bdtr = packed struct(u32) {
        dtg: u8, // Dead-time generator setup
        lock: u2, // Lock configuration
        ossi: u1, // Off-state selection for idle mode
        ossr: u1, // Off-state selection for run mode
        bke: u1, // Break enable
        bkp: u1, // Break polarity
        aoe: u1, // Automatic output enable
        moe: u1, // Main output enable
        bkf: u4, // Break filter
        bk2f: u4, // Break 2 filter
        bk2e: u1, // Break 2 enable
        bk2p: u1, // Break 2 polarity
        bkdsrm: u1, // Break disarm
        bk2dsrm: u1, // Break 2 disarm
        bkbid: u1, // Break bidirectional
        bk2bid: u1, // Break2 bidirectional
        _reserved0: u2,
    };

    pub const Ccr5 = packed struct(u32) {
        ccr5: u20, // Capture/compare 5 value
        _reserved0: u9,
        gc5c1: u1, // Group channel 5 and channel 1
        gc5c2: u1, // Group channel 5 and channel 2
        gc5c3: u1, // Group channel 5 and channel 3
    };

    pub const Ccr6 = packed struct {
        ccr6: u20,
        _reserved0: u12,
    };

    pub const Ccmr3 = packed struct(u32) {
        _reserved0: u2,
        oc5fe: u1, // Output compare 5 fast enable
        oc5pe: u1, // Output compare 5 preload enable
        oc5m_0: u3, // Output compare 5 mode
        oc5ce: u1, // Output compare 5 clear enable
        _reserved1: u2,
        oc6fe: u1, // Output compare 6 fast enable
        oc6pe: u1, // Output compare 6 preload enable
        oc6m_0: u3, // Output compare 6 mode
        oc6ce: u1, // Output compare 6 clear enable
        oc5m_1: u1, // Output compare 5 mode
        _reserved2: u7,
        oc6m_1: u1, // Output compare 6 mode
        _reserved3: u7,
    };

    pub const Dtr2 = packed struct(u32) {
        dtgf: u8, // Dead-time falling edge generator setup
        _reserved0: u8,
        dtae: u1, // Deadtime asymmetric enable
        dtpe: u1, // Deadtime preload enable
        _reserved1: u14,
    };

    pub const Ecr = packed struct(u32) {
        ie: u1, // Index enable
        idir: u2, // Index Direction
        iblk: u2, // Index blanking
        fidx: u1, // First Index
        ipos: u2, // Index positioning
        _reserved0: u8,
        pw: u8, // Pulse width
        pwprsc: u3, // Pulse width prescaler
        _reserved1: u5,
    };

    pub const Tisel = packed struct(u32) {
        ti1sel: u4, // Selects tim_ti1[15:0] input
        _reserved0: u4,
        ti2sel: u4, // Selects tim_ti2[15:0] input
        _reserved2: u4,
        ti3sel: u4, // Selects tim_ti3[15:0] input
        _reserved3: u4,
        ti4sel: u4, // Selects tim_ti4[15:0] input
        _reserved4: u4,
    };

    pub const Af1 = packed struct(u32) {
        bkine: u1, // TIMx_BKIN input enable
        bkcmp1e: u1, // tim_brk_cmp1 enable
        bkcmp2e: u1, // tim_brk_cmp2 enable
        bkcmp3e: u1, // tim_brk_cmp3 enable
        bkcmp4e: u1, // tim_brk_cmp4 enable
        bkcmp5e: u1, // tim_brk_cmp5 enable
        bkcmp6e: u1, // tim_brk_cmp6 enable
        bkcmp7e: u1, // tim_brk_cmp7 enable
        bkcmp8e: u1, // tim_brk_cmp8 enable
        bkinp: u1, // TIMx_BKIN input polarity
        bkcmp1p: u1, // tim_brk_cmp1 input polarity
        bkcmp2p: u1, // tim_brk_cmp2 input polarity
        bkcmp3p: u1, // tim_brk_cmp3 input polarity
        bkcmp4p: u1, // tim_brk_cmp4 input polarity
        etrsel: u4, // etr_in source selection
        _reserved0: u14,
    };

    pub const Af2 = packed struct(u32) {
        bk2ine: u1, // TIMx_BKIN2 input enable
        bk2cmp1e: u1, // tim_brk2_cmp1 enable
        bk2cmp2e: u1, // tim_brk2_cmp2 enable
        bk2cmp3e: u1, // tim_brk2_cmp3 enable
        bk2cmp4e: u1, // tim_brk2_cmp4 enable
        bk2cmp5e: u1, // tim_brk2_cmp5 enable
        bk2cmp6e: u1, // tim_brk2_cmp6 enable
        bk2cmp7e: u1, // tim_brk2_cmp7 enable
        bk2cmp8e: u1, // tim_brk2_cmp8 enable
        bk2inp: u1, // TIMx_BKIN2 input polarity
        bk2cmp1p: u1, // tim_brk2_cmp1 input polarity
        bk2cmp2p: u1, // tim_brk2_cmp2 input polarity
        bk2cmp3p: u1, // tim_brk2_cmp3 input polarity
        bk2cmp4p: u1, // tim_brk2_cmp4 input polarity
        _reserved0: u2,
        ocrsel: u3, // ocref_clr source selection
        _reserved1: u13,
    };

    pub const Dcr = packed struct(u32) {
        dba: u5, // DMA base address
        _reserved0: u3,
        dbl: u5, // DMA burst length
        _reserved1: u3,
        dbss: u4, // DMA burst source selection
        _reserved2: u21,
    };

    pub const TimerError = error{
        DelayTooLong,
    };

    pub fn waitTicks(self: *@This(), ticks: u16) TimerError!void {
        const max_allowed = std.math.maxInt(u16) - 1;
        if (ticks > max_allowed) {
            return TimerError.DelayTooLong;
        }

        const start = self.cnt.cnt;
        while (true) {
            const current = self.cnt.cnt;
            const elapsed = start -% current;
            if (elapsed >= ticks) {
                break;
            } else {
                asm volatile (
                    \\nop
                );
            }
        }
    }
};
