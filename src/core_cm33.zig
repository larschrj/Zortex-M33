const std = @import("std");
pub const irq_t = @import("stm32u585xx_irq.zig").irq_t;
pub const exceptionNumber_t = @import("stm32u585xx_irq.zig").exceptionNumber_t;

const apsr_t = packed struct(u32) {
    _reserved0: u16, // bit: 0..15 Reserved
    ge: u4, // bit: Greater than or Equal flags
    _reserved1: u7, // bit: 20..26 Reserved
    q: u1, // bit: 27 Saturation condition code flag
    v: u1, // bit: 28 Overflow condition code flag
    c: u1, // bit: 29 Carry condition code flag
    z: u1, // bit: 30 Zero condition code flag
    n: u1, // bit: 31 Negative condition code flag
};

const ipsr_t = packed struct(u32) {
    isr: u9, // bit:  0.. 8  Exception number
    _reserved0: u23, // bit 9..31 Reserved
};

const xpsr_t = packed struct(u32) {
    isr: u9, // bit:  0.. 8  Exception number
    _reserved0: u7, // bit:  9..15  Reserved
    ge: u4, // bit: 16..19 Greater than or Equal flags
    _reserved1: u4, // bit: 20..23 Reserved
    t: u1, // bit: 24 Thumb bit (read 0)
    it: u2, // bit: 25..26 saved IT state (read 0)
    q: u1, // bit: 27 Saturation condition code flag
    v: u1, // bit: 28 Overflow condition code flag
    c: u1, // bit: 29 Carry condition code flag
    z: u1, // bit: 30 Zero condition code flag
    n: u1, // bit: 31 Negative condition code flag
};

const control_t = packed struct(u32) {
    npriv: npriv_t = .privileged, // bit: 0 Execution privilege in Thread mode
    spsel: spsel_t = .msp, // bit: 1 Stack pointer select
    fpca: fpca_t = .float_context_inactive, // bit: 2 Floating-point context active
    sfpa: sfpa_t = .float_context_inactive, // bit: 3 Secure floating-point active
    _reserved0: u28 = 0, // bit 4..31 Reserved

    pub const npriv_t = enum(u1) {
        privileged = 0,
        unprivileged = 1,
    };

    pub const spsel_t = enum(u1) {
        msp = 0,
        psp = 1,
    };

    pub const fpca_t = enum(u1) {
        float_context_inactive = 0,
        float_context_active = 1,
    };

    pub const sfpa_t = fpca_t;
};

const nvic_t = extern struct {
    iser: [16]u32, // Offset: 0x000 (R/W)  Interrupt Set Enable Register */
    reserved0: [16]u32,
    icer: [16]u32, // Offset: 0x080 (R/W)  Interrupt Clear Enable Register */
    reserved1: [16]u32,
    ispr: [16]u32, // Offset: 0x100 (R/W)  Interrupt Set Pending Register */
    reserved2: [16]u32,
    icpr: [16]u32, // Offset: 0x180 (R/W)  Interrupt Clear Pending Register */
    reserved3: [16]u32,
    iabr: [16]u32, // Offset: 0x200 (R/W)  Interrupt Active bit Register */
    reserved4: [16]u32,
    itns: [16]u32, // Offset: 0x280 (R/W)  Interrupt Non-Secure State Register */
    reserved5: [16]u32,
    ipr: [496]u8, // Offset: 0x300 (R/W)  Interrupt Priority Register (8Bit wide) */
    reserved6: [580]u32,
    stir: u32, // Offset: 0xE00 ( /W)  Software Trigger Interrupt Register */
};

