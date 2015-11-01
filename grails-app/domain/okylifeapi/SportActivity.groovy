package okylifeapi

class SportActivity extends Activity {
    String type
    double duration
    double distance
    double velocity
    double rhythm
    double targetDistance
    double hydration

    static constraints = {
        hydration min: (double) 0
        duration min: (double) 0
        rhythm min: (double) 0
        velocity min: (double) 0
        distance min: (double) 0
        targetDistance min: (double) 0
        type inList: ["Run", "Biking", "Walk"]
    }
}
