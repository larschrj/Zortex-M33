const std = @import("std");

pub fn build(b: *std.Build) void {
    const mode = b.standardOptimizeOption(.{});
    const arch = std.Target.Cpu.Arch.thumb;
    const os = std.Target.Os.Tag.freestanding;
    const abi = std.Target.Abi.eabihf;
    const cpumodel = std.Target.arm.cpu.cortex_m33;
    var features = std.Target.Cpu.Feature.Set.empty;
    features.addFeature(@intFromEnum(std.Target.arm.Feature.fp_armv8));
    features.addFeature(@intFromEnum(std.Target.arm.Feature.atomics_32));

    const query = std.Target.Query{
        .cpu_arch = arch,
        .os_tag = os,
        .abi = abi,
        .cpu_model = std.Target.Query.CpuModel{ .explicit = &cpumodel },
        .cpu_features_add = features,
    };
    const target = b.resolveTargetQuery(query);

    // stm32u585xx cortex-m33 functions and peripherals
    const irq_stm32u585xx = b.addModule("irq", .{
        .root_source_file = b.path("./src/stm32u585xx/irq.zig"),
        .target = target,
        .optimize = mode,
        .unwind_tables = .none,
    });

    const core_cm33_stm32u585xx = b.addModule("core_cm33", .{
        .root_source_file = b.path("./src/core_cm33.zig"),
        .target = target,
        .optimize = mode,
        .unwind_tables = .none,
    });
    core_cm33_stm32u585xx.addImport("irq", irq_stm32u585xx);

    const stm32u585xx = b.addModule("stm32u585xx ", .{
        .root_source_file = b.path("./src/stm32u585xx/stm32u585xx.zig"),
        .target = target,
        .optimize = mode,
        .unwind_tables = .none,
    });
    stm32u585xx.addImport("core_cm33", core_cm33_stm32u585xx);

    // blinky
    var blinky_root_module = b.createModule(.{
        .root_source_file = b.path("./examples/blinky/startup.zig"),
        .target = target,
        .optimize = mode,
        .unwind_tables = .none,
    });
    blinky_root_module.addImport("stm32u585xx", stm32u585xx);
    var blinky_exe = b.addExecutable(.{
        .name = "blinky.elf",
        .root_module = blinky_root_module,
    });
    blinky_exe.entry = .{ .symbol_name = "Reset_Handler" };
    blinky_exe.setLinkerScript(b.path("./src/stm32u585xx/stm32u585aiixq_flash.ld"));
    b.default_step.dependOn(&blinky_exe.step);
    b.installArtifact(blinky_exe);

    // cordic
    const cordic_root_module = b.createModule(.{
        .root_source_file = b.path("./examples/cordic/startup.zig"),
        .target = target,
        .optimize = mode,
        .unwind_tables = .none,
    });
    cordic_root_module.addImport("stm32u585xx", stm32u585xx);
    const cordic_exe = b.addExecutable(.{
        .name = "cordic.elf",
        .root_module = cordic_root_module,
    });
    cordic_exe.entry = .{ .symbol_name = "Reset_Handler" };
    cordic_exe.setLinkerScript(b.path("./src/stm32u585xx/stm32u585aiixq_flash.ld"));
    b.default_step.dependOn(&cordic_exe.step);
    b.installArtifact(cordic_exe);

    // board/b-u585-iot02a/i2c
    const b_u585_i2c_root_module = b.createModule(.{
        .root_source_file = b.path("./examples/b-u585-iot02a/i2c/startup.zig"),
        .target = target,
        .optimize = mode,
        .unwind_tables = .none,
    });
    b_u585_i2c_root_module.addImport("stm32u585xx", stm32u585xx);
    const b_u585_i2c_exe = b.addExecutable(.{
        .name = "b_u585_i2c.elf",
        .root_module = b_u585_i2c_root_module,
    });
    b_u585_i2c_exe.entry = .{ .symbol_name = "Reset_Handler" };
    b_u585_i2c_exe.setLinkerScript(b.path("./src/stm32u585xx/stm32u585aiixq_flash.ld"));
    b.default_step.dependOn(&b_u585_i2c_exe.step);
    b.installArtifact(b_u585_i2c_exe);
}
