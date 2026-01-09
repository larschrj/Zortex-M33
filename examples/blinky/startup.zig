const builtin = @import("builtin");
const irq = @import("interruptHandlers.zig");
const main = @import("main.zig");

//extern fn main() void;
extern var __data_start_flash: u32;
extern var __data_start_ram: u32;
extern var __data_size: u32;
extern var __bss_start: u32;
extern var __bss_size: u32;

export fn Reset_Handler() callconv(.c) void {
    // copy data from flash to RAM
    const data_size = @intFromPtr(&__data_size);
    const data_start_flash: [*]u8 = @ptrCast(&__data_start_flash);
    const data_start_ram: [*]u8 = @ptrCast(&__data_start_ram);
    for (data_start_flash[0..data_size], 0..) |d, i| {
        data_start_ram[i] = d;
    }

    // clear the bss
    const bss_size = @intFromPtr(&__bss_size);
    const bss: [*]u8 = @ptrCast(&__bss_start);
    for (bss[0..bss_size]) |*d| d.* = 0;

    // start
    main.main();
}

export fn BusyDummy_Handler() callconv(.c) void {
    while (true) {}
}

export fn Dummy_Handler() callconv(.c) void {}

const NMI_Handler = BusyDummy_Handler;
const HardFault_Handler = BusyDummy_Handler;
const MemManage_Handler = BusyDummy_Handler;
const BusFault_Handler = BusyDummy_Handler;
const UsageFault_Handler = BusyDummy_Handler;
const SecureFault_Handler = BusyDummy_Handler;
const SVC_Handler = BusyDummy_Handler;
const DebugMon_Handler = BusyDummy_Handler;
const PendSV_Handler = BusyDummy_Handler;
const SysTick_Handler = irq.SysTick_Handler;
const WWDG_IRQHandler = BusyDummy_Handler;
const PVD_PVM_IRQHandler = BusyDummy_Handler;
const RTC_IRQHandler = BusyDummy_Handler;
const RTC_S_IRQHandler = BusyDummy_Handler;
const TAMP_IRQHandler = BusyDummy_Handler;
const RAMCFG_IRQHandler = BusyDummy_Handler;
const FLASH_IRQHandler = BusyDummy_Handler;
const FLASH_S_IRQHandler = BusyDummy_Handler;
const GTZC_IRQHandler = BusyDummy_Handler;
const RCC_IRQHandler = BusyDummy_Handler;
const RCC_S_IRQHandler = BusyDummy_Handler;
const EXTI0_IRQHandler = BusyDummy_Handler;
const EXTI1_IRQHandler = BusyDummy_Handler;
const EXTI2_IRQHandler = BusyDummy_Handler;
const EXTI3_IRQHandler = BusyDummy_Handler;
const EXTI4_IRQHandler = BusyDummy_Handler;
const EXTI5_IRQHandler = BusyDummy_Handler;
const EXTI6_IRQHandler = BusyDummy_Handler;
const EXTI7_IRQHandler = BusyDummy_Handler;
const EXTI8_IRQHandler = BusyDummy_Handler;
const EXTI9_IRQHandler = BusyDummy_Handler;
const EXTI10_IRQHandler = BusyDummy_Handler;
const EXTI11_IRQHandler = BusyDummy_Handler;
const EXTI12_IRQHandler = BusyDummy_Handler;
const EXTI13_IRQHandler = BusyDummy_Handler;
const EXTI14_IRQHandler = BusyDummy_Handler;
const EXTI15_IRQHandler = BusyDummy_Handler;
const IWDG_IRQHandler = BusyDummy_Handler;
const SAES_IRQHandler = BusyDummy_Handler;
const GPDMA1_Channel0_IRQHandler = BusyDummy_Handler;
const GPDMA1_Channel1_IRQHandler = BusyDummy_Handler;
const GPDMA1_Channel2_IRQHandler = BusyDummy_Handler;
const GPDMA1_Channel3_IRQHandler = BusyDummy_Handler;
const GPDMA1_Channel4_IRQHandler = BusyDummy_Handler;
const GPDMA1_Channel5_IRQHandler = BusyDummy_Handler;
const GPDMA1_Channel6_IRQHandler = BusyDummy_Handler;
const GPDMA1_Channel7_IRQHandler = BusyDummy_Handler;
const ADC1_IRQHandler = BusyDummy_Handler;
const DAC1_IRQHandler = BusyDummy_Handler;
const FDCAN1_IT0_IRQHandler = BusyDummy_Handler;
const FDCAN1_IT1_IRQHandler = BusyDummy_Handler;
const TIM1_BRK_IRQHandler = BusyDummy_Handler;
const TIM1_UP_IRQHandler = BusyDummy_Handler;
const TIM1_TRG_COM_IRQHandler = BusyDummy_Handler;
const TIM1_CC_IRQHandler = BusyDummy_Handler;
const TIM2_IRQHandler = BusyDummy_Handler;
const TIM3_IRQHandler = BusyDummy_Handler;
const TIM4_IRQHandler = BusyDummy_Handler;
const TIM5_IRQHandler = BusyDummy_Handler;
const TIM6_IRQHandler = BusyDummy_Handler;
const TIM7_IRQHandler = BusyDummy_Handler;
const TIM8_BRK_IRQHandler = BusyDummy_Handler;
const TIM8_UP_IRQHandler = BusyDummy_Handler;
const TIM8_TRG_COM_IRQHandler = BusyDummy_Handler;
const TIM8_CC_IRQHandler = BusyDummy_Handler;
const I2C1_EV_IRQHandler = BusyDummy_Handler;
const I2C1_ER_IRQHandler = BusyDummy_Handler;
const I2C2_EV_IRQHandler = BusyDummy_Handler;
const I2C2_ER_IRQHandler = BusyDummy_Handler;
const SPI1_IRQHandler = BusyDummy_Handler;
const SPI2_IRQHandler = BusyDummy_Handler;
const USART1_IRQHandler = BusyDummy_Handler;
const USART2_IRQHandler = BusyDummy_Handler;
const USART3_IRQHandler = BusyDummy_Handler;
const UART4_IRQHandler = BusyDummy_Handler;
const UART5_IRQHandler = BusyDummy_Handler;
const LPUART1_IRQHandler = BusyDummy_Handler;
const LPTIM1_IRQHandler = BusyDummy_Handler;
const LPTIM2_IRQHandler = BusyDummy_Handler;
const TIM15_IRQHandler = BusyDummy_Handler;
const TIM16_IRQHandler = BusyDummy_Handler;
const TIM17_IRQHandler = BusyDummy_Handler;
const COMP_IRQHandler = BusyDummy_Handler;
const OTG_FS_IRQHandler = BusyDummy_Handler;
const CRS_IRQHandler = BusyDummy_Handler;
const FMC_IRQHandler = BusyDummy_Handler;
const OCTOSPI1_IRQHandler = BusyDummy_Handler;
const PWR_S3WU_IRQHandler = BusyDummy_Handler;
const SDMMC1_IRQHandler = BusyDummy_Handler;
const SDMMC2_IRQHandler = BusyDummy_Handler;
const GPDMA1_Channel8_IRQHandler = BusyDummy_Handler;
const GPDMA1_Channel9_IRQHandler = BusyDummy_Handler;
const GPDMA1_Channel10_IRQHandler = BusyDummy_Handler;
const GPDMA1_Channel11_IRQHandler = BusyDummy_Handler;
const GPDMA1_Channel12_IRQHandler = BusyDummy_Handler;
const GPDMA1_Channel13_IRQHandler = BusyDummy_Handler;
const GPDMA1_Channel14_IRQHandler = BusyDummy_Handler;
const GPDMA1_Channel15_IRQHandler = BusyDummy_Handler;
const I2C3_EV_IRQHandler = BusyDummy_Handler;
const I2C3_ER_IRQHandler = BusyDummy_Handler;
const SAI1_IRQHandler = BusyDummy_Handler;
const SAI2_IRQHandler = BusyDummy_Handler;
const TSC_IRQHandler = BusyDummy_Handler;
const AES_IRQHandler = BusyDummy_Handler;
const RNG_IRQHandler = BusyDummy_Handler;
const FPU_IRQHandler = BusyDummy_Handler;
const HASH_IRQHandler = BusyDummy_Handler;
const PKA_IRQHandler = BusyDummy_Handler;
const LPTIM3_IRQHandler = BusyDummy_Handler;
const SPI3_IRQHandler = BusyDummy_Handler;
const I2C4_ER_IRQHandler = BusyDummy_Handler;
const I2C4_EV_IRQHandler = BusyDummy_Handler;
const MDF1_FLT0_IRQHandler = BusyDummy_Handler;
const MDF1_FLT1_IRQHandler = BusyDummy_Handler;
const MDF1_FLT2_IRQHandler = BusyDummy_Handler;
const MDF1_FLT3_IRQHandler = BusyDummy_Handler;
const UCPD1_IRQHandler = BusyDummy_Handler;
const ICACHE_IRQHandler = BusyDummy_Handler;
const OTFDEC1_IRQHandler = BusyDummy_Handler;
const OTFDEC2_IRQHandler = BusyDummy_Handler;
const LPTIM4_IRQHandler = BusyDummy_Handler;
const DCACHE1_IRQHandler = BusyDummy_Handler;
const ADF1_IRQHandler = BusyDummy_Handler;
const ADC4_IRQHandler = BusyDummy_Handler;
const LPDMA1_Channel0_IRQHandler = BusyDummy_Handler;
const LPDMA1_Channel1_IRQHandler = BusyDummy_Handler;
const LPDMA1_Channel2_IRQHandler = BusyDummy_Handler;
const LPDMA1_Channel3_IRQHandler = BusyDummy_Handler;
const DMA2D_IRQHandler = BusyDummy_Handler;
const DCMI_PSSI_IRQHandler = BusyDummy_Handler;
const OCTOSPI2_IRQHandler = BusyDummy_Handler;
const MDF1_FLT4_IRQHandler = BusyDummy_Handler;
const MDF1_FLT5_IRQHandler = BusyDummy_Handler;
const CORDIC_IRQHandler = BusyDummy_Handler;
const FMAC_IRQHandler = BusyDummy_Handler;
const LSECSSD_IRQHandler = BusyDummy_Handler;

