//Package weather contains functions
//for weather forecasting in Globinocus.
package weather

var (
	//CurrentCondition is used to store current weather conditions.
	CurrentCondition string
	//CurrentLocation is used to store the current location.
	CurrentLocation  string
)

//Forecast is used to display the current weather conditions
//in a given city.
func Forecast(city, condition string) string {
	CurrentLocation, CurrentCondition = city, condition
	return CurrentLocation + " - current weather condition: " + CurrentCondition
}
