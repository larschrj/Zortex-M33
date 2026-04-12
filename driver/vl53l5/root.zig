const Vl53l5 = @This();

pub const I2c_addr = enum(u8) {
    @"0x44" = 0x44,
    @"0x45" = 0x45,
    @"0x46" = 0x46,
    @"0x47" = 0x47,
};

pub const Error = error{
    Busy,
    BusError,
    ArbitrationLost,
    NotAcknowledge,
    MeasurementNotReady,
};

const ReadFunc = ?*const fn (addr: u10, receive_data: []u8, start: bool, stop: bool, reload: bool) Error!void;
const WriteFunc = ?*const fn (addr: u10, transmit_data: []const u8, start: bool, stop: bool, reload: bool) Error!void;

init: bool = false,
addr: u8 = undefined,
read_func: ReadFunc = null,
write_func: WriteFunc = null,
measurement_mode: MeasurementMode = undefined,
low_power_mode: LowPowerMode = undefined,

pub fn initialize() void {}
