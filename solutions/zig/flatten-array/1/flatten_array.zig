const std = @import("std");
const mem = std.mem;
const Aligned = std.array_list.Aligned(i12, null);

pub const Box = union(enum) {
    none,
    one: i12,
    many: []const Box,
};

pub fn flatten(allocator: mem.Allocator, box: Box) mem.Allocator.Error![]i12 {
    var list = try Aligned.initCapacity(allocator, 0);
    errdefer list.deinit(allocator);

    switch (box) {
        .one => |num| try list.append(allocator, num),
        .many => |boxes| {
            for (boxes) |inner| {
                const res = try flatten(allocator, inner);
                defer allocator.free(res);

                try list.appendSlice(allocator, res);
            }
        },
        .none => {},
    }

    return try list.toOwnedSlice(allocator);
}
