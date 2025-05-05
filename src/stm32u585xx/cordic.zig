pub const Cordic = packed struct {
    csr: Csr,
    wdata: u32,
    rdata: u32,

    const Csr = packed struct(u32) {
        func: Func,
        precision: Precision,
        scale: u3,
        _reserved0: u5,
        ien: Ien,
        dmaren: Dmaren,
        dmawen: Dmawen,
        nres: Nres,
        nargs: Nargs,
        ressize: Ressize,
        argsize: Argsize,
        _reserved1: u8,
        rrdy: Rrdy,

        const Func = enum(u4) {
            cosine = 0,
            sine = 1,
            phase = 2,
            modulus = 3,
            arctangent = 4,
            hyperbolic_cosine = 5,
            hyperbolic_sine = 6,
            arctanh = 7,
            natural_logarithm = 8,
            square_root = 9,
        };

        const Precision = enum(u4) {
            iter4 = 1,
            iter8 = 2,
            iter12 = 3,
            iter16 = 4,
            iter20 = 5,
            iter24 = 6,
            iter28 = 7,
            iter32 = 8,
            iter36 = 9,
            iter40 = 10,
            iter44 = 11,
            iter48 = 12,
            iter52 = 13,
            iter58 = 14,
            iter62 = 15,
        };

        const Ien = enum(u1) {
            interruptDisable = 0,
            interruptEnable = 1,
        };

        const Dmaren = enum(u1) {
            dmaReadDisable = 0,
            dmaReadEnable = 1,
        };

        const Dmawen = enum(u1) {
            dmaWriteDisable = 0,
            dmaWriteEnable = 1,
        };

        const Nres = enum(u1) {
            read32Bit = 0,
            read64Bit = 1,
        };

        const Nargs = enum(u1) {
            write32Bit = 0,
            write64Bit = 1,
        };

        const Ressize = enum(u1) {
            result32Bit = 0,
            result16Bit = 1,
        };

        const Argsize = enum(u1) {
            argument32Bit = 0,
            argument16Bit = 1,
        };

        const Rrdy = enum(u1) {
            noNewResult = 0,
            newResult = 1,
        };
    };

    const WriteRead16Bit = packed struct(u32) {
        first: u16,
        second: u16,
    };

    pub const SinCosReturn = packed struct(u32) {
        sin: i16,
        cos: i16,
    };

    pub fn sinCos(self: *volatile Cordic, x: i16, m: i16) SinCosReturn {
        self.csr.func = .sine;
        self.csr.nargs = .write32Bit;
        self.csr.nres = .read32Bit;
        self.csr.precision = .iter62;
        self.csr.argsize = .argument16Bit;
        self.csr.ressize = .result16Bit;

        const input: WriteRead16Bit = .{
            .first = @bitCast(x),
            .second = @bitCast(m),
        };

        self.wdata = @bitCast(input);
        while (self.csr.rrdy == .noNewResult) {}
        const ret: SinCosReturn = @bitCast(self.rdata);

        return ret;
    }
};

const cordic_base = 0x40021000;
pub const cordic: *volatile Cordic = @ptrFromInt(cordic_base);
