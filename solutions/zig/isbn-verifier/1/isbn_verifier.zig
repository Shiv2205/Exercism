const std = @import("std");

pub fn isValidIsbn10(s: []const u8) bool {
    if (s.len < 10) {
        return false;
    }

    var position: u8 = 10;
    var total: usize = 0;
    for (s) |char| {
        if (position == 0) {
            return false;
        }

        if (char >= 'A' and char <= 'Z') {
            if (char == 'X' and position == 1) {
                total += @as(usize, 10);
                position -|= 1;
            } else {
                return false;
            }
        }

        if (std.ascii.isDigit(char)) {
            const digit = char - '0';
            total += @as(usize, digit * position);
            position -|= 1;
        }
    }

    return total % 11 == 0;
}
