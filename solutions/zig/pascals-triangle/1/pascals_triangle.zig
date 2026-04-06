const std = @import("std");
const mem = std.mem;
const array_list = std.array_list;

pub fn rows(allocator: mem.Allocator, count: usize) mem.Allocator.Error![][]u128 {
    var grid = try array_list.Aligned([]u128, null).initCapacity(allocator, count);
    errdefer deinit(allocator, &grid);

    if (count == 0) return try grid.toOwnedSlice(allocator);

    for (0..count) |idx| {
        try grid.append(allocator, try allocator.alloc(u128, idx + 1));
        grid.items[idx][0] = 1;
        if (idx == 0) continue;
        grid.items[idx][idx] = 1;
        if (idx == 1) continue;

        const top_row = grid.items[idx - 1];
        var row = grid.items[idx][1..idx];
        var left: usize = 0;
        var right: usize = 1;
        var pos: usize = 0;

        while (right < idx) : (pos += 1) {
            row[pos] = top_row[left] + top_row[right];
            left += 1;
            right += 1;
        }
    }

    return try grid.toOwnedSlice(allocator);
}

fn deinit(allocator: mem.Allocator, grid: *array_list.Aligned([]u128, null)) void {
    for (grid.items) |row| allocator.free(row);
    grid.deinit(allocator);
}