const scb_t = extern struct {
    cpuid: u32, // Offset: 0x000 (R/ )  CPUID Base Register
    icsr: icsr_t, // Offset: 0x004 (R/W)  Interrupt Control and State Register
    vtor: u32, // Offset: 0x008 (R/W)  Vector Table Offset Register
    aircr: aircr_t, // Offset: 0x00C (R/W)  Application Interrupt and Reset Control Register
    scr: scr_t, // Offset: 0x010 (R/W)  System Control Register
    ccr: ccr_t, // Offset: 0x014 (R/W)  Configuration Control Register
    shpr: [12]u8, // Offset: 0x018 (R/W)  System Handlers Priority Registers (4-7, 8-11, 12-15)
    shcsr: shcsr_t, // Offset: 0x024 (R/W)  System Handler Control and State Register
    cfsr: cfsr_t, // Offset: 0x028 (R/W)  Configurable Fault Status Register
    hfsr: hfsr_t, // Offset: 0x02C (R/W)  HardFault Status Register
    dfsr: u32, // Offset: 0x030 (R/W)  Debug Fault Status Register
    mmfar: mmfar_t, // Offset: 0x034 (R/W)  MemManage Fault Address Register
    bfar: bfar_t, // Offset: 0x038 (R/W)  BusFault Address Register
    afsr: u32, // Offset: 0x03C (R/W)  Auxiliary Fault Status Register
    id_pfr: [2]u32, // Offset: 0x040 (R/ )  Processor Feature Register
    id_dfr: u32, // Offset: 0x048 (R/ )  Debug Feature Register
    id_afr: u32, // Offset: 0x04C (R/ )  Auxiliary Feature Register
    id_mmfr: [4]u32, // Offset: 0x050 (R/ )  Memory Model Feature Register
    id_isar: [6]u32, // Offset: 0x060 (R/ )  Instruction Set Attributes Register
    clidr: u32, // Offset: 0x078 (R/ )  Cache Level ID register
    ctr: u32, // Offset: 0x07C (R/ )  Cache Type register
    ccsidr: u32, // Offset: 0x080 (R/ )  Cache Size ID Register
    csselr: u32, // Offset: 0x084 (R/W)  Cache Size Selection Register
    cpacr: cpacr_t, // Offset: 0x088 (R/W)  Coprocessor Access Control Register
    nsacr: nsacr_t, // Offset: 0x08C (R/W)  Non-Secure Access Control Register
    reserved7: [21]u32,
    sfsr: u32, // Offset: 0x0E4 (R/W)  Secure Fault Status Register
    sfar: u32, // Offset: 0x0E8 (R/W)  Secure Fault Address Register
    reserved3: [69]u32,
    stir: u32, // Offset: 0x200 ( /W)  Software Triggered Interrupt Register
    reserved4: [15]u32,
    mvfr0: u32, // Offset: 0x240 (R/ )  Media and VFP Feature Register 0
    mvfr1: u32, // Offset: 0x244 (R/ )  Media and VFP Feature Register 1
    mvfr2: u32, // Offset: 0x248 (R/ )  Media and VFP Feature Register 2
    reserved5: [1]u32,
    iciallu: u32, // Offset: 0x250 ( /W)  I-Cache Invalidate All to PoU
    reserved6: [1]u32,
    icimvau: u32, // Offset: 0x258 ( /W)  I-Cache Invalidate by MVA to PoU
    dcimvac: u32, // Offset: 0x25C ( /W)  D-Cache Invalidate by MVA to PoC
    dcisw: u32, // Offset: 0x260 ( /W)  D-Cache Invalidate by Set-way
    dccmvau: u32, // Offset: 0x264 ( /W)  D-Cache Clean by MVA to PoU
    dccmvac: u32, // Offset: 0x268 ( /W)  D-Cache Clean by MVA to PoC
    dccsw: u32, // Offset: 0x26C ( /W)  D-Cache Clean by Set-way
    dccimvac: u32, // Offset: 0x270 ( /W)  D-Cache Clean and Invalidate by MVA to PoC
    dccisw: u32, // Offset: 0x274 ( /W)  D-Cache Clean and Invalidate by Set-way
    bpiall: u32, // Offset: 0x278 ( /W)  Branch Predictor Invalidate All

    const icsr_t = packed struct(u32) {
        vectActive: vectActive_t,
        _reserved0: u2,
        retToBase: retToBase_t,
        vectPending: vectPending_t,
        _reserved1: u1,
        isrPending: isrPending_t,
        _reserved2: u2,
        pendStClr: pendClr_t,
        pendStSet: pendSet_t,
        pendSvClr: pendClr_t,
        pendSvSet: pendSet_t,
        _reserved3: u1,
        pendNmiClr: pendClr_t,
        pendNmiSet: pendSet_t,

        // create vectActive_t from exceptionNumber_t and add 0 value for thread_mode
        const vectActive_t = blk: {
            const enumTypeInfo = @typeInfo(exceptionNumber_t).@"enum";
            var newFields: [enumTypeInfo.fields.len + 1]std.builtin.Type.EnumField = undefined;
            for (enumTypeInfo.fields, 0..) |f, i| {
                newFields[i] = .{ .name = f.name, .value = f.value + 16 };
            }
            newFields[newFields.len - 1] = .{ .name = "thread_mode", .value = 0 };
            const enumInfo = std.builtin.Type.Enum{ .tag_type = u9, .fields = &newFields, .decls = &.{}, .is_exhaustive = false };
            break :blk @Type(.{ .@"enum" = enumInfo });
        };

        const retToBase_t = enum(u1) {
            preemptedException = 0,
            noPreemptedException = 1,
        };

        // create vectPending_t from exceptionNumber_t and add 0 value for no pending interrupt
        const vectPending_t = blk: {
            const enumTypeInfo = @typeInfo(exceptionNumber_t).@"enum";
            var newFields: [enumTypeInfo.fields.len + 1]std.builtin.Type.EnumField = undefined;
            for (enumTypeInfo.fields, 0..) |f, i| {
                newFields[i] = .{ .name = f.name, .value = f.value + 16 };
            }
            newFields[newFields.len - 1] = .{ .name = "no_pending", .value = 0 };
            const enumInfo = std.builtin.Type.Enum{ .tag_type = u9, .fields = &newFields, .decls = &.{}, .is_exhaustive = false };
            break :blk @Type(.{ .@"enum" = enumInfo });
        };

        const isrPending_t = enum(u1) {
            noPendingInterrupt = 0,
            pendingInterrupt = 1,
        };

        const pendClr_t = enum(u1) {
            clearPendingSysTick = 1,
        };

        const pendSet_t = enum(u1) {
            noPendingInterrupt = 0,
            pendingInterrupt = 1,
        };
    };

    const aircr_t = packed struct(u32) {
        _reserved0: u1,
        vectClrActive: u1,
        sysResetReq: sysResetReq_t,
        sysResetReqS: sysResetReqS_t,
        _reserved1: u4,
        prigroup: prigroup_t,
        _reserved2: u2,
        bfHfNmiNS: bfHfNmiNS_t,
        pris: pris_t,
        endianess: u1,
        vectkey: u16,

        const sysResetReq_t = enum(u1) {
            requestReset = 1,
        };

        const sysResetReqS_t = sysResetReq_t;

        pub const prigroup_t = enum(u3) {
            groupPrioBitWidth4 = 0b011,
            groupPrioBitWidth3 = 0b100,
            groupPrioBitWidth2 = 0b101,
            groupPrioBitWidth1 = 0b110,
            groupPrioBitWidth0 = 0b111,
        };

        const bfHfNmiNS_t = enum(u1) {
            secure = 0,
            nonsecure = 1,
        };

        const pris_t = enum(u1) {
            equalPriority = 0,
            securePriority = 1,
        };
    };

    const scr_t = packed struct(u32) {
        _reserved0: u1,
        sleepOnExit: sleepOnExit_t,
        sleepDeep: sleepDeep_t,
        sleepDeepS: sleepDeepS_t,
        sevOnPend: sevOnPend_t,
        _reserved: u27,

        const sleepOnExit_t = enum(u1) {
            noSleepOnIsrReturn = 0,
            enterSleepOnIsrReturn = 1,
        };

        const sleepDeep_t = enum(u1) {
            sleepOnSleep = 0,
            deepSleepOnSleep = 1,
        };

        const sleepDeepS_t = enum(u1) {
            nonSecureAccess = 0,
            secureAccess = 1,
        };

        const sevOnPend_t = enum(u1) {
            wakeOnEnabledInterrupts = 0,
            wakeOnAllInterrupts = 1,
        };
    };

    const ccr_t = packed struct(u32) {
        _reserved0: u1,
        userSetMPend: userSetMPend_t,
        _reserved1: u1,
        unAlign_trp: unAlign_trp_t,
        div_0_trp: div_0_trp_t,
        _reserved2: u3,
        bfHfNmiGn: bfHfNmiGn_t,
        _reserved3: u1,
        stkOfHfNmiGn: u1,
        _reserved4: u5,
        dc: u1,
        ic: u1,
        bp: u1,
        _reserved5: u13,

        const userSetMPend_t = enum(u1) {
            privilegeStir = 0,
            unprivilegeStir = 1,
        };

        const unAlign_trp_t = enum(u1) {
            unAlignDisable = 0,
            unAlignEnable = 1,
        };

        const div_0_trp_t = enum(u1) {
            usageFaultDisable = 0,
            usageFaultEnable = 1,
        };

        const bfHfNmiGn_t = enum(u1) {
            preciseIgnore = 0,
            preciseLessThanZero = 1,
        };

        const stkOfHfNmiGn_t = enum(u1) {
            stackLimitFaultAll = 0,
            stackLimitFaultGreaterThanZero = 1,
        };
    };

    const shcsr_t = packed struct(u32) {
        memFaultAct: u1,
        busFaultAct: u1,
        hardFaultAct: u1,
        usgFaultAct: u1,
        secureFaultAct: u1,
        nmiAct: u1,
        _reserved0: u1,
        svCallAct: u1,
        monitorAct: u1,
        _reserved1: u1,
        pendSvAct: u1,
        sysTickAct: u1,
        usgFaultPended: u1,
        memFaultPended: u1,
        busFaultPended: u1,
        svCallPended: u1,
        memFaultEna: u1,
        busFaultEna: u1,
        usgFaultEna: u1,
        secureFaultEna: u1,
        secureFaultPended: u1,
        hardFaultPended: u1,
        _reserved2: u10,
    };

    const cfsr_t = packed struct(u32) {
        r: mmfsr_t, // memory management fault status register
        bfsr: bfsr_t, // bus fault status register
        ufsr: ufsr_t, // usage fault status register

        const mmfsr_t = packed struct(u8) {
            iaccViol: u1,
            daccViol: u1,
            _reserved0: u1,
            mUnStkErr: u1,
            mStkErr: u1,
            mLspErr: u1,
            _reserved1: u1,
            mmarValid: u1,
        };

        const bfsr_t = packed struct(u8) {
            ibusErr: u1,
            preciseErr: u1,
            _reserved0: u1,
            unStkErr: u1,
            stkErr: u1,
            lspErr: u1,
            _reserved1: u1,
            bfarValid: u1,
        };

        const ufsr_t = packed struct(u16) {
            undefInstr: u1,
            invState: u1,
            invPc: u1,
            noCp: u1,
            stkOf: u1,
            _reserved0: u3,
            unAligned: u1,
            divByZero: u1,
            _reserved1: u6,
        };
    };

    const hfsr_t = packed struct(u32) {
        _reserved0: u1,
        vectTbl: u1,
        _reserved1: u28,
        forced: u1,
        debugEvt: u1,
    };

    const mmfar_t = packed struct(u32) {
        address: u32,
    };

    const bfar_t = packed struct(u32) {
        address: u32,
    };

    const cpacr_t = packed struct(u32) {
        _reserved0: u20,
        cp10: coprocessor_access,
        cp11: coprocessor_access,
        _reserved1: u8,

        pub const coprocessor_access = enum(u2) {
            access_denied = 0b00,
            privileged_access = 0b01,
            full_access = 0b11,
        };
    };

    const nsacr_t = packed struct(u32) {
        _reserved0: u10,
        cp: cp_t,
        _reserved1: u20,

        const cp_t = enum(u2) {
            secure = 0b00,
            nonSecure = 0b11,
        };
    };
};

