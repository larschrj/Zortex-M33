const Hdc3022 = @This();

pub const I2c_addr = enum(u8) {
    @"0x44" = 0x44,
    @"0x45" = 0x45,
    @"0x46" = 0x46,
    @"0x47" = 0x47,
};

const ReadFunc = ?*const fn (register_address: u8, register_data: []u8) void;
const WriteFunc = ?*const fn (register_address: u8, register_data: []u8) void;

init: bool = false,
addr: u8 = undefined,
read_func: ReadFunc = null,
write_func: WriteFunc = null,

pub fn softReset() void {}
