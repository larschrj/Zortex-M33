# Zortex-M33
Minimal bare metal Zig for Arm Cortex-M33 using [STM32U585AI](https://www.st.com/en/microcontrollers-microprocessors/stm32u585ai.html) on the [B-U585I-IOT02A](https://www.st.com/en/evaluation-tools/b-u585i-iot02a.html) board.

Inspired by and builds on the [embedded_zig](https://github.com/tralamazza/embedded_zig) project.

Tested with Zig v0.14.x and v0.15.x.

## Getting Started

### Building examples
```
git clone https://github.com/larschrj/Zortex-M33.git
cd ./Zortex-M33
zig build
```
Example .elf files are placed in ```zig-out/bin/```.

### Flash blinky example to board
Using OpenOCD
```
openocd -f interface/stlink.cfg -f target/stm32u5x.cfg -c "program zig-out/bin/blinky.elf reset exit"
```

### Flash and debug blinky example using GDB
Start OpenOCD
```
openocd -f interface/stlink.cfg -f target/stm32u5x.cfg
```

In another terminal
```
arm-none-eabi-gdb zig-out/bin/blinky.elf
```
