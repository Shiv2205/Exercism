const std = @import("std");

pub fn isArmstrongNumber(num: u128) bool {
    var sum: u128 = 0;
    var number: u128 = num;
    const power = std.fmt.count("{d}", .{num});

    while (number > 0) : (number /= 10) {
        sum += std.math.pow(u128, (number % 10), @as(u128, power));
    }

    return sum == num;
}
