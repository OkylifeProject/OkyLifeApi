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

    static constraints = {
        creationDate nullable: false
        description nullable: true, blank: false
        name nullable: false, blank: false, unique: true
        okiBar unique: true, nullable: true
        startLocation nullable: true
    }

    @Override
    public String toString() {
        return "Activity{" +
                "id=" + id +
                ", creationDate=" + creationDate +
                ", description='" + description + '\'' +
                ", name='" + name + '\'' +
                ", startLocation=" + startLocation +
                ", okiBar=" + okiBar +
                ", version=" + version +
                '}';
    }
}
