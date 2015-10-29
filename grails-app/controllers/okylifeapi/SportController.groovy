package okylifeapi

import grails.transaction.Transactional

import static org.springframework.http.HttpStatus.*

@Transactional(readOnly = true)
class SportController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Sport.list(params), model: [sportInstanceCount: Sport.count()]
    }

    def show(Sport sportInstance) {
        respond sportInstance
    }

    def create() {
        respond new Sport(params)
    }

    @Transactional
    def save(Sport sportInstance) {
        if (sportInstance == null) {
            notFound()
            return
        }

        if (sportInstance.hasErrors()) {
            respond sportInstance.errors, view: 'create'
            return
        }

        sportInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'sport.label', default: 'Sport'), sportInstance.id])
                redirect sportInstance
            }
            '*' { respond sportInstance, [status: CREATED] }
        }
    }

    def edit(Sport sportInstance) {
        respond sportInstance
    }

    @Transactional
    def update(Sport sportInstance) {
        if (sportInstance == null) {
            notFound()
            return
        }

        if (sportInstance.hasErrors()) {
            respond sportInstance.errors, view: 'edit'
            return
        }

        sportInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Sport.label', default: 'Sport'), sportInstance.id])
                redirect sportInstance
            }
            '*' { respond sportInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Sport sportInstance) {

        if (sportInstance == null) {
            notFound()
            return
        }

        sportInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Sport.label', default: 'Sport'), sportInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'sport.label', default: 'Sport'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
