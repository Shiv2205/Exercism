const std = @import("std");
const mem = std.mem;
const fmt = std.fmt;
const array_list = std.array_list;

/// Returns the selected row of the matrix.
pub fn row(allocator: mem.Allocator, s: []const u8, index: i32) ![]i16 {
    var str_row: []const u8 = undefined;
    var rows = mem.tokenizeScalar(u8, s, '\n');
    for (0..@intCast(index)) |_| str_row = rows.next() orelse unreachable;

    var num_row = try array_list.Aligned(i16, null).initCapacity(allocator, mem.count(u8, str_row, " ") + 1);
    errdefer num_row.deinit(allocator);

    var tokens = mem.tokenizeScalar(u8, str_row, ' ');
    while (tokens.next()) |token| try num_row.append(allocator, try fmt.parseInt(i16, token, 10));

    return try num_row.toOwnedSlice(allocator);
}

/// Returns the selected column of the matrix.
pub fn column(allocator: mem.Allocator, s: []const u8, index: i32) ![]i16 {
    if (s.len == 1) return try row(allocator, s, index);

    var space_count: usize = 0;
    for (s) |char| {
        if (char == ' ') space_count += 1;
        if (char == '\n') break;
    }

    var col = try array_list.Aligned(i16, null).initCapacity(allocator, space_count + 1);
    errdefer col.deinit(allocator);

    var rows = mem.splitScalar(u8, s, '\n');
    while (rows.next()) |r| {
        var tokens = mem.tokenizeScalar(u8, r, ' ');
        var number: []const u8 = undefined;
        for (0..@intCast(index)) |_| number = tokens.next() orelse unreachable;

        try col.append(allocator, try fmt.parseInt(i16, number, 10));
    }

    return try col.toOwnedSlice(allocator);
}
