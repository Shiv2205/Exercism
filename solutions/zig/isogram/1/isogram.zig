pub fn isIsogram(str: []const u8) bool {
    var map = [_]u8{0} ** 29;

    for (str) |letter| {
        if (letter == ' ' or letter == '-') {
            continue;
        }

        const lower_char = if (letter >= 97) letter else (letter + 32);
        const index = lower_char % 29;

        if (map[index] != 0){
            return false;
        }
        else {
            map[index] = lower_char;
        }
    }

    return true;
}
