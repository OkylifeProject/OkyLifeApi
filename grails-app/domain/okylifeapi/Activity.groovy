package okylifeapi

class Activity {

    Date creationDate;
    String description;
    String name;

    static belongsTo = [user: User]
    static hasMany = [locations: Location]

    static mapping = {
        tablePerHierarchy false
    }

    static constraints = {
        creationDate nullable: false
        description nullable: true, blank: false
        name nullable: false, blank: false
        locations nullable: true
    }
}
