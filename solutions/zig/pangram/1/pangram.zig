pub fn isPangram(str: []const u8) bool {
    var alphabet: [26]u8 = [1]u8{' '} ** 26;

    var letter_count: u8 = 0;
    for (str) |letter| {
        var alpha: u8 = letter;
        if (alpha >= 'A' and alpha <= 'Z')
            alpha += ('a' - 'A');

        if (alpha < 'a' or alpha > 'z')
            continue;

        if (alphabet[alpha - 'a'] == ' ') {
            alphabet[alpha - 'a'] = alpha;
            letter_count += 1;
        }
    }

    return letter_count == alphabet.len;
}
