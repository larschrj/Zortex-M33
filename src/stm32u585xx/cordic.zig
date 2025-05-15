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

    pub const FixedPoint16Bit = enum(u16) {
        q1p15 = 0,
        q2p14 = 1,
        q3p13 = 2,
    };

    pub const FixedPoint32Bit = enum(u16) {
        q1p31 = 0,
        q2p30 = 1,
        q3p29 = 2,
    };

    pub const CosSin16Bit = packed struct {
        cos: i16,
        sin: i16,
    };

    pub const CosSin32Bit = packed struct {
        cos: i32,
        sin: i32,
    };

    pub const CoshSinh16Bit = packed struct {
        cosh: packed struct {
            value: i16,
            fp: FixedPoint16Bit,
        },
        sinh: packed struct {
            value: i16,
            fp: FixedPoint16Bit,
        },
    };

    pub const CoshSinh32Bit = packed struct {
        cosh: packed struct {
            value: i32,
            fp: FixedPoint32Bit,
        },
        sinh: packed struct {
            value: i32,
            fp: FixedPoint32Bit,
        },
    };

    pub const Exp16Bit = packed struct {
        value: i16,
        fp: FixedPoint16Bit,
    };

    pub const Exp32Bit = packed struct {
        value: i32,
        fp: FixedPoint32Bit,
    };

    pub fn setup16BitArgsResults(self: *volatile Cordic) void {
        self.csr.nargs = .write32Bit;
        self.csr.nres = .read32Bit;
        self.csr.argsize = .argument16Bit;
        self.csr.ressize = .result16Bit;
    }

    pub fn setup32BitArgsResults(self: *volatile Cordic) void {
        self.csr.nargs = .write64Bit;
        self.csr.nres = .read64Bit;
        self.csr.argsize = .argument32Bit;
        self.csr.ressize = .result32Bit;
    }

    /// x and m interpreted as q1.15 fixed point number
    pub fn cosSin16Bit(self: *volatile Cordic, angle: i16, modulus: i16, precision: Cordic.Csr.Precision) CosSin16Bit {
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
        const ret: Cordic.CosSin16Bit = @bitCast(rdata);

        return ret;
    }

    /// x and m interpreted as q1.31 fixed point number
    pub fn cosSin32Bit(self: *volatile Cordic, angle: i32, modulus: i32, precision: Cordic.Csr.Precision) CosSin32Bit {
        self.csr.func = .cosine;
        self.csr.precision = precision;
        self.csr.scale = 0;
        setup32BitArgsResults(self);

        self.wdata = angle;
        self.wdata = modulus;
        while (self.csr.rrdy == .noNewResult) {}
        var ret: Cordic.CosSin32Bit = undefined;
        ret.cos = self.rdata;
        ret.sin = self.rdata;

        return ret;
    }

    /// x interpreted as q1.15 fixed point number
    pub fn coshSinh16Bit(self: *volatile Cordic, x: i16, precision: Cordic.Csr.Precision) CoshSinh16Bit {
        self.csr.func = .hyperbolic_cosine;
        self.csr.precision = precision;
        self.csr.scale = 1;
        setup16BitArgsResults(self);

        const input: ReadWrite2x16Bit = .{
            .first = @divFloor(x, 2),
            .second = 0,
        };
        self.wdata = @bitCast(input);
        while (self.csr.rrdy == .noNewResult) {}
        const rdata: Cordic.ReadWrite2x16Bit = @bitCast(self.rdata);

        const c, const c_overflow = @mulWithOverflow(rdata.first, @as(i16, 2));
        const s, const s_overflow = @mulWithOverflow(rdata.second, @as(i16, 2));

        var result: CoshSinh16Bit = undefined;
        result.cosh = if (c_overflow == 1) .{
            .value = rdata.first,
            .fp = .q2p14,
        } else .{
            .value = c,
            .fp = .q1p15,
        };
        result.sinh = if (s_overflow == 1) .{
            .value = rdata.second,
            .fp = .q2p14,
        } else .{
            .value = s,
            .fp = .q1p15,
        };

        return result;
    }

    /// x interpreted as q1.15 fixed point number
    pub fn exp16Bit(self: *volatile Cordic, x: i16, precision: Cordic.Csr.Precision) Exp16Bit {
        const chsh: CoshSinh16Bit = self.coshSinh16Bit(x, precision);
        var ret: Exp16Bit = undefined;

        if (chsh.cosh.fp != chsh.sinh.fp) {
            switch (chsh.cosh.fp) {
                .q1p15 => {
                    const e, const overflow = @addWithOverflow(@divFloor(chsh.cosh.value, @as(i16, 2)), chsh.sinh.value);
                    if (overflow == 1) {
                        ret.value = @divFloor(chsh.cosh.value, @as(i16, 4)) + @divFloor(chsh.sinh.value, @as(i16, 2));
                        ret.fp = .q3p13;
                    } else {
                        ret.value = e;
                        ret.fp = .q2p14;
                    }
                },
                .q2p14 => {
                    const e, const overflow = @addWithOverflow(chsh.cosh.value, @divFloor(chsh.sinh.value, @as(i16, 2)));
                    if (overflow == 1) {
                        ret.value = @divFloor(chsh.cosh.value, @as(i16, 2)) + @divFloor(chsh.sinh.value, @as(i16, 4));
                        ret.fp = .q3p13;
                    } else {
                        ret.value = e;
                        ret.fp = .q2p14;
                    }
                },
                else => unreachable,
            }
        } else {
            const e, const overflow = @addWithOverflow(chsh.cosh.value, chsh.sinh.value);
            if (overflow == 1) {
                ret.value = @truncate(@divFloor(@as(i32, chsh.cosh.value) + @as(i32, chsh.sinh.value), 2));
                switch (chsh.cosh.fp) {
                    .q1p15 => ret.fp = .q2p14,
                    .q2p14 => ret.fp = .q3p13,
                    else => unreachable,
                }
            } else {
                ret.value = e;
                ret.fp = chsh.cosh.fp;
            }
        }

        return ret;
    }
};
