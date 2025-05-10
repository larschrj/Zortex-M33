pub const Pwr = packed struct {
    cr1: u32, // Power control register 1 Address offset: 0x00 */
    cr2: u32, // Power control register 2 Address offset: 0x04 */
    cr3: u32, // Power control register 3 Address offset: 0x08 */
    vosr: u32, // Power voltage scaling register Address offset: 0x0C */
    svmcr: u32, // Power supply voltage monitoring control register Address offset: 0x10 */
    wucr1: u32, // Power wakeup control register 1 Address offset: 0x14 */
    wucr2: u32, // Power wakeup control register 2 Address offset: 0x18 */
    wucr3: u32, // Power wakeup control register 3 Address offset: 0x1C */
    bdcr1: u32, // Power backup domain control register 1 Address offset: 0x20 */
    bdcr2: u32, // Power backup domain control register 2 Address offset: 0x24 */
    dbpr: u32, // Power disable backup domain register Address offset: 0x28 */
    ucpdr: u32, // Power USB Type-C and Power Delivery register Address offset: 0x2C */
    seccfgr: u32, // Power Security configuration register Address offset: 0x30 */
    privcfgr: u32, // Power privilege control register Address offset: 0x34 */
    sr: u32, // Power status register Address offset: 0x38 */
    svmsr: u32, // Power supply voltage monitoring status register Address offset: 0x3C */
    bdsr: u32, // Power backup domain status register Address offset: 0x40 */
    wusr: u32, // Power wakeup status register Address offset: 0x44 */
    wuscr: u32, // Power wakeup status clear register Address offset: 0x48 */
    apcr: u32, // Power apply pull configuration register Address offset: 0x4C */
    pucra: u32, // Power Port A pull-up control register Address offset: 0x50 */
    pdcra: u32, // Power Port A pull-down control register Address offset: 0x54 */
    pucrb: u32, // Power Port B pull-up control register Address offset: 0x58 */
    pdcrb: u32, // Power Port B pull-down control register Address offset: 0x5C */
    pucrc: u32, // Power Port C pull-up control register Address offset: 0x60 */
    pdcrc: u32, // Power Port C pull-down control register Address offset: 0x64 */
    pucrd: u32, // Power Port D pull-up control register Address offset: 0x68 */
    pdcrd: u32, // Power Port D pull-down control register Address offset: 0x6C */
    pucre: u32, // Power Port E pull-up control register Address offset: 0x70 */
    pdcre: u32, // Power Port E pull-down control register Address offset: 0x74 */
    pucrf: u32, // Power Port F pull-up control register Address offset: 0x78 */
    pdcrf: u32, // Power Port F pull-down control register Address offset: 0x7C */
    pucrg: u32, // Power Port G pull-up control register Address offset: 0x80 */
    pdcrg: u32, // Power Port G pull-down control register Address offset: 0x84 */
    pucrh: u32, // Power Port H pull-up control register Address offset: 0x88 */
    pdcrh: u32, // Power Port H pull-down control register Address offset: 0x8C */
    pucri: u32, // Power Port I pull-up control register Address offset: 0x90 */
    pdcri: u32, // Power Port I pull-down control register Address offset: 0x94 */
    _reserved0: u64,
    cr4: u32,
    cr5: u32,
};
