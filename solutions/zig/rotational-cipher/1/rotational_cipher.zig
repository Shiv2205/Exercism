const std = @import("std");
const mem = std.mem;
const ascii = std.ascii;
const Aligned = std.array_list.Aligned(u8, null);

const alphabet = "abcdefghijklmnopqrstuvwxyz";

pub fn rotate(allocator: mem.Allocator, text: []const u8, shiftKey: u5) mem.Allocator.Error![]u8 {
    var cipher = try Aligned.initCapacity(allocator, text.len);
    errdefer cipher.deinit(allocator);

    var upper_found: bool = false;

    for (text) |char| {
        if (ascii.isAlphabetic(char)) {
            if (ascii.isUpper(char)) upper_found = true;

            var sub = alphabet[getShiftIndex(char, shiftKey)];
            if (upper_found) {
                sub = ascii.toUpper(sub);
                upper_found = false;
            }

            cipher.appendAssumeCapacity(sub);
        } else {
            cipher.appendAssumeCapacity(char);
        }
    }

    return try cipher.toOwnedSlice(allocator);
}

fn getShiftIndex(char: u8, shift_key: u5) usize {
    return @intCast(((ascii.toLower(char) - 'a') + @as(u8, shift_key)) % 26);
}
