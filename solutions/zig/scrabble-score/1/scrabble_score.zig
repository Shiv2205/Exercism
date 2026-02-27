pub fn score(s: []const u8) u32 {
    var multipliers = comptime([1]u8{0} ** 26);
    var word_score: u32 = 0;

    inline for ('A'..('Z' + 1)) |i| {
        const idx = i - 'A';
        switch (i) {
            'A', 'E', 'I', 'O', 'U',
            'L', 'N', 'R', 'S', 'T' => multipliers[idx] = 1,
                           'D', 'G' => multipliers[idx] = 2,
                 'B', 'C', 'M', 'P' => multipliers[idx] = 3,
            'F', 'H', 'V', 'W', 'Y' => multipliers[idx] = 4,
                                'K' => multipliers[idx] = 5,
                           'J', 'X' => multipliers[idx] = 8,
                           'Q', 'Z' => multipliers[idx] = 10,
                           else => unreachable
        }
    }

    for (s) |char| {
        var letter = char;
        if (letter >= 'a' and letter <= 'z') {
            letter = (letter - 'a') + 'A';
        }
        word_score += (1 * multipliers[letter - 'A']);
    }

    return word_score;
}
