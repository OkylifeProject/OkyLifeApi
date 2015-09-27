package okylifeapi

class Activity {

    String activityType;
    Date creationDate;

    static constraints = {
        creationDate nullable: false, validator: { val ->
            Date currentDate = new Date()
            if (val < currentDate) return ['datePriorTo', val.toString(), currentDate.toString()]
        }
        activityType nullable: false
    }
}
