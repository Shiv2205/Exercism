const mem = @import("std").mem;

pub const NucleotideError = error{Invalid};

pub const Counts = struct {
    a: u32,
    c: u32,
    g: u32,
    t: u32,
};

pub fn countNucleotides(s: []const u8) NucleotideError!Counts {
    var nucleotide_count = mem.zeroInit(Counts, .{0, 0 ,0, 0});

    if (s.len == 0) return nucleotide_count;
    
    for (s) |nucleotide| {
        switch (nucleotide) {
            'A' => nucleotide_count.a += 1,
            'C' => nucleotide_count.c += 1,                        
            'G' => nucleotide_count.g += 1,
            'T' => nucleotide_count.t += 1,
            else => return NucleotideError.Invalid
        }        
    }

    return nucleotide_count;
}
