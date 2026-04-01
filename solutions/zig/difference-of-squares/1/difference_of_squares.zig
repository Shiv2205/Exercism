pub fn squareOfSum(number: usize) usize {
    const sum = sumOfN(number);
    return sum * sum;
}

pub fn sumOfSquares(number: usize) usize {
    return sumOfN(number) * ((2 * number) + 1) / 3;
}

pub fn differenceOfSquares(number: usize) usize {
    return squareOfSum(number) - sumOfSquares(number);
}

fn sumOfN(number: usize) usize {
    return (number * (number + 1)) / 2;
}
