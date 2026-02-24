pub fn raindrops(n: u32) -> String {
    let mut res = String::new();
    let mut i: u32 = 3;
    while i <= 7 {
        let mut drop = "";
        if i == 3 { drop = "Pling"; }
        if i == 5 { drop = "Plang"; }
        if i == 7 { drop = "Plong"; }
        
        if n.is_multiple_of(i) {
            res += drop; 
        }

        i += 2;
    }

    if res.is_empty() {
        return n.to_string();
    }

    res
}
