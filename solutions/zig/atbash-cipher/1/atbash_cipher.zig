const std = @import("std");
const mem = std.mem;
const ascii = std.ascii;

const Aligned = std.array_list.Aligned;
const alphabet = "abcdefghijklmnopqrstuvwxyz";

/// Encodes `s` using the Atbash cipher. Caller owns the returned memory.
pub fn encode(allocator: mem.Allocator, s: []const u8) mem.Allocator.Error![]u8 {
    const spaces = s.len / 5;
    var cipher = try Aligned(u8, null).initCapacity(allocator, s.len + spaces);

    var char_count: u3 = 5;
    for (s, 0..s.len) |char, i| {
        if (ascii.isAlphanumeric(char)) {
            if (ascii.isAlphabetic(char)) {
                try cipher.append(allocator, getReverseAlpha(char));
            } else {
                try cipher.append(allocator, char);
            }
            char_count -= 1;
        }

        if (char_count == 0 and i < s.len - 2) {
            try cipher.append(allocator, ' ');
            char_count = 5;
        }
    }

    return (try cipher.toOwnedSlice(allocator));
}

/// Decodes `s` using the Atbash cipher. Caller owns the returned memory.
pub fn decode(allocator: mem.Allocator, s: []const u8) mem.Allocator.Error![]u8 {
    var original = try Aligned(u8, null).initCapacity(allocator, s.len);

    for (s) |char| {
        if (ascii.isAlphanumeric(char)) {
            if (ascii.isAlphabetic(char)) {
                try original.append(allocator, getReverseAlpha(char));
            } else {
                try original.append(allocator, char);
            }
        }
    }

    return (try original.toOwnedSlice(allocator));
}

fn getReverseAlpha(char: u8) u8 {
    var index: u8 = alphabet.len - 1;
    if (ascii.isUpper(char)) {
        index -= char - 'A';
    } else {
        index -= char - 'a';
    }

    return alphabet[index];
}
