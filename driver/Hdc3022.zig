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

pub const Status = packed struct(u16) {
    checksum: u1 = 0,
    _reserved0: u3 = 0,
    reset: u1 = 1,
    _reserved1: u1 = 0,
    t_low_alert: u1 = 0,
    t_high_alert: u1 = 0,
    rh_low_alert: u1 = 0,
    rh_high_alert: u1 = 0,
    t_alert: u1 = 0,
    rh_alert: u1 = 0,
    _reserved2: u1 = 0,
    heater_status: u1 = 0,
    _reserved3: u1 = 0,
    alert_status: u1 = 1,
};

pub const Adc = struct {
    temp: u16,
    humidity: u16,
};

// Temperature in degC in Q25.7 signed fixed point format
// Relative humidity in % in UQ16.16 unsigned fixed point format
pub const Sensor = struct {
    temp: i32,
    humidity: u32,
};

pub const Error = error{
    MeasurementNotReady,
};

const ReadFunc = ?*const fn (addr: u10, receive_data: []u8, start: bool, stop: bool, reload: bool) Error!void;
const WriteFunc = ?*const fn (addr: u10, transmit_data: []const u8, start: bool, stop: bool, reload: bool) Error!void;

init: bool = false,
addr: u8 = undefined,
read_func: ReadFunc = null,
write_func: WriteFunc = null,

pub fn softReset(self: *Hdc3022) void {
    const reset = [_]u8{ 0x30, 0xa2 };
    self.write_func(self.addr, &reset);
}

pub fn setMode(self: *Hdc3022, measurement_mode: MeasurementMode, low_power_mode: LowPowerMode) void {
    var transmit_buffer: [2]u8 = switch (measurement_mode) {
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

    self.write_func.?(self.addr, &transmit_buffer, true, true, false) catch {};
}

pub fn getAdc(self: *Hdc3022) Error!Adc {
    const transmit_buffer = [_]u8{ 0xe0, 0x00 };
    var receive_buffer: [6]u8 = undefined;
    try self.write_func.?(self.addr, &transmit_buffer, true, false, false);
    try self.read_func.?(self.addr, &receive_buffer, true, true, false);

    var adc: Adc = undefined;
    adc.temp = (@as(u16, receive_buffer[0]) << 8) | @as(u16, receive_buffer[1]);
    adc.humidity = (@as(u16, receive_buffer[3]) << 8) | @as(u16, receive_buffer[4]);
    return adc;
}

pub fn getStatus(self: *Hdc3022) Status {
    const transmit_buffer: [2]u8 = .{ 0xf3, 0x2d };
    var receive_buffer: [3]u8 = undefined;
    self.write_func.?(self.addr, &transmit_buffer, true, false, false);
    self.read_func.?(self.addr, &receive_buffer, true, true, false);

    const status: Status = @bitCast((@as(u16, receive_buffer[0]) << 8) | @as(u16, receive_buffer[1]));
    return status;
}

// Get temperature and relative humidity reading
// Temperature in degC in Q25.7 signed fixed point format
pub fn getSensor(self: *Hdc3022) Error!Sensor {
    const adc = try getAdc(self);
    var sensor: Sensor = undefined;

    sensor.temp = @divFloor(175 * (@as(i32, adc.temp) << 7), 65535) - 5760;
    sensor.humidity = @divFloor(100 * (@as(u32, adc.humidity) << 8), 65535);
}
