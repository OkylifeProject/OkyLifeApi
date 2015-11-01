package okylifeapi

import grails.transaction.Transactional

import static org.springframework.http.HttpStatus.*

@Transactional(readOnly = true)
class EatActivityController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond EatActivity.list(params), model: [eatActivityInstanceCount: EatActivity.count()]
    }

    def show(EatActivity eatActivityInstance) {
        respond eatActivityInstance
    }

    def create() {
        respond new EatActivity(params)
    }

    @Transactional
    def save(EatActivity eatActivityInstance) {
        if (eatActivityInstance == null) {
            notFound()
            return
        }

        if (eatActivityInstance.hasErrors()) {
            respond eatActivityInstance.errors, view: 'create'
            return
        }

        eatActivityInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'eatActivity.label', default: 'EatActivity'), eatActivityInstance.id])
                redirect eatActivityInstance
            }
            '*' { respond eatActivityInstance, [status: CREATED] }
        }
    }

    def edit(EatActivity eatActivityInstance) {
        respond eatActivityInstance
    }

    @Transactional
    def update(EatActivity eatActivityInstance) {
        if (eatActivityInstance == null) {
            notFound()
            return
        }

        if (eatActivityInstance.hasErrors()) {
            respond eatActivityInstance.errors, view: 'edit'
            return
        }

        eatActivityInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'EatActivity.label', default: 'EatActivity'), eatActivityInstance.id])
                redirect eatActivityInstance
            }
            '*' { respond eatActivityInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(EatActivity eatActivityInstance) {

        if (eatActivityInstance == null) {
            notFound()
            return
        }

        eatActivityInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'EatActivity.label', default: 'EatActivity'), eatActivityInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'eatActivity.label', default: 'EatActivity'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
