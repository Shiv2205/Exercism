pub fn isLeapYear(year: u32) bool {
    if (@mod(year, 4) == 0) {
        if (@mod(year, 100) == 0) {
            if (@mod(year, 400) == 0) {
                return true;
            }
            return false;
        }
        
        return true;
    }
    
    return false;
}
