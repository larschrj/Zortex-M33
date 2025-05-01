const cordic_t = packed struct {
    csr: csr_t,
    wdata: u32,
    rdata: u32,

    const csr_t = packed struct(u32) {
        func: u4,
        precision: u4,
        scale: u3,
        _reserved0: u4,
        ien: u1,
        dmaren: u1,
        dmawen: u1,
        nres: u1,
        nargs: u1,
        ressize: u1,
        argsize: u1,
        _reserved1: u8,
        rrdy: u1,
    };
};

const cordic_base = 0x40021000;
pub const cordic: *volatile cordic_t = @ptrFromInt(cordic_base);
