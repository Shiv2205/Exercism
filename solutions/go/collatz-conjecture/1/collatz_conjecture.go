package collatzconjecture

import "errors"

func CollatzConjecture(n int) (int, error) {
	if n <= 0 {
		return 0, errors.New("Number must be greater than zero")
	}

	if n == 1 {
		return 0, nil
	} else {
		num := 0
		if n % 2 == 0 {
			num = n / 2
		} else {
			num = (n * 3) + 1
		}

		count, _ := CollatzConjecture(num)
		return 1 + count, nil
	}
}

