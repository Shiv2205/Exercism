const std = @import("std");

pub fn twoFer(buffer: []u8, name: ?[]const u8) ![]u8 {
    const default = "you";
    const value = name orelse default;

    return (try std.fmt.bufPrint(buffer, "One for {s}, one for me.", .{value}));
}
