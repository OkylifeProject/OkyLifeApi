package okylifeapi

class Message {
    String content
    String subject
    User remitent

    static belongsTo = [recipient: User]

    static constraints = {
        subject nullable: false, blank: false
        content nullable: false
        remitent nullable: false
    }
}
