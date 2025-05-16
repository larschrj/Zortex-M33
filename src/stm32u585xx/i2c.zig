pub const I2c = packed struct {
    cr1: Cr1, // I2C Control register 1, Address offset: 0x00
    cr2: Cr2, // I2C Control register 2, Address offset: 0x04
    oar1: Oar1, // I2C Own address 1 register, Address offset: 0x08
    oar2: Oar2, // I2C Own address 2 register, Address offset: 0x0C
    timingr: Timingr, // I2C Timing register, Address offset: 0x10
    timeotimeoutr_t: u32, // I2C Timeout register, Address offset: 0x14
    isr: Isr, // I2C Interrupt and status register, Address offset: 0x18
    icr: Icr, // I2C Interrupt clear register, Address offset: 0x1C
    pecr: Pecr, // I2C PEC register, Address offset: 0x20
    rxdr: Rxdr, // I2C Receive data register, Address offset: 0x24
    txdr: Txdr, // I2C Transmit data register, Address offset: 0x28
    autocr: Autocr,

    const Cr1 = packed struct(u32) {
        pe: Pe, // Peripheral mode
        txie: Txie, // Tx interrupt enable
        rxie: Rxie, // Rx interrupt enable
        addrie: Addrie, // Address match interrupt enable (target only)
        nackie: Nackie, // Not acknowledge received interrupt enable
        stopie: Stopie, // Stop detection interrupt enable
        tcie: Tcie, // Transfer complete interrupt enable
        errie: Errie, // Error interrupts enable
        dnf: u4, // Digital noise filter
        anfoff: Anfoff, // Analog noise filter off
        _reserved0: u1,
        txdmaen: Txdmaen, // DMA transmission requests enable
        rxdmaen: Rxdmaen, // DMA reception requests enable
        sbc: Sbc, // Target byte control
        nostretch: Nostretch, // Clock stretching disable
        wupen: Wupen, // Wake-up from stop mode enable
        gcen: Gcen, // General call enable
        smbhen: Smbhen, // SMBus host address enable
        smbden: Smbden, // SMBus device default address enable
        alerten: Alerten, // SMBus alert enable
        pecen: Pecen, // PEC enable
        fmp: Fmp, // Fast-mode plus 20 mA drive enable
        _reserved1: u5,
        addraclr: Addraclr, // Address match flag (ADDR) automatic clear
        stopfaclr: Stopfaclr, // Stop detection flag (STOPF) automatic clear

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

        const Anfoff = enum(u1) {
            analog_noise_filter_enabled = 0,
            analog_noise_filter_disabled = 1,
        };

        const Txdmaen = enum(u1) {
            tx_dma_disabled = 0,
            tx_dma_enabled = 1,
        };

        const Rxdmaen = enum(u1) {
            rx_dma_disabled = 0,
            rx_dma_enabled = 1,
        };

        const Sbc = enum(u1) {
            target_byte_control_disable = 0,
            target_byte_control_enable = 1,
        };

        const Nostretch = enum(u1) {
            clock_stretch_disable = 0,
            clock_stretch_enable = 1,
        };

        const Wupen = enum(u1) {
            wake_up_from_stop_disable = 0,
            wake_up_from_stop_enable = 1,
        };

        const Gcen = enum(u1) {
            general_call_disable = 0,
            general_call_enable = 1,
        };

        const Smbhen = enum(u1) {
            host_address_disable = 0,
            host_address_enable = 1,
        };

        const Smbden = enum(u1) {
            device_default_address_disable = 0,
            device_default_address_enable = 1,
        };

        const Alerten = enum(u1) {
            smbus_alert_disable = 0,
            smbus_alert_enable = 1,
        };

        const Pecen = enum(u1) {
            pec_calculation_disable = 0,
            pec_calculation_enable = 1,
        };

        const Fmp = enum(u1) {
            fast_mode_plus_disable = 0,
            fast_mode_plus_enable = 1,
        };

        const Addraclr = enum(u1) {
            addr_flag_set_by_hardware = 0,
            addr_flag_cleared_by_hardware = 1,
        };

        const Stopfaclr = enum(u1) {
            stopf_set_by_hardware = 0,
            stopf_cleared_by_hardware = 1,
        };
    };

    const Cr2 = packed struct(u32) {
        sadd: Sadd, // Target address (controller mode)
        rd_wrn: Rd_wrn, // Transfer direction (controller mode)
        add10: u1, // 10-bit addressing mode (controller mode)
        head10r: u1, // 10-bit address header only read direction (controller receiver mode)
        start: u1, // Start condition generation
        stop: u1, // Stop condition generation
        nack: u1, // Nack generation (target mode)
        nbytes: u8, // Number of bytes
        reload: u1, // Nbytes reload mode
        autoend: u1, //Automatic end mode (controller mode)
        pecbyte: u1, // Packet error checking byte
        _reserved0: u5,

        const Sadd = u10;

        const Rd_wrn = enum(u1) {
            request_write_transfer = 0,
            request_read_transfer = 1,
        };

        const Add10 = enum(u1) {
            address_mode_7bit = 0,
            address_mode_10bit = 1,
        };

        const Head10r = enum(u1) {
            read_seq_complete_10bit = 0,
            read_seq_first_7bit = 1,
        };

        const Start = enum(u1) {
            no_start = 0,
            start = 1,
        };

        const Stop = enum(u1) {
            no_stop = 0,
            stop = 1,
        };

        const Nack = enum(u1) {
            send_ack = 0,
            send_nack = 1,
        };

        const Nbytes = u8;

        const Reload = enum(u1) {
            no_reload = 0,
            reload = 1,
        };

        const Autoend = enum(u1) {
            manual_end_mode = 0,
            auto_end_mode = 1,
        };

        const Pecbyte = enum(u1) {
            no_packet_error_check = 0,
            request_packet_error_check = 1,
        };
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
