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
}
