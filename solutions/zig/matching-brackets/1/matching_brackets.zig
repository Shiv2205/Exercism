const std = @import("std");
const mem = std.mem;
const array_list = std.array_list;

pub fn isBalanced(allocator: mem.Allocator, s: []const u8) !bool {
    var stack = try array_list.Aligned(u8, null).initCapacity(allocator, 10);
    defer stack.deinit(allocator);

    for (s) |char| switch (char) {
        '[', '{', '(' => stack.appendAssumeCapacity(char),
        ']', '}', ')' => |closing| {
            var opening: u8 = closing - 1;
            if (closing != ')') opening -= 1;
            const top = stack.getLastOrNull();
            if (top == null or top.? != opening) return false;
            _ = stack.pop();
        },
        else => continue,
    };

    if (stack.items.len == 0) return true;
    return false;
}
