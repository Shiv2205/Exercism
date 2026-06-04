package twofer

func ShareWith(name string) string {
	target := "you"
	if len(name) > 0 {
		target = name
	}

	return "One for " + target + ", one for me."
}
