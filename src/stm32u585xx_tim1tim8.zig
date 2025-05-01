const tim1tim8_t = packed struct {
    cr1: u32, // TIM control register 1,                   Address offset: 0x00
    cr2: u32, // TIM control register 2,                   Address offset: 0x04
    smcr: u32, // TIM slave mode control register,          Address offset: 0x08
    dier: u32, // TIM DMA/interrupt enable register,        Address offset: 0x0C
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
};

const tim1_base: u32 = 0x40012c00;
const tim8_base: u32 = 0x40013400;
pub const tim1: *volatile tim1tim8_t = @ptrFromInt(tim1_base);
pub const tim8: *volatile tim1tim8_t = @ptrFromInt(tim8_base);
