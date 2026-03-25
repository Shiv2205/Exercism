pub const Plant = enum {
    clover,
    grass,
    radishes,
    violets,
};

pub fn plants(diagram: []const u8, student: []const u8) [4]Plant {
    const sep_idx = findSeparator(diagram);
    const row_1 = diagram[0..sep_idx];
    const row_2 = diagram[sep_idx + 1 ..];
    const student_idx = (student[0] - 'A') * 2;

    var result: [4]Plant = undefined;

    result[0] = getPlantFromChar(row_1[student_idx]);
    result[1] = getPlantFromChar(row_1[student_idx + 1]);
    result[2] = getPlantFromChar(row_2[student_idx]);
    result[3] = getPlantFromChar(row_2[student_idx + 1]);

    return result;
}

fn findSeparator(diagram: []const u8) usize {
    for (diagram, 0..) |char, i| {
        if (char == '\n') return i;
    }

    return 0;
}

fn getPlantFromChar(char: u8) Plant {
    switch (char) {
        'C' => return .clover,
        'G' => return .grass,
        'R' => return .radishes,
        'V' => return .violets,
        else => unreachable,
    }
}