const scnscb_t = packed struct {
    _reserved0: u32,
    ictr: u32, // Offset: 0x004 (R/ )  Interrupt Controller Type Register
    actlr: u32, // Offset: 0x008 (R/W)  Auxiliary Control Register
    cppwr: u32, // Offset: 0x00C (R/W)  Coprocessor Power Control  Register
};

const systick_t = packed struct {
    ctrl: ctrl_t,
    load: u24,
    _reserved0: u8,
    val: u24,
    _reserved1: u8,
    calib: calib_t,

    const ctrl_t = packed struct(u32) {
        enable: enable_t,
        tickInt: tickInt_t,
        clkSource: clkSource_t,
        _reserve0: u13,
        countFlag: countFlag_t,
        _reserve1: u15,

        const enable_t = enum(u1) {
            disable = 0,
            enable = 1,
        };

        const tickInt_t = enum(u1) {
            exceptionReqDisable = 0,
            exceptionReqEnable = 1,
        };

        const clkSource_t = enum(u1) {
            ahbDivide8 = 0,
            ahb = 1,
        };

        const countFlag_t = enum(u1) {
            noReloadSinceLastRead = 0,
            reloadSinceLastRead = 1,
        };
    };

    const calib_t = packed struct(u32) {
        tenms: u24,
        _reserved0: u6,
        skew: u1,
        noref: u1,
    };
};

