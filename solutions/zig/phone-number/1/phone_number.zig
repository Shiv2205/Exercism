const std = @import("std");
const ascii = std.ascii;

const NANPError = error{
    InvalidLength,
    InvalidCode,
};
const MAX_LEN = 11;

pub fn clean(phrase: []const u8) ?[10]u8 {
    var buffer: [11]u8 = undefined;
    var result: ?[10]u8 = undefined;

    const digit_count: usize = normalize(phrase, &buffer) catch |err| switch (err) {
        error.InvalidLength => return null,
        else => unreachable,
    };

    validateCode(buffer[0..digit_count]) catch |err| switch (err) {
        error.InvalidCode => return null,
        else => unreachable,
    };
    @memcpy(&result.?, buffer[(digit_count - 10)..digit_count]);

    return result;
}

fn normalize(phrase: []const u8, buffer: []u8) NANPError!usize {
    var digit_count: usize = 0;
    for (phrase) |char| {
        if (!ascii.isDigit(char)) continue;
        if (digit_count == MAX_LEN) return NANPError.InvalidLength;

        buffer[digit_count] = char;
        digit_count += 1;
    }

    if (digit_count < 10) return NANPError.InvalidLength;
    return digit_count;
}

fn validateCode(number: []const u8) NANPError!void {
    const area: usize = 0;
    const exchange: usize = 3;
    var num = number;

    if (number.len == MAX_LEN) {
        if (number[0] != '1') return NANPError.InvalidCode;
        num = number[1..];
    }

    if (num[area] < '2' or num[area] > '9') return NANPError.InvalidCode;
    if (num[exchange] < '2' or num[exchange] > '9') return NANPError.InvalidCode;
}
