package okylifeapi

class User {
    String firstName
    String lastName
    String sex
    String imagePath
    String email
    String password
    String registerType
    String age
    double weight
    double height
    double calories

    List notes

    static hasMany = [notes: Note, friends: User, messages: Message, activities: Activity]

    static mappedBy = [messages: 'recipient']

    static constraints = {
        height min: (double) 0
        weight min: (double) 0
        calories min: (double) 0
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
}