const mpu_t = packed struct {
    type: u32, // Offset: 0x000 (R/ )  MPU Type Register */
    ctrl: u32, // Offset: 0x004 (R/W)  MPU Control Register */
    rnr: u32, // Offset: 0x008 (R/W)  MPU Region Number Register */
    rbar: u32, // Offset: 0x00C (R/W)  MPU Region Base Address Register */
    rlar: u32, // Offset: 0x010 (R/W)  MPU Region Limit Address Register */
    rbar_a1: u32, // Offset: 0x014 (R/W)  MPU Region Base Address Register Alias 1 */
    rlar_a1: u32, // Offset: 0x018 (R/W)  MPU Region Limit Address Register Alias 1 */
    rbar_a2: u32, // Offset: 0x01C (R/W)  MPU Region Base Address Register Alias 2 */
    rlar_a2: u32, // Offset: 0x020 (R/W)  MPU Region Limit Address Register Alias 2 */
    rbar_a3: u32, // Offset: 0x024 (R/W)  MPU Region Base Address Register Alias 3 */
    rlar_a3: u32, // Offset: 0x028 (R/W)  MPU Region Limit Address Register Alias 3 */
    reserved0: [1]u32,
    mair0: u32, // Offset: 0x030 (R/W)  MPU Memory Attribute Indirection Register 0 */
    mair1: u32, // Offset: 0x034 (R/W)  MPU Memory Attribute Indirection Register 1 */
};

