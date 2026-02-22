class Lasagna
{
    private const int cookingTime = 40;
    private const int minutesPerLayer = 2;
    
    // TODO: define the 'ExpectedMinutesInOven()' method
    public int ExpectedMinutesInOven() => cookingTime;

    // TODO: define the 'RemainingMinutesInOven()' method
    public int RemainingMinutesInOven(int minutesPassed) => cookingTime - minutesPassed;

    // TODO: define the 'PreparationTimeInMinutes()' method
    public int PreparationTimeInMinutes(int layers) => minutesPerLayer * layers;

    // TODO: define the 'ElapsedTimeInMinutes()' method
    public int ElapsedTimeInMinutes(int layers, int minutesInOven) => this.PreparationTimeInMinutes(layers) + minutesInOven;
}