const Isr = *const fn () callconv(.c) void;

export var vector_table linksection(".isr_vector") = [_]?Isr{
    &Reset_Handler,
    &NMI_Handler,
    &HardFault_Handler,
    &MemManage_Handler,
    &BusFault_Handler,
    &UsageFault_Handler,
    &SecureFault_Handler,
    null,
    null,
    null,
    &SVC_Handler,
    &DebugMon_Handler,
    null,
    &PendSV_Handler,
    &SysTick_Handler,
    &WWDG_IRQHandler,
    &PVD_PVM_IRQHandler,
    &RTC_IRQHandler,
    &RTC_S_IRQHandler,
    &TAMP_IRQHandler,
    &RAMCFG_IRQHandler,
    &FLASH_IRQHandler,
    &FLASH_S_IRQHandler,
    &GTZC_IRQHandler,
    &RCC_IRQHandler,
    &RCC_S_IRQHandler,
    &EXTI0_IRQHandler,
    &EXTI1_IRQHandler,
    &EXTI2_IRQHandler,
    &EXTI3_IRQHandler,
    &EXTI4_IRQHandler,
    &EXTI5_IRQHandler,
    &EXTI6_IRQHandler,
    &EXTI7_IRQHandler,
    &EXTI8_IRQHandler,
    &EXTI9_IRQHandler,
    &EXTI10_IRQHandler,
    &EXTI11_IRQHandler,
    &EXTI12_IRQHandler,
    &EXTI13_IRQHandler,
    &EXTI14_IRQHandler,
    &EXTI15_IRQHandler,
    &IWDG_IRQHandler,
    &SAES_IRQHandler,
    &GPDMA1_Channel0_IRQHandler,
    &GPDMA1_Channel1_IRQHandler,
    &GPDMA1_Channel2_IRQHandler,
    &GPDMA1_Channel3_IRQHandler,
    &GPDMA1_Channel4_IRQHandler,
    &GPDMA1_Channel5_IRQHandler,
    &GPDMA1_Channel6_IRQHandler,
    &GPDMA1_Channel7_IRQHandler,
    &ADC1_IRQHandler,
    &DAC1_IRQHandler,
    &FDCAN1_IT0_IRQHandler,
    &FDCAN1_IT1_IRQHandler,
    &TIM1_BRK_IRQHandler,
    &TIM1_UP_IRQHandler,
    &TIM1_TRG_COM_IRQHandler,
    &TIM1_CC_IRQHandler,
    &TIM2_IRQHandler,
    &TIM3_IRQHandler,
    &TIM4_IRQHandler,
    &TIM5_IRQHandler,
    &TIM6_IRQHandler,
    &TIM7_IRQHandler,
    &TIM8_BRK_IRQHandler,
    &TIM8_UP_IRQHandler,
    &TIM8_TRG_COM_IRQHandler,
    &TIM8_CC_IRQHandler,
    &I2C1_EV_IRQHandler,
    &I2C1_ER_IRQHandler,
    &I2C2_EV_IRQHandler,
    &I2C2_ER_IRQHandler,
    &SPI1_IRQHandler,
    &SPI2_IRQHandler,
    &USART1_IRQHandler,
    &USART2_IRQHandler,
    &USART3_IRQHandler,
    &UART4_IRQHandler,
    &UART5_IRQHandler,
    &LPUART1_IRQHandler,
    &LPTIM1_IRQHandler,
    &LPTIM2_IRQHandler,
    &TIM15_IRQHandler,
    &TIM16_IRQHandler,
    &TIM17_IRQHandler,
    &COMP_IRQHandler,
    &OTG_FS_IRQHandler,
    &CRS_IRQHandler,
    &FMC_IRQHandler,
    &OCTOSPI1_IRQHandler,
    &PWR_S3WU_IRQHandler,
    &SDMMC1_IRQHandler,
    &SDMMC2_IRQHandler,
    &GPDMA1_Channel8_IRQHandler,
    &GPDMA1_Channel9_IRQHandler,
    &GPDMA1_Channel10_IRQHandler,
    &GPDMA1_Channel11_IRQHandler,
    &GPDMA1_Channel12_IRQHandler,
    &GPDMA1_Channel13_IRQHandler,
    &GPDMA1_Channel14_IRQHandler,
    &GPDMA1_Channel15_IRQHandler,
    &I2C3_EV_IRQHandler,
    &I2C3_ER_IRQHandler,
    &SAI1_IRQHandler,
    &SAI2_IRQHandler,
    &TSC_IRQHandler,
    &AES_IRQHandler,
    &RNG_IRQHandler,
    &FPU_IRQHandler,
    &HASH_IRQHandler,
    &PKA_IRQHandler,
    &LPTIM3_IRQHandler,
    &SPI3_IRQHandler,
    &I2C4_ER_IRQHandler,
    &I2C4_EV_IRQHandler,
    &MDF1_FLT0_IRQHandler,
    &MDF1_FLT1_IRQHandler,
    &MDF1_FLT2_IRQHandler,
    &MDF1_FLT3_IRQHandler,
    &UCPD1_IRQHandler,
    &ICACHE_IRQHandler,
    &OTFDEC1_IRQHandler,
    &OTFDEC2_IRQHandler,
    &LPTIM4_IRQHandler,
    &DCACHE1_IRQHandler,
    &ADF1_IRQHandler,
    &ADC4_IRQHandler,
    &LPDMA1_Channel0_IRQHandler,
    &LPDMA1_Channel1_IRQHandler,
    &LPDMA1_Channel2_IRQHandler,
    &LPDMA1_Channel3_IRQHandler,
    &DMA2D_IRQHandler,
    &DCMI_PSSI_IRQHandler,
    &OCTOSPI2_IRQHandler,
    &MDF1_FLT4_IRQHandler,
    &MDF1_FLT5_IRQHandler,
    &CORDIC_IRQHandler,
    &FMAC_IRQHandler,
    &LSECSSD_IRQHandler,
};
