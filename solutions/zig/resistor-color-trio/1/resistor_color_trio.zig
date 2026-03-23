const std = @import("std");
const mem = std.mem;

pub const ColorBand = enum(u8) {
    black,
    brown,
    red,
    orange,
    yellow,
    green,
    blue,
    violet,
    grey,
    white,
    _,
};

pub fn label(allocator: mem.Allocator, colors: []const ColorBand) mem.Allocator.Error![]u8 {
    var prefix: []const u8 = "";
    var prefix_size: u8 = 0;

    const exponent = std.math.pow(usize, 10, @intCast(@intFromEnum(colors[2])));
    const res = @as(usize, (@intFromEnum(colors[0]) * 10) + @intFromEnum(colors[1])) * exponent;
    var res_value: f64 = @floatFromInt(res);

    while (res_value > 1.0) {
        res_value /= 1000;
        prefix_size += 3;
    }
    res_value *= 1000;
    prefix_size -|= 3;

    if (prefix_size >= 9) {
        prefix = "giga";
    } else if (prefix_size >= 6) {
        prefix = "mega";
    } else if (prefix_size >= 3) {
        prefix = "kilo";
    }

    const resistance = @divTrunc(res_value, 1);
    const rem = @rem(res_value, 1);

    if (rem == 0) {
        return (try std.fmt.allocPrint(allocator, "{d} {s}ohms", .{ resistance, prefix }));
    } else {
        return (try std.fmt.allocPrint(allocator, "{d}.{d:.0} {s}ohms", .{ resistance, rem * 10, prefix }));
    }
}
