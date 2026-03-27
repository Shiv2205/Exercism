const std = @import("std");
const ascii = std.ascii;

const Context = union(enum) {
    default,
    question,
    yelling,
    yelling_question,
    silence,

    pub fn init(sentence: []const u8) Context {
        if (isSilence(sentence)) return .silence;

        var ctx: Context = .default;
        if (isQuestion(sentence)) {
            ctx = .question;
        }
        if (isYelling(sentence)) {
            if (ctx == .question) {
                ctx = .yelling_question;
            } else {
                ctx = .yelling;
            }
        }

        return ctx;
    }

    fn isSilence(sentence: []const u8) bool {
        if (sentence.len == 0) return true;
        for (sentence) |char| if (!ascii.isWhitespace(char)) return false;
        return true;
    }

    fn isQuestion(sentence: []const u8) bool {
        var end = sentence.len - 1;
        while (end >= 0 and ascii.isWhitespace(sentence[end])) end -= 1;

        if (sentence[end] == '?') return true;
        return false;
    }

    fn isYelling(sentence: []const u8) bool {
        var has_alpha: bool = false;
        for (sentence) |char| {
            if (!has_alpha and ascii.isAlphabetic(char)) has_alpha = true;
            if (ascii.isAlphabetic(char) and ascii.isLower(char)) return false;
        }

        if (has_alpha) return true;
        return false;
    }
};

pub fn response(s: []const u8) []const u8 {
    const ctx = Context.init(s);

    switch (ctx) {
        .question => return "Sure.",
        .yelling => return "Whoa, chill out!",
        .yelling_question => return "Calm down, I know what I'm doing!",
        .silence => return "Fine. Be that way!",
        else => return "Whatever.",
    }
}
