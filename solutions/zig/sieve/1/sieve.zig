pub fn primes(buffer: []u32, limit: u12) []u32 {
    if (limit < 2) {
        return buffer[0..0];
    } else if (limit == 2) {
        buffer[0] = 2;
        return buffer[0..1];
    }

    var skip: bool = false;
    var end: usize = 0;
    for (2..limit + 1) |num| {
        for (0..end) |i| {
            if (@rem(num, buffer[i]) == 0) {
                skip = true;
                break;
            }
        }

        if (skip) {
            skip = false;
            continue;
        }

        buffer[end] = @intCast(num);
        end += 1;
    }

    return buffer[0..end];
}