const sau_t = packed struct {
    ctrl: u32, // Offset: 0x000 (R/W)  SAU Control Register
    type: u32, // Offset: 0x004 (R/ )  SAU Type Register
    rnr: u32, // Offset: 0x008 (R/W)  SAU Region Number Register
    rbar: u32, // Offset: 0x00C (R/W)  SAU Region Base Address Register
    rlar: u32, // Offset: 0x010 (R/W)  SAU Region Limit Address Register
    sfsr: u32, // Offset: 0x014 (R/W)  Secure Fault Status Register
    sfar: u32, // Offset: 0x018 (R/W)  Secure Fault Address Register
};

const fpu_t = packed struct {
    _reserved0: u32,
    fpccr: u32, // Offset: 0x004 (R/W)  Floating-Point Context Control Register
    fpcar: u32, // Offset: 0x008 (R/W)  Floating-Point Context Address Register
    fpdscr: u32, // Offset: 0x00C (R/W)  Floating-Point Default Status Control Register
    mvfr0: u32, // Offset: 0x010 (R/ )  Media and VFP Feature Register 0
    mvfr1: u32, // Offset: 0x014 (R/ )  Media and VFP Feature Register 1
    mvfr2: u32, // Offset: 0x018 (R/ )  Media and VFP Feature Register 2
};

const priorityField_t = std.meta.Int(.unsigned, nvicPriorityBitSize);
const priorityShift_t = std.math.Log2Int(priorityField_t);
const priorityTypeMax: priorityField_t = std.math.maxInt(priorityField_t);
const priorityEncodeShift_t = u3;
const priorityEncodeShift: priorityEncodeShift_t = 8 - nvicPriorityBitSize;
pub const priority_t = packed struct {
    groupPriority: priorityField_t,
    subPriority: priorityField_t,
};

const nvicPriorityBitSize: u4 = 4;
const scs_base = 0xe000e000; // system control space base address
const itm_base = 0xe0000000; // itm base address
const dwt_base = 0xe0001000; // dwt base address
const tpi_base = 0xe0040000; // tpi base address
const dcb_base = 0xe000edf0; // dcb base address
const dib_base = 0xe000efb0; // dib base address
const systick_base = scs_base + 0x0010; // systick base address
const nvic_base = scs_base + 0x0100; // nvic base address
const scb_base = scs_base + 0x0d00; // system control block base address
const mpu_base = scs_base + 0x0d90; // memory protection unit base address
const sau_base = scs_base + 0x0dd0; // security attribution unit
const fpu_base = scs_base + 0x0f30; // floating point unit base address

