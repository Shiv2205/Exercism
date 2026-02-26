pub fn eggCount(number: usize) usize {
    var count: usize = 0;
    var eggs: usize = number;

    while (eggs > 0) : (eggs = (eggs >> 1)) {
        if((eggs & 1) > 0) count += 1;
    }

    return count;
}
