const std = @import("std");
const mem = std.mem;

const AutoHashMap = std.hash_map.AutoHashMap(u32, bool);

pub fn sum(allocator: mem.Allocator, factors: []const u32, limit: u32) !u64 {
    if (factors.len == 0) {
        return 0;
    }

    var multiple_map = AutoHashMap.init(allocator);
    defer multiple_map.deinit();

    var total: u64 = 0;
    for (factors) |factor| {
        var i: u32 = 1;
        if (factor == 0) continue;

        while (true) {
            const multiple = i * factor;
            if (multiple >= limit) {
                break;
            }

            if (!multiple_map.contains(multiple)) {
                try multiple_map.put(multiple, true);
                total += @as(u64, multiple);
            }

            i += 1;
        }
    }

    return total;
}
