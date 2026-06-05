package cards

func FavoriteCards() []int {
	return []int{2,6,9}
}

// GetItem retrieves an item from a slice at given position.
// If the index is out of range, we want it to return -1.
func GetItem(slice []int, index int) int {
	if isOutOfBounds(len(slice), index) { return -1 }
	return slice[index]
}

// SetItem writes an item to a slice at given position overwriting an existing value.
// If the index is out of range the value needs to be appended.
func SetItem(slice []int, index, value int) []int {
	if isOutOfBounds(len(slice), index) { return append(slice, value) }
	slice[index] = value
	return slice
}

// PrependItems adds an arbitrary number of values at the front of a slice.
func PrependItems(slice []int, values ...int) []int {
	if len(values) == 0 { return slice }

	newSize := len(slice) + len(values)
	newSlice := make([]int, 0, newSize)
	newSlice = append(newSlice, values...)
	newSlice = append(newSlice, slice...)

	return newSlice
}

// RemoveItem removes an item from a slice by modifying the existing slice.
func RemoveItem(slice []int, index int) []int {
	if isOutOfBounds(len(slice), index) { return slice }
	newSlice := make([]int, 0, len(slice) - 1)
	newSlice = append(newSlice, slice[:index]...)
	newSlice = append(newSlice, slice[index + 1:]...)

	return newSlice
}

func isOutOfBounds(size, index int) bool {
	return index < 0 || index >= size
}
