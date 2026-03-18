const std = @import("std");
const mem = std.mem;

const Aligned = std.array_list.Aligned;

const ascii = std.ascii;

pub fn abbreviate(allocator: mem.Allocator, words: []const u8) mem.Allocator.Error![]u8 {
    var acronym_list = try Aligned(u8, null).initCapacity(allocator, 100);

    var terminator_found: bool = true;
    for (words) |char| {
        if (terminator_found and ascii.isAlphabetic(char)) {
            try acronym_list.append(allocator, ascii.toUpper(char));
            terminator_found = false;
            continue;
        }

        if (char == ' ' or char == '-') {
            terminator_found = true;
        }
    }

    return (try acronym_list.toOwnedSlice(allocator));
}