pub const scnscb: *volatile scnscb_t = @ptrFromInt(scs_base);
pub const scb: *volatile scb_t = @ptrFromInt(scb_base);
pub const systick: *volatile systick_t = @ptrFromInt(systick_base);
pub const nvic: *volatile nvic_t = @ptrFromInt(nvic_base);
pub const mpu: *volatile mpu_t = @ptrFromInt(mpu_base);
pub const sau: *volatile sau_t = @ptrFromInt(sau_base);
pub const fpu: *volatile fpu_t = @ptrFromInt(fpu_base);

pub inline fn dsb() void {
    asm volatile ("dsb");
}

pub inline fn isb() void {
    asm volatile ("isb");
}

pub inline fn ldrex(addr: *u32) u32 {
    return asm volatile ("ldrex %[result], [%[addr]]"
        : [result] "=r" (-> u32),
        : [addr] "r" (addr),
    );
}

pub inline fn strex(addr: *u32, value: u32) u8 {
    return asm volatile ("strex %[result], %[value], [%[addr]]"
        : [result] "=r" (-> u8),
        : [addr] "r" (addr),
          [value] "r" (value),
    );
}

pub inline fn clrex() void {
    asm volatile ("clrex");
}

pub fn enableFpu() void {
    scb.cpacr.cp10 = .full_access;
    scb.cpacr.cp11 = .full_access;

    // reset instruction and data pipelines after enabling fpu
    dsb();
    isb();
}

pub inline fn enableIrq() void {
    asm volatile ("cpsie i");
}

pub inline fn disableIrq() void {
    asm volatile ("cpsid i");
}

pub inline fn enableFiq() void {
    asm volatile ("cpsie f");
}

pub inline fn disableFiq() void {
    asm volatile ("cpsid f");
}

pub inline fn setPrimask(val: u32) void {
    asm volatile ("msr primask, %[val]"
        :
        : [val] "r" (val),
    );
}

pub inline fn getPrimask() u32 {
    return asm volatile ("mrs %[ret], primask"
        : [ret] "=r" (-> u32),
    );
}

pub inline fn getControl() control_t {
    return asm volatile (
        \\mrs %[ret], control
        : [ret] "=r" (-> control_t),
    );
}

pub inline fn setControl(control: control_t) void {
    asm volatile (
        \\msr control, %[control]
        \\isb
        :
        : [control] "r" (control),
    );
}

pub const irqError = error{
    coreIrqNumber,
    negativeNvicIrq,
};

pub fn nvicSetPriorityGrouping(priorityGrouping: scb_t.aircr_t.prigroup_t) void {
    scb.aircr.prigroup = priorityGrouping;
}

pub fn nvicGetPriorityGrouping() scb_t.aircr_t.prigroup_t {
    return scb.aircr.prigroup;
}

pub fn nvicEnableIrq(irq: irq_t) irqError!void {
    const irqValue = @intFromEnum(irq);

    if (irqValue < 0) {
        return irqError.negativeNvicIrq;
    } else {
        const irqNumber: u8 = @intCast(irqValue);
        const arrayIndex: u8 = irqNumber / 32;
        const bitShift: u5 = @truncate(irqNumber % 32);
        nvic.iser[arrayIndex] |= @as(u32, 0b1) << bitShift;
    }
}

pub fn nvicDisableIrq(irq: irq_t) irqError!void {
    const irqValue = @intFromEnum(irq);

    if (irqValue < 0) {
        return irqError.negativeNvicIrq;
    } else {
        const irqNumber: u8 = @intCast(irqValue);
        const arrayIndex: u8 = irqNumber / 32;
        const bitShift: u5 = @truncate(irqNumber % 32);
        nvic.icer[arrayIndex] |= @as(u32, 0b1) << bitShift;
    }
}

pub fn nvicSetPriority(irq: irq_t, priorityEncoding: u8) irqError!void {
    const irqNumber = @intFromEnum(irq);
    const priorityBits: u8 = @truncate(priorityEncoding << priorityEncodeShift);
    // core interrupt
    if (irqNumber < 0) {
        if (irqNumber < -12) {
            return irqError.coreIrqNumber;
        } else {
            const arrayIndex: usize = @intCast(irqNumber + 12);
            scb.shp[arrayIndex] = priorityBits;
        }
    } else {
        const arrayIndex: usize = @intCast(irqNumber);
        nvic.ip[arrayIndex] = priorityBits;
    }
}

