package okylifeapi

import grails.converters.JSON
import grails.transaction.Transactional
import org.apache.commons.validator.routines.EmailValidator
import org.codehaus.groovy.grails.web.json.JSONArray
import org.codehaus.groovy.grails.web.json.JSONObject
import sun.misc.BASE64Decoder
import sun.misc.BASE64Encoder

import static org.springframework.http.HttpStatus.*

@Transactional(readOnly = false)
class NoteController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Note.list(params), model: [noteInstanceCount: Note.count()]
    }

    def show(Note noteInstance) {
        respond noteInstance
    }

    def create() {
        respond new Note(params)
    }

    def createNoteByUser(String email) {
        EmailValidator emailValidator = EmailValidator.getInstance()
        if (emailValidator.isValid(email)) {
            def userInstance = User.findByEmail(email)
            if (userInstance) {
                def noteInstance = new Note(content: params.content, publicationDate: new Date(), owner: userInstance)
                noteInstance.save(flush: true)
                if (!noteInstance.hasErrors()) {
                    if (params.image) {
                        def newFile = new File('app-data/note-pics/' + email + '/' + noteInstance.getId() + '-pic.jpg')
                        newFile.getParentFile().mkdirs()
                        newFile.createNewFile()
                        newFile.bytes = new BASE64Decoder().decodeBuffer(params.image)
                        noteInstance.imagePath = newFile.getName()
                        noteInstance.save(flush: true)
                    }
                    render "Success"
                } else {
                    response.status = 404
                    render "There are several data errors; please verify and re-send the information\n" + userInstance.errors.getAllErrors()
                }
            } else {
                response.status = 404
                render "User doesnt exists"
            }
        } else {
            response.status = 404
            render "Invalid Email"
        }
    }

    def getNotesByUser(String email) {
        EmailValidator emailValidator = EmailValidator.getInstance()
        if (emailValidator.isValid(email)) {
            def userInstance = User.findByEmail(email)
            if (userInstance) {
                def notesInstance = userInstance.getNotes()
                if (notesInstance) {
                    JSONArray jsonArray = new JSONArray()
                    notesInstance.each {
                        JSONObject jsonObject = new JSONObject()
                        jsonObject.put("id", it.getId())
                        jsonObject.put("content", it.getContent())
                        jsonObject.put("publicationDate", it.getPublicationDate())
                        def noteImage = new File('app-data/note-pics/' + email + '/' + it.imagePath)
                        if (noteImage.exists()) {
                            jsonObject.put("imageHash", noteImage.bytes.encodeAsSHA1())
                        } else {
                            jsonObject.put("imageHash", "")
                        }
                        jsonArray.put(jsonObject)
                    }
                    render jsonArray as JSON
                } else {
                    response.status = 404
                    render "User doesnt have Notes"
                }
            } else {
                response.status = 404
                render "User doesnt exists"
            }
        } else {
            response.status = 404
            render "Invalid Email"
        }
    }

    def getRecentNotesByUser(String email) {
        EmailValidator emailValidator = EmailValidator.getInstance()
        if (!emailValidator.isValid(email)) {
            response.status = 404
            render "Invalid Email"
            return
        }
        def userInstance = User.findByEmail(email)
        if (!userInstance) {
            response.status = 404
            render "User doesnt exists"
            return
        }
        JSONArray jsonNotes = new JSONArray()

        if (!userInstance.getNotes().isEmpty()) {
            Note userNote = userInstance.getNotes().last()
            if (userNote) {
                JSONObject jsonNote = new JSONObject()
                jsonNote.put("ownerEmail", userNote.getOwner().getEmail())
                jsonNote.put("content", userNote.getContent())
                jsonNote.put("publicationDate", userNote.getPublicationDate())

                if (userInstance.imagePath != null && userInstance.imagePath != "") {
                    def userImage = new File('app-data/profile-pics/' + userInstance.imagePath)
                    if (userImage.exists()) {
                        def encode = new BASE64Encoder().encode(userImage.bytes)
                        jsonNote.put("ownerImageBytes", encode)
                    } else {
                        jsonNote.put("ownerImageBytes", "")
                    }
                } else {
                    jsonNote.put("ownerImageBytes", "")
                }

                jsonNotes.put(jsonNote)
            }
        }

        def userFriends = userInstance.getFriends()
        if (userFriends) {
            userFriends.each {
                if (!it.getNotes().isEmpty()) {
                    Note friendNote = it.getNotes().last()
                    if (friendNote) {
                        JSONObject jsonNote = new JSONObject()
                        jsonNote.put("ownerEmail", friendNote.getOwner().getEmail())
                        jsonNote.put("content", friendNote.getContent())
                        jsonNote.put("publicationDate", friendNote.getPublicationDate())

                        if (it.imagePath != null && it.imagePath != "") {
                            def userImage = new File('app-data/profile-pics/' + it.imagePath)
                            if (userImage.exists()) {
                                def encode = new BASE64Encoder().encode(userImage.bytes)
                                jsonNote.put("ownerImageBytes", encode)
                            } else {
                                jsonNote.put("ownerImageBytes", "")
                            }
                        } else {
                            jsonNote.put("ownerImageBytes", "")
                        }

                        jsonNotes.put(jsonNote)
                    }

                }
            }
        }
        render jsonNotes as JSON
    }

    def getImageHash(long id) {
        def noteInstance = Note.findById(id)
        if (noteInstance.imagePath != null && noteInstance.imagePath != "") {
            def noteImage = new File('app-data/note-pics/' + noteInstance.owner.getEmail() + '/' + noteInstance.imagePath)
            if (noteImage.exists()) {
                render noteImage.bytes.encodeAsSHA1()
            } else {
                render ""
            }
        }
    }

    def getImage(long id) {
        def noteInstance = Note.findById(id)
        JSONObject response = new JSONObject()
        if (noteInstance.imagePath != null && noteInstance.imagePath != "") {
            def noteImage = new File('app-data/note-pics/' + noteInstance.owner.getEmail() + '/' + noteInstance.imagePath)
            if (noteImage.exists()) {
                def encode = new BASE64Encoder().encode(noteImage.bytes)
                response.put("imageBytes", encode)
                render response as JSON
            } else {
                render ""
            }

        }

    }

    @Transactional
    def save(Note noteInstance) {
        if (noteInstance == null) {
            notFound()
            return
        }

        if (noteInstance.hasErrors()) {
            respond noteInstance.errors, view: 'create'
            return
        }

        noteInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'note.label', default: 'Note'), noteInstance.id])
                redirect noteInstance
            }
            '*' { respond noteInstance, [status: CREATED] }
        }
    }

    def edit(Note noteInstance) {
        respond noteInstance
    }

    @Transactional
    def update(Note noteInstance) {
        if (noteInstance == null) {
            notFound()
            return
        }

        if (noteInstance.hasErrors()) {
            respond noteInstance.errors, view: 'edit'
            return
        }

        noteInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Note.label', default: 'Note'), noteInstance.id])
                redirect noteInstance
            }
            '*' { respond noteInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Note noteInstance) {

        if (noteInstance == null) {
            notFound()
            return
        }

        noteInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Note.label', default: 'Note'), noteInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'note.label', default: 'Note'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
