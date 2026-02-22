pub const Usart = packed struct {
    cr1: Cr1 = @bitCast(@as(u32, 0x00000000)), // Control register 1, Address offset 0x00
    cr2: Cr2 = @bitCast(@as(u32, 0x00000000)), // Control register 2, Address offset 0x04
    cr3: Cr3 = @bitCast(@as(u32, 0x00000000)), // Control register 3, Address offset 0x08
    brr: Brr = @bitCast(@as(u32, 0x00000000)), // Baud rate register, Address offset 0x0c
    gtpr: u32 = @as(u32, 0x00000000), // Guard time and prescale register, Address offset 0x10
    rtor: u32 = @as(u32, 0x00000000), // Receiver timeout register, Address offset 0x14
    rqr: u32 = @as(u32, 0x00000000), // Request register, Address offset 0x18
    isr: u32 = @as(u32, 0x000000c0), // Interrupt and status register, Address offset 0x1c
    icr: u32 = @as(u32, 0x00000000), // Interrupt flag clear register, Address offset 0x20
    rdr: u32 = @as(u32, 0x00000000), // Receive data register, Address offset 0x24
    tdr: u32 = @as(u32, 0x00000000), // Transmit data register, Address offset 0x28
    presc: Presc = @bitCast(@as(u32, 0x00000000)), // Prescaler register, Address offset 0x2c
    autocr: u32 = @as(u32, 0x80000000), // Autonomous mode control register, Address offset 0x30

    pub const Cr1 = packed struct(u32) {
        ue: Enable, // USART enable
        uesm: Enable, // USART enable in low-power mode
        re: Enable, // Receiver enable
        te: Enable, // Transmitter enable
        idleie: Enable, // IDLE interrupt enable
        rxfneie: Enable, // RXFIFO not empty interrupt enable
        tcie: Enable, // Transmission complete interrupt enable
        txfnfie: Enable, // TXFIFO not full interrupt enable
        peie: Enable, // PE interrupt enable
        ps: Ps, // Parity selection
        pce: Enable, // Parity control enable
        wake: Wake, // Receiver wake-up method
        m0: u1, // Word length
        mme: Enable, // Mute mode enable
        cmie: Enable, // Character match interrupt enable
        over8: Over8, // Oversampling mode
        dedt: u5, // Driver enable deassertion time
        deat: u5, // Driver enable assertion time
        rtoie: Enable, // Receiver timeout interrupt enable
        eobie: Enable, // End of block interrupt enable
        m1: u1, // Word length
        fifoen: Enable, // FIFO mode enable
        txfeie: Enable, // TXFIFO empty interrupt enable
        rxffie: Enable, // RXFIFO full interrupt enable

        pub const Ps = enum(u1) {
            even = 0b0,
            odd = 0b1,
        };

        pub const Wake = enum(u1) {
            idle_line = 0b0,
            address_mark = 0b1,
        };

        pub const Over8 = enum(u1) {
            oversampling16 = 0b0,
            oversampling8 = 0b1,
        };
    };

    pub const Cr2 = packed struct(u32) {
        slven: Enable, // Synchronous target enable
        _reserved0: u2, // Reserved
        dis_nss: Enable, // NSS pin input ignored enable
        addm7: Addm7, // 7-bit address detection/4-bit address detection
        lbdl: Lbdl, // LIN break detection length
        lbdie: Enable, // LIN break detection interrupt enable
        _reserved1: u1, // Reserved
        lbcl: Enable, // Last bit clock pulse
        cpha: Cpha, // Clock phase
        cpol: Cpol, // Clock polarity
        clken: Enable, // Clock enable
        stop: Stop, // Stop bits
        linen: Enable, // LIN mode enable
        swap: Enable, // Swap TX/RX pins
        rxinv: Enable, // RX pin active level inversion
        txinv: Enable, // TX pin active level inversion
        datainv: Enable, // Binary data inversion
        msbfirst: Enable, // Most significant bit first
        abren: Enable, // Auto baud rate enable
        abrmod: Abrmod, // Auto baud rate mode
        rtoen: Enable, // Receiver timout enable
        add: u8, // Address of the USART node

        pub const Addm7 = enum(u1) {
            @"4bit" = 0b0,
            @"7bit" = 0b1,
        };

        pub const Lbdl = enum(u1) {
            @"10bit" = 0b0,
            @"11bit" = 0b1,
        };

        pub const Cpha = enum(u1) {
            first_data_capture = 0b0,
            second_data_capture = 0b1,
        };

        pub const Cpol = enum(u1) {
            low = 0b0,
            high = 0b1,
        };

        pub const Stop = enum(u2) {
            @"1bit" = 0b00,
            @"0.5bit" = 0b01,
            @"2bit" = 0b10,
            @"1.5bit" = 0b11,
        };

        pub const Abrmod = enum(u2) {
            start_bit = 0b00,
            falling_edge = 0b01,
            @"0x7f" = 0b10,
            @"0x55" = 0b11,
        };
    };

    pub const Cr3 = packed struct(u32) {
        eie: Enable, // Error interrupt enable
        iren: Enable, // IrDA mode enable
        irlp: u1, // IrDA low power
        hdsel: u1, // Half-duplex selection
        nack: Enable, // Smartcard nack enable
        scen: Enable, // Smartcard mode enable
        dmar: u1, // DMA enable receiver
        dmat: u1, // DMA enable transmitter
        rtse: Enable, // RTS enable
        ctse: Enable, // CTS enable
        ctsie: Enable, // CTS interrupt enable
        onebit: Enable, // One sample bit method enable
        ovrdis: Disable, // Overrun disable
        ddre: Enable, // DMA disable on reception error
        dem: Enable, // Driver enable mode
        dep: Dep, // Driver enable polarity selection
        _reserved0: u1,
        scarcnt: u3, // Smartcard auto-retry count
        _reserved1: u3,
        txftie: Enable, // TXFIFO threshold interrupt enable
        tcbgtie: Enable, // Transmission complete before guard time, interrupt enable
        rxftcfg: Ftcfg, // Receive FIFO threshold configuration
        rxftie: Enable, // RXFIFO threshold interrupt enable
        txftcfg: Ftcfg, // TXFIFO threshold configuration

        pub const Dep = enum(u1) {
            active_high = 0b0,
            active_low = 0b1,
        };

        pub const Ftcfg = enum(u3) {
            @"1/8" = 0b000,
            @"1/4" = 0b001,
            @"1/2" = 0b010,
            @"3/4" = 0b011,
            @"7/8" = 0b100,
            empty = 0b101,
        };
    };

    pub const Brr = packed struct(u32) {
        brr: u16, // USART baud rate
        _reserved0: u16,
    };

    pub const Presc = packed struct(u32) {
        prescaler: Prescaler,
        _reserved0: u28,

        pub const Prescaler = enum(u4) {
            div1 = 0b0000,
            div2 = 0b0001,
            div4 = 0b0010,
            div6 = 0b0011,
            div8 = 0b0100,
            div10 = 0b0101,
            div12 = 0b0110,
            div16 = 0b0111,
            div32 = 0b1000,
            div64 = 0b1001,
            div128 = 0b1010,
            div256 = 0b1011,
        };
    };

    pub const Enable = enum(u1) {
        disable = 0b0,
        enable = 0b1,
    };

    pub const Disable = enum(u1) {
        enable = 0b0,
        disable = 0b1,
    };
};
