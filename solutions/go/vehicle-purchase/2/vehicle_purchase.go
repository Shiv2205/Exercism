package purchase

func NeedsLicense(kind string) bool {
	return kind == "car" || kind == "truck"
}

func ChooseVehicle(option1, option2 string) string {
	return min(option1,option2) + " is clearly the better choice."
}

func CalculateResellPrice(originalPrice, age float64) float64 {
	var resellPercentage float64 = 0.5
	switch {
	case age >= 1 && age < 3: resellPercentage = 0.8
	case age >= 3 && age < 10: resellPercentage = 0.7
	}

	return originalPrice * resellPercentage
}
