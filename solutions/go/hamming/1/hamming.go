package hamming

import "errors"

func Distance(a, b string) (int, error) {
	if len(a) != len(b) {
		return -1, errors.New("Strand length mismatch")
	}	

	hamming := 0
	for i := range(len(a)) {
		if a[i] != b[i] {
			hamming++
		}	
	}

	return hamming,nil
}
