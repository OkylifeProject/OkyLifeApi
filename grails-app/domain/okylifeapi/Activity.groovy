package okylifeapi

class Activity {

    Date creationDate;
    String description;
    String name;
    double[] location;

    //TODO: delete OkyBar class
    OkiBar okiBar;

    static hasOne = [okiBar: OkiBar]

    static constraints = {
        creationDate nullable: false
        description nullable: true, blank: false
        name nullable: false, blank: false, unique: true
        okiBar unique: true, nullable: true
        location nullable: true, size: 2
    }

    @Override
    public String toString() {
        return "Activity{" +
                "id=" + id +
                ", creationDate=" + creationDate +
                ", description='" + description + '\'' +
                ", name='" + name + '\'' +
                ", location=" + Arrays.toString(location) +
                ", okiBar=" + okiBar +
                ", version=" + version +
                '}';
    }
}
