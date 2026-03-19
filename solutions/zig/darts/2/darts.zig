pub const Coordinate = struct {
    // This struct, as well as its fields and methods, needs to be implemented.
    x: f32,
    y: f32,

    pub fn init(x_coord: f32, y_coord: f32) Coordinate {
        return .{ .x = x_coord, .y = y_coord };
    }

    pub fn score(self: Coordinate) usize {
        const vector_length = @sqrt((self.x * self.x) + (self.y * self.y));

        if (vector_length <= 1.0) return 10;
        if (vector_length <= 5.0) return 5;
        if (vector_length <= 10.0) return 1;

        return 0;
    }
};
