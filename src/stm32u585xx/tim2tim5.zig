pub const Tim2tim5 = extern struct {
    cr1: u32, // TIMx control register 1, Address offset 0x000
    cr2: u32, // TIMx control register 2, Address offset 0x004
    smcr: u32, // TIMx , Address offset 0x008
    dier: u32, // TIMx , Address offset 0x00c
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
};
