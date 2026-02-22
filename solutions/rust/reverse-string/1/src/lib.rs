pub fn reverse(input: &str) -> String {
    let mut output = Vec::with_capacity(input.len());

    for letter in input.chars().rev() {
        output.push(letter);
    }

    output.into_iter().collect()
}
