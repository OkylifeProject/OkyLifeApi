package okylifeapi

class Note {
    String content
    Date publicationDate
    String imagePath

    static constraints = {
        imagePath nullable: true, blank: false
        content nullable: false, blank: false
        publicationDate validator: { val ->
            Date currentDate = new Date()
            if (val < currentDate) return ['datePriorTo', val.toString(), currentDate.toString()]
        }
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
