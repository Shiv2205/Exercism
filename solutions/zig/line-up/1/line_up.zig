const std = @import("std");
const mem = std.mem;

pub fn format(allocator: mem.Allocator, name: []const u8, number: u10) ![]u8 {
    var suffix: [2]u8 = undefined;

    switch (number % 100) {
        11, 12, 13 => suffix = "th".*,
        else => {
            switch (number % 10) {
                1 => suffix = "st".*,
                2 => suffix = "nd".*,
                3 => suffix = "rd".*,
                else => suffix = "th".*,
            }
        },
    }

    return try std.fmt.allocPrint(allocator, "{s}, you are the {d}{s} customer we serve today. Thank you!", .{ name, number, suffix });
}
