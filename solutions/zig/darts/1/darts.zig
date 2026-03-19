pub const Coordinate = struct {
    // This struct, as well as its fields and methods, needs to be implemented.
    x: f32,
    y: f32,

    pub fn init(x_coord: f32, y_coord: f32) Coordinate {
        return .{ .x = x_coord, .y = y_coord };
    }

    pub fn score(self: Coordinate) usize {
        const vector_length = @sqrt((self.x * self.x) + (self.y * self.y));
        var points: usize = 0;

        if (vector_length <= 10.0 and vector_length > 5.0) {
            points = 1;
        } else if (vector_length <= 5.0 and vector_length > 1.0) {
            points = 5;
        } else if (vector_length <= 1.0 and vector_length >= 0.0) {
            points = 10;
        }

        return points;
    }
};
