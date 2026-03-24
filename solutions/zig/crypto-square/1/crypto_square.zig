const std = @import("std");
const mem = std.mem;
const math = std.math;

const Aligned = std.array_list.Aligned(u8, null);

/// Encodes `plaintext` using the square code. Caller owns the returned memory.
pub fn ciphertext(allocator: mem.Allocator, plaintext: []const u8) mem.Allocator.Error![]u8 {
    var list = try Aligned.initCapacity(allocator, plaintext.len);
    try normalizeInput(plaintext, &list);

    if (plaintext.len == 0 or list.items.len == 0) {
        return try list.toOwnedSlice(allocator);
    }

    const normalized = try list.toOwnedSlice(allocator);
    defer allocator.free(normalized);

    const row: usize = getRowSize(normalized.len);
    const col: usize = getColSize(row, normalized.len);

    var cipher = try Aligned.initCapacity(allocator, normalized.len);

    for (0..col) |i| {
        for (0..row) |j| {
            const index = (j * col) + i;
            if (index >= normalized.len) {
                try cipher.append(allocator, ' ');
            } else {
                try cipher.append(allocator, normalized[index]);
            }
        }

        if (i < col - 1) {
            try cipher.append(allocator, ' ');
        }
    }

    return try cipher.toOwnedSlice(allocator);
}

fn normalizeInput(plaintext: []const u8, list: *Aligned) mem.Allocator.Error!void {
    for (plaintext) |char| {
        if (std.ascii.isAlphanumeric(char)) {
            list.appendAssumeCapacity(std.ascii.toLower(char));
        }
    }
}

fn getRowSize(input_len: usize) usize {
    return @intFromFloat(@round(@sqrt(@as(f32, @floatFromInt(input_len)))));
}

fn getColSize(row: usize, input_len: usize) usize {
    const remainder = @rem(@sqrt(@as(f32, @floatFromInt(input_len))), 1.0);
    if (remainder >= 0.1 and remainder < 0.5) {
        return row + 1;
    } else {
        return row;
    }
}
