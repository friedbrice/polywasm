const std = @import("std");
const Builder = std.build.Builder;
const builtin = @import("builtin");

pub fn build(b: *Builder) void {
    const lib = b.addSharedLibrary(.{
        .name = "zigmath",
        .root_source_file = .{ .path = "src/zigmath.zig" },
        .target = .{ .cpu_arch = .wasm32, .os_tag = .freestanding },
        .optimize = .Debug, // you can use the b.standardOptimizeOption(.{}) above this function call instead
        .version = .{ .major = 0, .minor = 0, .patch = 1 },
    });
    lib.rdynamic = true; // by default exports won't be exported so do this to make it all work

    const install = b.addInstallArtifact(lib, .{});
    install.step.dependOn(&lib.step);
    b.default_step.dependOn(&install.step);
}
