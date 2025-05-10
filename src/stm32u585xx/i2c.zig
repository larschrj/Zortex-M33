pub const I2c = packed struct {
    cr1: Cr1, // I2C Control register 1,            Address offset: 0x00
    cr2: Cr2, // I2C Control register 2,            Address offset: 0x04
    oar1: Oar1, // I2C Own address 1 register,        Address offset: 0x08
    oar2: Oar2, // I2C Own address 2 register,        Address offset: 0x0C
    timingr: Timingr, // I2C Timing register,               Address offset: 0x10
    timeotimeoutr_t: u32, // I2C Timeout register,              Address offset: 0x14
    isr: Isr, // I2C Interrupt and status register, Address offset: 0x18
    icr: Icr, // I2C Interrupt clear register,      Address offset: 0x1C
    pecr: Pecr, // I2C PEC register,                  Address offset: 0x20
    rxdr: Rxdr, // I2C Receive data register,         Address offset: 0x24
    txdr: Txdr, // I2C Transmit data register,        Address offset: 0x28
    autocr: Autocr,

    const Cr1 = packed struct(u32) {
        pe: Pe,
        txie: Txie,
        rxie: Rxie,
        addrie: Addrie,
        nackie: Nackie,
        stopie: Stopie,
        tcie: Tcie,
        errie: Errie,
        dnf: u4,
        anfoff: u1,
        _reserved0: u1,
        txdmaen: u1,
        rxdmaen: u1,
        sbc: u1,
        nostretch: u1,
        wupen: u1,
        gcen: u1,
        smbhen: u1,
        smbden: u1,
        alerten: u1,
        pecen: u1,
        fmp: u1,
        _reserved1: u5,
        addraclr: u1,
        stopfaclr: u1,

        const Pe = enum(u1) {
            peripherial_disable = 0,
            peripheral_enable = 1,
        };

        const Txie = enum(u1) {
            transmit_interrupt_disable = 0,
            transmit_interrupt_enable = 1,
        };

        const Rxie = enum(u1) {
            receive_interrupt_disable = 0,
            receive_interrupt_enable = 1,
        };

        const Addrie = enum(u1) {
            address_interrupt_disable = 0,
            address_interrupt_enable = 1,
        };

        const Nackie = enum(u1) {
            nack_interrupt_disable = 0,
            nack_interrupt_enable = 1,
        };

        const Stopie = enum(u1) {
            stop_interrupt_disable = 0,
            stop_interrupt_enable = 1,
        };

        const Tcie = enum(u1) {
            transfer_complete_interrupt_disable = 0,
            transfer_complete_interrupt_enable = 1,
        };

        const Errie = enum(u1) {
            error_interrupt_disable = 0,
            error_interrupt_enable = 1,
        };
    };

    const Cr2 = packed struct(u32) {
        sadd: u10,
        rd_wrn: u1,
        add10: u1,
        head10r: u1,
        start: u1,
        stop: u1,
        nack: u1,
        nbytes: u8,
        reload: u1,
        autoend: u1,
        pecbyte: u1,
        _reserved0: u5,
    };

    const Oar1 = packed struct(u32) {
        oa1: u10,
        oa1mode: u1,
        _reserved0: u4,
        oa1en: u1,
        _reserved1: u16,
    };

    const Oar2 = packed struct(u32) {
        _reserved0: u1,
        oa2: u7,
        oa2msk: u3,
        _reserved1: u4,
        oa2en: u1,
        _reserved2: u16,
    };

    const Timingr = packed struct(u32) {
        scll: u8,
        sclh: u8,
        sdadel: u4,
        scldel: u4,
        _reserved0: u4,
        presc: u4,
    };

    const Timeoutr = packed struct(u32) {
        timeouta: u12,
        tidle: u1,
        _reserved0: u2,
        timouten: u1,
        timeoutb: u12,
        _reserved1: u3,
        texten: u1,
    };

    const Isr = packed struct(u32) {
        txe: u1,
        txis: u1,
        rxne: u1,
        addr: u1,
        nackf: u1,
        stopf: u1,
        tc: u1,
        tcr: u1,
        berr: u1,
        arlo: u1,
        ovr: u1,
        pecerr: u1,
        timeout: u1,
        alert: u1,
        _reserved0: u1,
        busy: u1,
        dir: u1,
        addcode: u7,
        _reserved1: u8,
    };

    const Icr = packed struct(u32) {
        _reserved0: u3,
        addrcf: u1,
        nackcf: u1,
        _reserved1: u2,
        berrcf: u1,
        arlocf: u1,
        ovrcf: u1,
        peccf: u1,
        timoutcf: u1,
        alertcf: u1,
        _reserved2: u18,
    };

    const Pecr = packed struct(u32) {
        pec: u8,
        _reserved0: u24,
    };

    const Rxdr = packed struct(u32) {
        rxdata: u8,
        _reserved0: u32,
    };

    const Txdr = packed struct(u32) {
        txdata: u8,
        _reserved0: u32,
    };

    const Autocr = packed struct(u32) {
        _reserved0: u6,
        tcdmaen: u1,
        tcrdmaen: u1,
        _reserved1: u8,
        trigsel: u4,
        trigpol: u1,
        trigen: u1,
        _reserved2: u10,
    };
};

const i2c1_base = 0x40005400;
const i2c2_base = 0x40005800;
const i2c3_base = 0x46002800;
const i2c4_base = 0x40008400;
pub const i2c1: *volatile I2c = @ptrFromInt(i2c1_base);
pub const i2c2: *volatile I2c = @ptrFromInt(i2c2_base);
pub const i2c3: *volatile I2c = @ptrFromInt(i2c3_base);
pub const i2c4: *volatile I2c = @ptrFromInt(i2c4_base);
