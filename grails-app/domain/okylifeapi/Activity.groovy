package okylifeapi

class Activity {

    String activityType;
    Date creationDate;

    static constraints = {
        creationDate nullable: false, validator: { val ->
            Date currentDate = new Date()
            if (val < currentDate) return ['datePriorTo', val.toString(), currentDate.toString()]
        }
        activityType nullable: false, blank: false
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
