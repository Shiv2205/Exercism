package cards

func FavoriteCards() []int {
	return []int{2,6,9}
}

func GetItem(slice []int, index int) int {
	if isOutOfBounds(len(slice), index) { return -1 }
	return slice[index]
}

func SetItem(slice []int, index, value int) []int {
	if isOutOfBounds(len(slice), index) { return append(slice, value) }
	slice[index] = value
	return slice
}

func PrependItems(slice []int, values ...int) []int {
	if len(values) == 0 { return slice }
	return append(values, slice...)
}

func RemoveItem(slice []int, index int) []int {
	if isOutOfBounds(len(slice), index) { return slice }
	return append(slice[:index], slice[index + 1:]...)
}

func isOutOfBounds(size, index int) bool {
	return index < 0 || index >= size
}
