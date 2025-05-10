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

    const ReadWrite2x16Bit = packed struct(u32) {
        first: i16,
        second: i16,
    };

    pub const CosSin = packed union {
        @"16bit": packed struct(u32) {
            cos: i16,
            sin: i16,
        },
        @"32bit": packed struct(u64) {
            cos: i32,
            sin: i32,
        },
    };

    pub const CoshSinh = packed union {
        @"16bit": packed struct(u32) {
            cosh: i16,
            sinh: i16,
        },
        @"32bit": packed struct(u64) {
            cosh: i32,
            sinh: i32,
        },
    };

    pub const Exp = packed union {
        @"16bit": i16,
        @"32bit": i32,
    };

    pub fn setup16BitArgsResults(self: *volatile Cordic) void {
        self.csr.nargs = .write32Bit;
        self.csr.nres = .read32Bit;
        self.csr.argsize = .argument16Bit;
        self.csr.ressize = .result16Bit;
    }

    pub fn cosSin(self: *volatile Cordic, angle: i16, modulus: i16, precision: Cordic.Csr.Precision) CosSin {
        self.csr.func = .cosine;
        self.csr.precision = precision;
        self.csr.scale = 0;
        setup16BitArgsResults(self);

        const input: ReadWrite2x16Bit = .{
            .first = angle,
            .second = modulus,
        };
        self.wdata = @bitCast(input);
        while (self.csr.rrdy == .noNewResult) {}
        const rdata: Cordic.ReadWrite2x16Bit = @bitCast(self.rdata);
        const ret = Cordic.CosSin{ .@"16bit" = @bitCast(rdata) };

        return ret;
    }

    pub fn coshSinh(self: *volatile Cordic, x: i16, precision: Cordic.Csr.Precision) CoshSinh {
        self.csr.func = .hyperbolic_cosine;
        self.csr.precision = precision;
        self.csr.scale = 1;
        setup16BitArgsResults(self);

        const input: ReadWrite2x16Bit = .{ .first = @divTrunc(x, 2), .second = 0 };
        self.wdata = @bitCast(input);
        while (self.csr.rrdy == .noNewResult) {}
        const rdata: Cordic.ReadWrite2x16Bit = @bitCast(self.rdata);
        var ret = Cordic.CoshSinh{ .@"32bit" = .{
            .cosh = rdata.first,
            .sinh = rdata.second,
        } };
        ret.@"32bit".cosh *|= 2;
        ret.@"32bit".sinh *|= 2;

        return ret;
    }

    pub fn exp(self: *volatile Cordic, x: i16, precision: Cordic.Csr.Precision) Exp {
        const chsh: CoshSinh = self.coshSinh(x, precision);
        const ret = Exp{ .@"32bit" = @as(i32, chsh.@"16bit".cosh) + @as(i32, chsh.@"16bit".sinh) };
        return ret;
    }
};
