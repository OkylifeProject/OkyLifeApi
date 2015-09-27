package okylifeapi

import grails.transaction.Transactional

import static org.springframework.http.HttpStatus.*

@Transactional(readOnly = true)
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
