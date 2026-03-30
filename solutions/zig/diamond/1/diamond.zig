const std = @import("std");
const mem = std.mem;
const array_list = std.array_list;

pub fn rows(allocator: mem.Allocator, letter: u8) mem.Allocator.Error![][]u8 {
    std.debug.assert(letter >= 'A');
    std.debug.assert(letter <= 'Z');

    const letter_pos = @as(usize, letter - 'A' + 1);
    const grid_len = @as(usize, (letter_pos * 2) - 1);

    var grid = try array_list.Aligned([]u8, null).initCapacity(allocator, grid_len);
    errdefer deinit(allocator, &grid);

    var left = grid_len / 2;
    var right = left;
    for ('A'..(letter + 1)) |char| {
        const line = try allocator.alloc(u8, grid_len);
        @memset(line, ' ');

        line[left] = @intCast(char);
        if (right != left) line[right] = @intCast(char);

        grid.appendAssumeCapacity(line);
        if (char < letter) {
            left -= 1;
            right += 1;
        }
    }

    if (grid.items.len < 2) return try grid.toOwnedSlice(allocator);

    const first_half = grid.items[0..];
    for (1..first_half.len) |i| grid.appendAssumeCapacity(try allocator.dupe(u8, first_half[first_half.len - (i + 1)]));

    return try grid.toOwnedSlice(allocator);
}

pub fn deinit(allocator: mem.Allocator, grid: *array_list.Aligned([]u8, null)) void {
    for (grid.items) |line| allocator.free(line);
    grid.deinit(allocator);
}
