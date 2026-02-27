pub const TriangleError = error { Invalid };

pub const Triangle = struct {
    // This struct, as well as its fields and methods, needs to be implemented.
    a: f64,
    b: f64,
    c: f64,

    pub fn init(a: f64, b: f64, c: f64) TriangleError!Triangle {
        const is_valid_triangle = is_valid: {
          if (a <= 0 or b <= 0 or c <= 0) break :is_valid false;  
          if (((a + b) < c) or ((b + c) < a) or ((c + a) < b)) break :is_valid false;

          break :is_valid true;
      };
        if (!is_valid_triangle) return TriangleError.Invalid;

        return Triangle {
            .a = a,
            .b = b,
            .c = c
        };
    }

    pub fn isEquilateral(self: Triangle) bool {
        return (self.a == self.b and self.b == self.c);
    }

    pub fn isIsosceles(self: Triangle) bool {
        return (self.a == self.b or self.b == self.c or self.a == self.c);
    }

    pub fn isScalene(self: Triangle) bool {
        return !self.isIsosceles();
    }
};
