package okylifeapi

class Activity {

    String activityType;
    Date creationDate;
    String description;
    String name;

    static belongsTo = [owner: User]
    static hasOne = [okiBar: OkiBar]


    static constraints = {
        creationDate nullable: false, validator: { val ->
            Date currentDate = new Date()
            if (val < currentDate) return ['datePriorTo', val.toString(), currentDate.toString()]
        }
        activityType nullable: false, blank: false
        description nullable: true, blank: false
        name nullable: false, blank: false, unique: true
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
