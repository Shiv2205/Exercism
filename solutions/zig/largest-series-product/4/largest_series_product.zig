pub const SeriesError = error{
    InvalidCharacter,
    NegativeSpan,
    InsufficientDigits,
};

pub fn largestProduct(digits: []const u8, span: i32) SeriesError!u64 {
    if (@as(i32, @intCast(digits.len)) < span) return SeriesError.InsufficientDigits;
    if (span < 0) return SeriesError.NegativeSpan;
    if (!isAllDigits(digits)) return SeriesError.InvalidCharacter;

    var max: u64 = 0;
    var left: usize = 0;
    var right: usize = @as(usize, @intCast(span));

    while (right <= digits.len) {
        var product: u64 = 1;
        for (digits[left..right]) |digit| product *= digit - '0';

        if (product > max) max = product;
        left += 1;
        right += 1;
    }

    return max;
}

fn isAllDigits(digits: []const u8) bool {
    for (digits) |char| switch (char) {
        '0'...'9' => continue,
        else => return false,
    };
    return true;
}
