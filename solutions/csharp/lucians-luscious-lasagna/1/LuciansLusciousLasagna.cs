class Lasagna
{
    private const int cookingTime = 40;
    private const int minutesPerLayer = 2;
    
    // TODO: define the 'ExpectedMinutesInOven()' method
    public int ExpectedMinutesInOven() {
        return cookingTime;
    } 

    // TODO: define the 'RemainingMinutesInOven()' method
    public int RemainingMinutesInOven(int minutesPassed) {
        return cookingTime - minutesPassed;
    }

    // TODO: define the 'PreparationTimeInMinutes()' method
    public int PreparationTimeInMinutes(int layers) {
        return minutesPerLayer * layers;
    }

    // TODO: define the 'ElapsedTimeInMinutes()' method
    public int ElapsedTimeInMinutes(int layers, int minutesInOven) {
        return this.PreparationTimeInMinutes(layers) + minutesInOven;
    }
}
