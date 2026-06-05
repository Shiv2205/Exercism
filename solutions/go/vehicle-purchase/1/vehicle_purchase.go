package purchase

func NeedsLicense(kind string) bool {
	if kind == "car" || kind == "truck" { return true }
	return false
}

func ChooseVehicle(option1, option2 string) string {
	var result string

	for i := range(min(len(option1), len(option2))) {
		if option1[i] == option2[i] { continue }
		if option1[i] < option2[i] { 
			result = option1
			break
		} else {
			result = option2
			break
		}
	}

	return result + " is clearly the better choice."
}

func CalculateResellPrice(originalPrice, age float64) float64 {
	var resellPercentage float64 = 1.0
	switch {
	case age >= 1 && age < 3: resellPercentage = 0.8
	case age >= 3 && age < 10: resellPercentage = 0.7
	case age >= 10: resellPercentage = 0.5
	}

	return originalPrice * resellPercentage
}
