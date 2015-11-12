package okylifeapi

class VisitPlaceActivity extends Activity {
    double distance
    String address
    String type
    double calories

    static constraints = {
        distance min: (double) 0
        calories min: (double) 0
        type nullable: true
        address nullable: true
        type inList: ["Park", "Hospital", "Museum", "Store", "Restaurant"] - re
    }
}
