pub fn convert(buffer: []u8, n: u32) []const u8 {
    var res_buf = buffer[0..];
    var drop = [_]u8{'P', 'l', 'i', 'n', 'g'};
    var size: usize = 0;

    var i: u32 = 3;
    while (i <= 7): (i += 2) {
        drop[2] = 'i';
        if (i == 3) drop[2] = 'i';
        if (i == 5) drop[2] = 'a';
        if (i == 7) drop[2] = 'o';

        if (n % i == 0) {
            @memcpy(res_buf[size..size+5], drop[0..]);
            size += drop.len;
        }
    }

    if (size > 0)
        return res_buf[0..size];

    var number = n;
    var digit_count: u32 = 0;

    while (number > 0) : (number /= 10) {
        digit_count += 1;
        res_buf[res_buf.len - digit_count] = @intCast('0' + (number % 10));
    }

    return res_buf[(res_buf.len - digit_count)..];
}
