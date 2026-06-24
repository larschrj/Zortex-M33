const Vl53l5 = @This();
const firmware = @import("firmware.zig");

pub const I2c_addr = enum(u8) {
    @"0x29" = 0x29,
};

pub const Error = error{
    Busy,
    BusError,
    ArbitrationLost,
    NotAcknowledge,
};

const ReadFunc = ?*const fn (register_address: u16, register_data: []u8) Error!void;
const WriteFunc = ?*const fn (register_address: u16, register_data: []u8) Error!void;
const WaitFunc = ?*const fn (msec: u16) void;

init: bool = false,
addr: u8 = I2c_addr.@"0x29",
read_func: ReadFunc = null,
write_func: WriteFunc = null,
wait_func: WaitFunc = null,

pub fn initialize(self: Vl53l5) Error!void {
    var receive_buffer: [1]u8 = undefined;

    // SW reboot sequence
    try self.write_func(0x7fff, &.{0x00});
    try self.write_func(0x0009, &.{0x04});
    try self.write_func(0x000F, &.{0x40});
    try self.write_func(0x000A, &.{0x03});
    try self.read_func(0x7fff, &receive_buffer);
    try self.write_func(0x000c, &.{0x01});
}
