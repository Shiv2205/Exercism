pub const QueenError = error{
    InitializationFailure,
};

pub const Queen = struct {
    row: i8,
    col: i8,

    pub fn init(row: i8, col: i8) QueenError!Queen {
        if (!isValidPosition(row, col)) {
            return QueenError.InitializationFailure;
        }

        return .{
            .row = row,
            .col = col
        };
    }

    pub fn canAttack(self: Queen, other: Queen) QueenError!bool {
        if (!isValidPosition(self.row, self.col) or !isValidPosition(other.row, other.col)) {
            return QueenError.InitializationFailure;
        }

        const y = other.col - self.col;
        const x = other. row - self.row;

        if (y == 0 or x == 0) {
            return true;
        }

        const grad = @divTrunc(y, x);
        const rem = @rem(y, x);

        return (grad == 1 or grad == -1) and rem == 0;
    }

    fn isValidPosition(row: i8, col: i8) bool {
        if (row < 0 or row > 7) {
            return false;
        }
        if (col < 0 or col > 7) {
            return false;
        }

        return true;
    }
};
