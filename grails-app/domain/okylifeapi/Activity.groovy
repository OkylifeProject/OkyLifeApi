package okylifeapi

class Activity {

    String activityType;
    Date creationDate;
    String description;
    String name;
    OkiBar okiBar;

    static hasOne = [okiBar: OkiBar]

    static constraints = {
        creationDate nullable: false
        activityType nullable: false, blank: false
        description nullable: true, blank: false
        name nullable: false, blank: false, unique: true
        okiBar unique: true, nullable: true
    }

    @Override
    public String toString() {
        return "Activity{" +
                "activityType='" + activityType + '\'' +
                ", creationDate=" + creationDate +
                ", id=" + id +
                ", version=" + version +
                '}';
    }
}
