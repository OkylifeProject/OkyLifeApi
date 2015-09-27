package okylifeapi

class User {
    String firstName
    String lastName
    String sex
    String imagePath
    String email
    String password
    Date birthDate

    static constraints = {
        firstName blank: false, nullable: false
        lastName blank: true, nullable: true
        sex inList: ["Male", "Female"]
        imagePath blank: false, nullable: true
        email blank: false, nullable: false, email: true, unique: true
        password blank: false, nullable: false, size: 5..100, matches: "[a-zA-Z0-9]*", password: true
        birthDate nullable: true, validator: { val ->
            Date currentDate = new Date()
            if (val > currentDate) return ['dateTooBig', val.toString(), currentDate.toString()]
        }
    }
}
