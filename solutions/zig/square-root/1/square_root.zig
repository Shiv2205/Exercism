pub fn squareRoot(radicand: usize) usize {
    if (radicand == 1) return radicand;

    const radicand_f: f64 = @floatFromInt(radicand);
    var x: f64 = radicand_f / 2.0;
    while (@as(usize, @intFromFloat(@round(x * x))) != radicand) {
        x = 0.5 * (x + (radicand_f / x));
    }

    return @intFromFloat(x);
}
