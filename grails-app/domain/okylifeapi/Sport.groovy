package okylifeapi

import classes.Location

class Sport extends Activity {
    String type
    double duration
    double distance
    double velocity
    double rhythm
    double targetDistance
    double hydration
    ArrayList<Location> locations

    Sport() {
        locations = new ArrayList<Location>()
    }
    static constraints = {
        hydration min: (double) 0
        duration min: (double) 0
        rhythm min: (double) 0
        velocity min: (double) 0
        distance min: (double) 0
        targetDistance min: (double) 0
    }
}
