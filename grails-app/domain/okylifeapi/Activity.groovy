package okylifeapi

class Activity {

    Date creationDate;
    String description;
    String name;

    //TODO: delete OkyBar class and relation
    OkiBar okiBar;
    static hasOne = [okiBar: OkiBar]
    static belongsTo = [user: User]
    static hasMany = [locations: Location]

    static mapping = {
        tablePerHierarchy false
    }

    static constraints = {
        creationDate nullable: false
        description nullable: true, blank: false
        name nullable: false, blank: false
        okiBar unique: true, nullable: true
        locations nullable: true
    }
}
