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
}
