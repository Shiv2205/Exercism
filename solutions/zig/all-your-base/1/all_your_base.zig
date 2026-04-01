const std = @import("std");
const mem = std.mem;
const math = std.math;
const array_list = std.array_list;

pub const ConversionError = error{
    InvalidInputBase,
    InvalidOutputBase,
    InvalidDigit,
};

/// Converts `digits` from `input_base` to `output_base`, returning a slice of digits.
/// Caller owns the returned memory.
pub fn convert(
    allocator: mem.Allocator,
    digits: []const u32,
    input_base: u32,
    output_base: u32,
) (mem.Allocator.Error || ConversionError)![]u32 {
    if (input_base < 2) return ConversionError.InvalidInputBase;
    if (output_base < 2) return ConversionError.InvalidOutputBase;

    var input_num = try sliceToBase10(digits, input_base);
    var new_num = try array_list.Aligned(u32, null).initCapacity(allocator, digits.len + 1);
    errdefer new_num.deinit(allocator);

    if (isEmptyOrZero(digits)) {
        new_num.appendAssumeCapacity(0);
        return try new_num.toOwnedSlice(allocator);
    }

    while (input_num > 0) : (input_num /= output_base) try new_num.append(allocator, input_num % output_base);
    mem.reverse(u32, new_num.items);

    return try new_num.toOwnedSlice(allocator);
}

fn sliceToBase10(digits: []const u32, input_base: u32) ConversionError!u32 {
    var total: u32 = 0;
    for (digits, 0..) |_, idx| {
        const digit = digits[digits.len - (idx + 1)];
        if (digit >= input_base) return ConversionError.InvalidDigit;
        total += digit * math.pow(u32, input_base, @intCast(idx));
    }
    return total;
}

fn isEmptyOrZero(digits: []const u32) bool {
    for (digits) |digit| if (digit > 0) return false;
    return true;
}