pub fn nvicGetPriority(irq: irq_t) irqError!u8 {
    const irqNumber = @intFromEnum(irq);
    var priorityBits: u8 = undefined;
    // core interrupt
    if (irqNumber < 0) {
        if (irqNumber < -12) {
            return irqError.coreIrqNumber;
        } else {
            const arrayIndex: usize = @intCast(irqNumber + 12);
            priorityBits = scb.shp[arrayIndex];
        }
    } else {
        const arrayIndex: usize = @intCast(irqNumber);
        priorityBits = nvic.ip[arrayIndex];
    }
    const priorityEncoding: u8 = @truncate(priorityBits >> priorityEncodeShift);
    return priorityEncoding;
}

pub fn nvicEncodePriority(priority: priority_t) u8 {
    const groupPriorityBitSize: u4 = @as(u4, 7) -| @max(@intFromEnum(scb.aircr.prigroup), nvicPriorityBitSize - 1);
    const subPriorityBitSize: u4 = @max(@intFromEnum(scb.aircr.prigroup), nvicPriorityBitSize - 1) -| @as(u4, 3);
    var priorityEncoding: u8 = undefined;

    if (groupPriorityBitSize == nvicPriorityBitSize) {
        const groupPriorityMax = priorityTypeMax;
        const groupPriority: u8 = @min(priority.groupPriority, groupPriorityMax);
        priorityEncoding = groupPriority;
    } else if (subPriorityBitSize == nvicPriorityBitSize) {
        const subPriorityMax = priorityTypeMax;
        const subPriority: u8 = @min(priority.subPriority, subPriorityMax);
        priorityEncoding = subPriority;
    } else {
        const groupMaxShift: priorityShift_t = @truncate(nvicPriorityBitSize - groupPriorityBitSize);
        const subMaxShift: priorityShift_t = @truncate(nvicPriorityBitSize - subPriorityBitSize);
        const groupPriorityMax = priorityTypeMax >> groupMaxShift;
        const subPriorityMax = priorityTypeMax >> subMaxShift;
        const groupPriority: u8 = @min(priority.groupPriority, groupPriorityMax);
        const subPriority: u8 = @min(priority.subPriority, subPriorityMax);
        const encodeShift: priorityEncodeShift_t = @truncate(subPriorityBitSize);
        priorityEncoding = (groupPriority << encodeShift) | subPriority;
    }

    return priorityEncoding;
}

pub fn nvicDecodePriority(priorityEncoding: priorityField_t) priority_t {
    const groupPriorityBitSize: u4 = @as(u4, 7) -| @max(@intFromEnum(scb.aircr.prigroup), nvicPriorityBitSize - 1);
    const subPriorityBitSize: u4 = @max(@intFromEnum(scb.aircr.prigroup), nvicPriorityBitSize - 1) -| @as(u4, 3);

    var priority: priority_t = undefined;
    if (groupPriorityBitSize == nvicPriorityBitSize) {
        priority.groupPriority = priorityEncoding;
        priority.subPriority = 0;
    } else if (subPriorityBitSize == nvicPriorityBitSize) {
        priority.groupPriority = 0;
        priority.subPriority = priorityEncoding;
    } else {
        const subPriorityShift: priorityShift_t = subPriorityBitSize;
        const subPriorityMask: priorityField_t = 0xff >> subPriorityShift;
        priority.groupPriority = priorityEncoding >> subPriorityShift;
        priority.subPriority = priorityEncoding & subPriorityMask;
    }

    return priority;
}

fn vectActiveType(comptime enumType: type, comptime newTagType: type) type {
    const enumTypeInfo = @typeInfo(enumType);
    var newEnumTypeInfo = enumTypeInfo;
    newEnumTypeInfo.@"enum".tag_type = newTagType;
    return @Type(newEnumTypeInfo);
}

// Check prigroup_t values
comptime {
    const prigroupTypeInfo = @typeInfo(scb_t.aircr_t.prigroup_t).@"enum";
    for (prigroupTypeInfo.fields) |field| {
        if (field.value < nvicPriorityBitSize - 1) {
            @compileError("Value of prigroup_t." ++ field.name ++ "less then nvicPriorityBitSize - 1");
        }
    }
}
