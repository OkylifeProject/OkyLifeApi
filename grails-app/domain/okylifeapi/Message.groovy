package okylifeapi

class Message {
    String content
    String subject

    static constraints = {
        subject nullable: false, blank: false
        content nullable: false
    }

    @Override
    public String toString() {
        return "Message{" +
                "id=" + id +
                ", content='" + content + '\'' +
                ", subject='" + subject + '\'' +
                ", version=" + version +
                '}';
    }
}
