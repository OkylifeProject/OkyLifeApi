package okylifeapi

class User {
    String firstName
    String lastName
    String sex
    String imagePath
    String email
    String password
    String registerType;
    String age

    static hasMany = [notes: Note, friends: User, messages: Message, activities: Activity]

    static mappedBy = [messages: 'recipient']

    static constraints = {
        firstName blank: false, nullable: false
        lastName blank: true, nullable: true
        sex inList: ["Male", "Female"]
        imagePath blank: false, nullable: true
        email blank: false, nullable: false, email: true, unique: true
        password blank: false, nullable: true, size: 5..100, matches: "[a-zA-Z0-9]*", password: true
        age nullable: true, validator: { val ->
            if (val) {
                if (Integer.valueOf(val) > 150 || Integer.valueOf(val) < 0) {
                    return ['invalidAge [0-150]', val.toString()]
                }
            }
        }
        registerType inList: ["Facebook", "Google", "Api"], nullable: false, blank: false
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", firstName='" + firstName + '\'' +
                ", lastName='" + lastName + '\'' +
                ", sex='" + sex + '\'' +
                ", imagePath='" + imagePath + '\'' +
                ", email='" + email + '\'' +
                ", password='" + password + '\'' +
                ", registerType='" + registerType + '\'' +
                ", age='" + age + '\'' +
                ", version=" + version +
                ", friends=" + friends +
                ", activities=" + activities +
                ", notes=" + notes +
                ", messages=" + messages +
                '}';
    }
}
