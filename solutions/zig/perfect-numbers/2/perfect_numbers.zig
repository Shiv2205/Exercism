pub const Classification = enum {
    deficient,
    perfect,
    abundant,
};

/// Asserts that `n` is nonzero.
pub fn classify(n: u64) Classification {
    var sum: usize = 0;
    for (1..(n / 2) + 1) |i| if (n % i == 0) {
        sum += i;
    };

    if (sum > n) return .abundant;
    if (sum < n) return .deficient;
    return .perfect;
}
