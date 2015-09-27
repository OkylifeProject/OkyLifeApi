package okylifeapi

class Note {
    String content
    Date publicationDate
    String imagePath

    static belongsTo = [owner: User]

    static constraints = {
        imagePath nullable: true, blank: false
        content nullable: false, blank: false
    }

    @Override
    public String toString() {
        return "Note{" +
                "id=" + id +
                ", content='" + content + '\'' +
                ", publicationDate=" + publicationDate +
                ", imagePath='" + imagePath + '\'' +
                ", version=" + version +
                '}';
    }
}
