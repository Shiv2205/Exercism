package birdwatcher

func TotalBirdCount(birdsPerDay []int) int {
	total := 0
	for _, birdCount := range birdsPerDay { total += birdCount }
	return total
}

func BirdsInWeek(birdsPerDay []int, week int) int {
	weekStartIndex := 7 * (week - 1)
	return TotalBirdCount(birdsPerDay[weekStartIndex:weekStartIndex + 7])
}

func FixBirdCountLog(birdsPerDay []int) []int {
	for i := 0; i < len(birdsPerDay); i += 2 { birdsPerDay[i]++ }
	return birdsPerDay
}
