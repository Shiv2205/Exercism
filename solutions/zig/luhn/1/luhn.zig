const std = @import("std");
const mem = std.mem;

pub fn isValid(s: []const u8) bool {
    if (mem.trim(u8, s, " ").len < 2 or !isAllDigits(s)) return false;

    var double: bool = false;
    var total: usize = 0;
    for (s, 0..) |_, i| {
        const char = s[s.len - (i + 1)];
        if (char == ' ') continue;

        var digit: usize = @intCast(char - '0');
        if (double) {
            digit *= 2;
            if (digit > 9) digit -= 9;
        }

        total += digit;
        double = !double;
    }

    return total % 10 == 0;
}

fn isAllDigits(s: []const u8) bool {
    for (s) |char| switch (char) {
        '0'...'9', ' ' => continue,
        else => return false,
    };
    return true;
}
