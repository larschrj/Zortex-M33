pub const I2c = packed struct {
    cr1: Cr1, // I2C Control register 1, Address offset: 0x00
    cr2: Cr2, // I2C Control register 2, Address offset: 0x04
    oar1: Oar1, // I2C Own address 1 register, Address offset: 0x08
    oar2: Oar2, // I2C Own address 2 register, Address offset: 0x0C
    timingr: Timingr, // I2C Timing register, Address offset: 0x10
    timeoutr: Timeoutr, // I2C Timeout register, Address offset: 0x14
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
        add10: Add10, // 10-bit addressing mode (controller mode)
        head10r: Head10r, // 10-bit address header only read direction (controller receiver mode)
        start: Start, // Start condition generation
        stop: Stop, // Stop condition generation
        nack: Nack, // Nack generation (target mode)
        nbytes: Nbytes, // Number of bytes
        reload: Reload, // Nbytes reload mode
        autoend: Autoend, //Automatic end mode (controller mode)
        pecbyte: Pecbyte, // Packet error checking byte
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
        scll: Scll, // SCL low period, t_scll = (scll + 1)*t_presc
        sclh: Sclh, // SCL high period, t_sclh = (sclh + 1)*t_presc
        sdadel: Sdadel, // Data hold time, t_sdadel = sdadel*t_presc
        scldel: Scldel, // Data setup time, t_scldel = (scldel + 1)*t_presc
        _reserved0: u4,
        presc: Presc, // Timing prescaler, t_presc = (presc + 1)*t_i2cclk

        const Scll = u8;

        const Sclh = u8;

        const Sdadel = u4;

        const Scldel = u4;

        const Presc = u4;
    };

    const Timeoutr = packed struct(u32) {
        timeouta: Timeouta, // Bus timeout a
        tidle: Tidle, // Idle clock timeout detection
        _reserved0: u2,
        timouten: Timeouten, // Clock timeout enable
        timeoutb: Timeoutb, // Bus timeout b
        _reserved1: u3,
        texten: u1, // Extended clock timeout enable

        const Timeouta = u12;

        const Tidle = enum(u1) {
            timeouta_scl_low_timeout = 0,
            timeouta_scl_low_sda_high_timeout = 1,
        };

        const Timeouten = enum(u1) {
            scl_timeout_detection_disable = 0,
            scl_timeout_detection_enable = 1,
        };

        const Timeoutb = u12;

        const Texten = enum(u1) {
            extended_timeout_detection_disable = 0,
            extended_timeout_detection_enable = 1,
        };
    };

    const Isr = packed struct(u32) {
        txe: Txe, // Transmit data register empty (transmitters)
        txis: Txis, // Transmit interrupt status (transmitters)
        rxne: Rxne, // Receive data register not empty (receivers)
        addr: Addr, // Address matched (target mode)
        nackf: Nackf, // Not acknowledge received flag
        stopf: Stopf, // Stop detection flag
        tc: Tc, // Transfer complete (controller mode)
        tcr: Tcr, // Transfer complete reload
        berr: Berr, // Bus error
        arlo: Arlo, // Arbitration lost
        ovr: Ovr, // Overrun/underrun (target mode)
        pecerr: Pecerr, // Pec error in reception
        timeout: Timeout, // Timeout or t_low detection flag
        alert: Alert, // SMBus alert
        _reserved0: u1,
        busy: Busy, // Bus busy
        dir: Dir, // Transfer direction (target mode)
        addcode: Addcode, // Address match code (target mode)
        _reserved1: u8,

        const Txe = enum(u1) {
            transmit_empty = 1,
        };

        const Txis = enum(u1) {
            transmit_empty_interrupt = 1,
        };

        const Rxne = enum(u1) {
            receive_not_empty = 1,
        };

        const Addr = enum(u1) {
            address_match = 1,
        };

        const Nackf = enum(u1) {
            nack_received = 1,
        };

        const Stopf = enum(u1) {
            stop_detected = 1,
        };

        const Tc = enum(u1) {
            transfer_complete = 1,
        };

        const Tcr = Tc;

        const Berr = enum(u1) {
            bus_error = 1,
        };

        const Arlo = enum(u1) {
            arbitration_lost = 1,
        };

        const Ovr = enum(u1) {
            overrun_underrun = 1,
        };

        const Pecerr = enum(u1) {
            pec_error = 1,
        };

        const Timeout = enum(u1) {
            timeout_tlow_detected = 1,
        };

        const Alert = enum(u1) {
            smbus_alert = 1,
        };

        const Busy = enum(u1) {
            bus_busy = 1,
        };

        const Dir = enum(u1) {
            write_transfer = 0,
            read_transfer = 1,
        };

        const Addcode = u7;
    };

    const Icr = packed struct(u32) {
        _reserved0: u3,
        addrcf: Addrcf,
        nackcf: Nackcf,
        _reserved1: u2,
        berrcf: Berrcf,
        arlocf: Arlocf,
        ovrcf: Ovrcf,
        peccf: Peccf,
        timoutcf: Timoutcf,
        alertcf: Alertcf,
        _reserved2: u18,

        const Addrcf = enum(u1) {
            address_matched_flag_clear = 1,
        };

        const Nackcf = enum(u1) {
            not_acknowledge_flag_clear = 1,
        };

        const Stopcf = enum(u1) {
            stop_detection_flag_clear = 1,
        };

        const Berrcf = enum(u1) {
            bus_error_flag_clear = 1,
        };

        const Arlocf = enum(u1) {
            arbitration_lost_flag_clear = 1,
        };

        const Ovrcf = enum(u1) {
            overrun_underrun_flag_clear = 1,
        };

        const Peccf = enum(u1) {
            pec_error_flag_clear = 1,
        };

        const Timoutcf = enum(u1) {
            timeout_detection_flag_clear = 1,
        };

        const Alertcf = enum(u1) {
            alert_flag_clear = 1,
        };
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
