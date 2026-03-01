const std = @import("std");

const Lps22hh = @This();

const Register = packed struct {
    interrupt_cfg: u8 = 0, // Interrupt
    ths_p_l: u8 = 0, // Pressure threshold
    ths_p_h: u8 = 0, // Pressure threshold
    if_ctrl: u8 = 0, // Interface control
    who_am_i: u8 = 0b10110011, // Who am i
    ctrl_reg1: u8 = 0, // Control
    ctrl_reg2: u8 = 0, // Control
    ctrl_reg3: u8 = 0, // Control
    fifo_ctrl: u8 = 0, // FIFO configuration
    fifo_wtm: u8 = 0, // FIFO configuration
    ref_p_l: u8 = 0, // Reference pressure
    ref_p_h: u8 = 0, // Reference pressure
    _reserved0: u8 = 0,
    rpds_l: u8 = 0, // Pressure offset
    rpds_h: u8 = 0, // Pressure offset
    _reserved1: u8,
    int_source: u8, // Interrupt
    fifo_status1: u8, // FIFO status
    fifo_status2: u8, // FIFO status
    status: u8, // Status
    pressure_out_xl: u8, // Pressure output
    pressure_out_l: u8, // Pressure output
    pressure_out_h: u8, // Pressure output
    temp_out_l: u8, // Temperature output
    temp_out_h: u8, // Temperature output
    _reserved2: u8,
    fifo_data_out_press_xl: u8, // FIFO pressure output
    fifo_data_out_press_l: u8, // FIFO pressure output
    fifo_data_out_press_h: u8, // FIFO pressure output
    fifo_data_out_temp_l: u8, // FIFO temperature output
    fifo_data_out_temp_h: u8, // FIFO temperature output
};

const register: *align(1) volatile Register = @ptrFromInt(0xb);

test "Register address" {
    std.debug.print("@offsetOf(Register, \"fifo_wtm\") = {x}\n", .{@offsetOf(Register, "fifo_wtm")});
}
