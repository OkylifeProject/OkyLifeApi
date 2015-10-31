package okylifeapi

class Location {
    double longitude
    double latitude
    static belongsTo = [activity: Activity]
    static constraints = {
        id unique: true
    }
}
