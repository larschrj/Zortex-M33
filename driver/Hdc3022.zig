const Hdc3022 = @This();

pub const I2c_addr = enum(u8) {
    @"0x44" = 0x44,
    @"0x45" = 0x45,
    @"0x46" = 0x46,
    @"0x47" = 0x47,
};

pub const MeasurementMode = enum {
    single,
    auto_0p5Hz,
    auto_1Hz,
    auto_2Hz,
    auto_4Hz,
    auto_10Hz,
};

pub const LowPowerMode = enum {
    low_power_mode_0,
    low_power_mode_1,
    low_power_mode_2,
    low_power_mode_3,
};

const ReadFunc = ?*const fn (addr: u8, receive_data: []u8) void;
const WriteFunc = ?*const fn (addr: u8, transmit_data: []u8) void;

init: bool = false,
addr: u8 = undefined,
read_func: ReadFunc = null,
write_func: WriteFunc = null,

pub fn softReset(self: *Hdc3022) void {
    const reset = [_]u8{ 0x30, 0xa2 };
    self.write_func(self.addr, &reset);
}

pub fn setMode(self: *Hdc3022, measurement_mode: MeasurementMode, low_power_mode: LowPowerMode) void {
    const transmit_buffer: [2]u8 = switch (measurement_mode) {
        .single => switch (low_power_mode) {
            .low_power_mode_0 => .{ 0x24, 0x00 },
            .low_power_mode_1 => .{ 0x24, 0x0b },
            .low_power_mode_2 => .{ 0x24, 0x16 },
            .low_power_mode_3 => .{ 0x24, 0xff },
        },
        .auto_0p5Hz => switch (low_power_mode) {
            .low_power_mode_0 => .{ 0x20, 0x32 },
            .low_power_mode_1 => .{ 0x20, 0x24 },
            .low_power_mode_2 => .{ 0x20, 0x2f },
            .low_power_mode_3 => .{ 0x20, 0xff },
        },
        .auto_1Hz => switch (low_power_mode) {
            .low_power_mode_0 => .{ 0x21, 0x30 },
            .low_power_mode_1 => .{ 0x21, 0x26 },
            .low_power_mode_2 => .{ 0x21, 0x2d },
            .low_power_mode_3 => .{ 0x21, 0xff },
        },
        .auto_2Hz => switch (low_power_mode) {
            .low_power_mode_0 => .{ 0x22, 0x36 },
            .low_power_mode_1 => .{ 0x22, 0x20 },
            .low_power_mode_2 => .{ 0x22, 0x2b },
            .low_power_mode_3 => .{ 0x22, 0xff },
        },
        .auto_4Hz => switch (low_power_mode) {
            .low_power_mode_0 => .{ 0x23, 0x34 },
            .low_power_mode_1 => .{ 0x23, 0x22 },
            .low_power_mode_2 => .{ 0x23, 0x29 },
            .low_power_mode_3 => .{ 0x23, 0xff },
        },
        .auto_10Hz => switch (low_power_mode) {
            .low_power_mode_0 => .{ 0x27, 0x37 },
            .low_power_mode_1 => .{ 0x27, 0x21 },
            .low_power_mode_2 => .{ 0x27, 0x2a },
            .low_power_mode_3 => .{ 0x27, 0xff },
        },
    };

    self.write_func.?(self.addr, &transmit_buffer);
}
