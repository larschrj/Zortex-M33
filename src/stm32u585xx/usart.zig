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
    presc: u32 = @as(u32, 0x00000000), // Prescaler register, Address offset 0x2c
    autocr: u32 = @as(u32, 0x80000000), // Autonomous mode control register, Address offset 0x30

    pub const Cr1 = packed struct(u32) {
        ue: u1, // USART enable
        uesm: u1, // USART enable in low-power mode
        re: u1, // Receiver enable
        te: u1, // Transmitter enable
        idleie: u1, // IDLE interrupt enable
        rxfneie: u1, // RXFIFO not empty interrupt enable
        tcie: u1, // Transmission complete interrupt enable
        txfnfie: u1, // TXFIFO not full interrupt enable
        peie: u1, // PE interrupt enable
        ps: u1, // Parity selection
        pce: u1, // Parity selection
        wake: u1, // Receiver wake-up method
        m0: u1, // Word length
        mme: u1, // Mute mode enable
        cmie: u1, // Character match interrupt enable
        over8: u1, // Oversampling mode
        dedt: u5, // Driver enable deassertion time
        deat: u5, // Driver enable assertion time
        rtoie: u1, // Receiver timeout interrupt enable
        eobie: u1, // End of block interrupt enable
        m1: u1, // Word length
        fifoen: u1, // FIFO mode enable
        txfeie: u1, // TXFIFO empty interrupt enable
        rxffie: u1, // RXFIFO full interrupt enable
    };

    pub const Cr2 = packed struct(u32) {
        slven: u1, // Synchronous target enable
        _reserved0: u2, // Reserved
        dis_nss: u1, // NSS pin input ignored enable
        addm7: u1, // 7-bit address detection/4-bit address detection
        lbdl: u1, // LIN break detection length
        lbdie: u1, // LIN break detection interrupt enable
        _reserved1: u1, // Reserved
        lbcl: u1, // Last bit clock pulse
        cpha: u1, // Clock phase
        cpol: u1, // Clock polarity
        clken: u1, // Clock enable
        stop: u2, // Stop bits
        linen: u1, // LIN mode enable
        swap: u1, // Swap TX/RX pins
        rxinv: u1, // RX pin active level inversion
        txinv: u1, // TX pin active level inversion
        datainv: u1, // Binary data inversion
        msbfirst: u1, // Most significant bit first
        abren: u1, // Auto baud rate enable
        abrmod: u2, // Auto baud rate mode
        rtoen: u1, // Receiver timout enable
        add: u8, // Address of the USART node
    };

    pub const Cr3 = packed struct(u32) {
        eie: u1, // Error interrupt enable
        iren: u1, // IrDA mode enable
        irlp: u1, // IrDA low power
        hdsel: u1, // Half-duplex selection
        nack: u1, // Smartcard nack enable
        scen: u1, // Smartcard mode enable
        dmar: u1, // DMA enable receiver
        dmat: u1, // DMA enable transmitter
        rtse: u1, // RTS enable
        ctse: u1, // CTS enable
        ctsie: u1, // CTS interrupt enable
        onebit: u1, // One sample bit method enable
        ovrdis: u1, // Overrun disable
        ddre: u1, // DMA disable on reception error
        dem: u1, // Driver enable mode
        dep: u1, // Driver enable polarity selection
        _reserved0: u1,
        scarcnt: u3, // Smartcard auto-retry count
        _reserved1: u3,
        txftie: u1, // TXFIFO threshold interrupt enable
        tcbgtie: u1, // Transmission complete before guard time, interrupt enable
        rxftcfg: u3, // Receive FIFO threshold configuration
        rxftie: u1, // RXFIFO threshold interrupt enable
        txftcfg: u3, // TXFIFO threshold configuration
    };

    pub const Brr = packed struct(u32) {
        brr: u16, // USART baud rate
        _reserved0: u16,
    };
};
