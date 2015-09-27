package okylifeapi

class Message {
    String content
    String subject

    static constraints = {
        subject nullable: false, blank: false
        content nullable: false
    }
}
