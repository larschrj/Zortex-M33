pub const Uart = packed struct {
    cr1: u32 = @as(u32, 0x00000000), // Control register 1, Address offset 0x00
    cr2: u32 = @as(u32, 0x00000000), // Control register 2, Address offset 0x04
    cr3: u32 = @as(u32, 0x00000000), // Control register 3, Address offset 0x08
    brr: u32 = @as(u32, 0x00000000), // Baud rate register, Address offset 0x0c
    gtpr: u32 = @as(u32, 0x00000000), // Guard time and prescale register, Address offset 0x10
    rtor: u32 = @as(u32, 0x00000000), // Receiver timeout register, Address offset 0x14
    rqr: u32 = @as(u32, 0x00000000), // Request register, Address offset 0x18
    isr: u32 = @as(u32, 0x000000c0), // Interrupt and status register, Address offset 0x1c
    icr: u32 = @as(u32, 0x00000000), // Interrupt flag clear register, Address offset 0x20
    rdr: u32 = @as(u32, 0x00000000), // Receive data register, Address offset 0x24
    tdr: u32 = @as(u32, 0x00000000), // Transmit data register, Address offset 0x28
    presc: u32 = @as(u32, 0x00000000), // Prescaler register, Address offset 0x2c
    autocr: u32 = @as(u32, 0x80000000), // Autonomous mode control register, Address offset 0x30

    pub const Cr1 = packed struct(u32) {};
};
