package okylifeapi

class VisitPlaceActivity extends Activity {
    double distance
    String address
    String type
    static constraints = {
        distance min: (double) 0
        type nullable: true
        address nullable: true
    }
}
