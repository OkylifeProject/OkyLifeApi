package okylifeapi

import grails.transaction.Transactional

import static org.springframework.http.HttpStatus.*

@Transactional(readOnly = false)
class VisitPlaceActivityController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond VisitPlaceActivity.list(params), model: [visitPlaceActivityInstanceCount: VisitPlaceActivity.count()]
    }

    def show(VisitPlaceActivity visitPlaceActivityInstance) {
        respond visitPlaceActivityInstance
    }

    def create() {
        respond new VisitPlaceActivity(params)
    }

    @Transactional
    def save(VisitPlaceActivity visitPlaceActivityInstance) {
        if (visitPlaceActivityInstance == null) {
            notFound()
            return
        }

        if (visitPlaceActivityInstance.hasErrors()) {
            respond visitPlaceActivityInstance.errors, view: 'create'
            return
        }

        visitPlaceActivityInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'visitPlaceActivity.label', default: 'VisitPlaceActivity'), visitPlaceActivityInstance.id])
                redirect visitPlaceActivityInstance
            }
            '*' { respond visitPlaceActivityInstance, [status: CREATED] }
        }
    }

    def edit(VisitPlaceActivity visitPlaceActivityInstance) {
        respond visitPlaceActivityInstance
    }

    @Transactional
    def update(VisitPlaceActivity visitPlaceActivityInstance) {
        if (visitPlaceActivityInstance == null) {
            notFound()
            return
        }

        if (visitPlaceActivityInstance.hasErrors()) {
            respond visitPlaceActivityInstance.errors, view: 'edit'
            return
        }

        visitPlaceActivityInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'VisitPlaceActivity.label', default: 'VisitPlaceActivity'), visitPlaceActivityInstance.id])
                redirect visitPlaceActivityInstance
            }
            '*' { respond visitPlaceActivityInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(VisitPlaceActivity visitPlaceActivityInstance) {

        if (visitPlaceActivityInstance == null) {
            notFound()
            return
        }

        visitPlaceActivityInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'VisitPlaceActivity.label', default: 'VisitPlaceActivity'), visitPlaceActivityInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'visitPlaceActivity.label', default: 'VisitPlaceActivity'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
