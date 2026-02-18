const Lps22hh = @This();

const Register = packed struct {};

const register: *align(1) volatile Register = @ptrFromInt(0xb);
