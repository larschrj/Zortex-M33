const main = @import("main.zig");
const gpioh = @import("stm32u585xx").gpioh;
const i2c2 = @import("stm32u585xx").i2c2;

// SVC handler has to be split into an assembly only part and zig part
// Any non assembly code in SVC_Handler will typically cause the stack pointer
// to be modified prior to the assembly code which determines which stack pointer
// to pass to the rest of the SVC handler
pub fn SVC_Handler() callconv(.c) void {
    asm volatile (
        \\ tst lr, #4
        \\ ite eq
        \\ mrseq r0, msp
        \\ mrsne r0, psp
        \\ B svcMain
    );
}

export fn svcMain(sp: [*]u32) void {
    const pc: [*]u8 = @ptrFromInt((sp + 6)[0]);
    const svcNumber: u8 = (pc - 2)[0];
    _ = svcNumber;
}

pub fn SysTick_Handler() callconv(.c) void {
    // toggle user leds
    gpioh.odr.p6 ^= 0b1;
    gpioh.odr.p7 ^= 0b1;

    // Usart1 transmit text
    main.usart1.transmitPolling(main.text);
}

pub fn I2C2_EV_IRQHandler() callconv(.c) void {
    if (i2c2.isr.txis == .transmit_empty_interrupt) {}
    if (i2c2.isr.rxne == .receive_not_empty) {}
}

pub fn I2C2_ER_IRQHandler() callconv(.c) void {
    asm volatile (
        \\ bkpt #0
    );
}
