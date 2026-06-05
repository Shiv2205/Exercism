package differenceofsquares

func sumOfN(n int) int {
	return (n * (n + 1)) / 2
}

func SquareOfSum(n int) int {
	sum := sumOfN(n)
	return sum * sum
}

func SumOfSquares(n int) int {
	return sumOfN(n) * ((2 * n) + 1) / 3
}

func Difference(n int) int {
	return SquareOfSum(n) - SumOfSquares(n)
}
