package okylifeapi

import classes.Location

class Activity {

    Date creationDate;
    String description;
    String name;
    Location startLocation;

    //TODO: delete OkyBar class and relation
    OkiBar okiBar;
    static hasOne = [okiBar: OkiBar]
    static belongsTo = [user: User]

    static mapping = {
        tablePerHierarchy false
    }

    static constraints = {
        creationDate nullable: false
        description nullable: true, blank: false
        name nullable: false, blank: false
        okiBar unique: true, nullable: true
        startLocation nullable: true
    }
}
