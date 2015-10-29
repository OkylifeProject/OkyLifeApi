package classes
/**
 * Created by mordreth on 10/29/15.
 */
class Location {
    double latitude
    double longitude

    Location(double longitude, double latitude) {
        this.longitude = longitude
        this.latitude = latitude
    }

    @Override
    public String toString() {
        return "classes.Location{" +
                "id=" + id +
                ", latitude=" + latitude +
                ", longitude=" + longitude +
                ", version=" + version +
                '}';
    }

    double getLatitude() {
        return latitude
    }

    void setLatitude(double latitude) {
        this.latitude = latitude
    }

    double getLongitude() {
        return longitude
    }

    void setLongitude(double longitude) {
        this.longitude = longitude
    }
}
