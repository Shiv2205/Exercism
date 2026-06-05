package darts

import "math"

func Score(x, y float64) int {
	radius := math.Sqrt(math.Pow(x, 2.0) + math.Pow(y, 2.0))

	switch {
	case radius > 5 && radius <= 10: return 1
	case radius > 1 && radius <= 5: return 5
	case radius <= 1: return 10
	default: return 0
	}
}
