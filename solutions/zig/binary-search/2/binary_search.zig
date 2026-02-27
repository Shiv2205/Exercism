// Take a look at the tests, you might have to change the function arguments

pub fn binarySearch(comptime T: type, target: T, items: []const T) ?usize {
    var left  : usize = 0;
    var right : usize = items.len -| 1;
    var middle: usize = (left + right) / 2;

    if (items.len == 0 or target < items[left] or target > items[right])
        return null;

    while (left <= right) : (middle = (left + right) / 2){
        if (target == items[middle]) { return middle; }
        else if (target < items[middle]) { right = middle -| 1; }
        else if (target > items[middle]) { left = middle +| 1; }
    }

    return null;
}
