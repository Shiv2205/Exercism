// Please implement the `ComputationError.IllegalArgument` error.

pub const ComputationError = error{
    IllegalArgument,
};

pub fn steps(number: usize) anyerror!usize {
    if (number == 0) {
        return ComputationError.IllegalArgument;
    }

    if (number == 1) {
        return 0;
    }

    var num: usize = 0;
    if ((number % 2) == 0) {
        num = number / 2;
    } else {
        num = (number * 3) + 1;
    }

    return 1 + (try steps(num));
}
