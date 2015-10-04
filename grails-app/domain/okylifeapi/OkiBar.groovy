package okylifeapi

class OkiBar {
    double calories
    double steps
    double speed
    double hydration
    double duration
    double rythm
    double cardiacFrequency
    double cadence
    double objetiveDistance
    Activity associatedActivity

    static constraints = {
        calories min: (double) 0
        steps min: (double) 0
        speed min: (double) 0
        hydration min: (double) 0
        duration min: (double) 0
        rythm min: (double) 0
        cardiacFrequency min: (double) 0
        cadence min: (double) 0
        objetiveDistance min: (double) 0
    }

    @Override
    public String toString() {
        return "OkiBar{" +
                "id=" + id +
                ", calories=" + calories +
                ", steps=" + steps +
                ", speed=" + speed +
                ", hydration=" + hydration +
                ", duration=" + duration +
                ", rythm=" + rythm +
                ", cardiacFrequency=" + cardiacFrequency +
                ", cadence=" + cadence +
                ", objetiveDistance=" + objetiveDistance +
                ", associatedActivity=" + associatedActivity +
                ", version=" + version +
                '}';
    }
}
