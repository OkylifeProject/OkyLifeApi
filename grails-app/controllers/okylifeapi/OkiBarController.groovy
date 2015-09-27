package okylifeapi

import grails.converters.JSON
import grails.transaction.Transactional

import static org.springframework.http.HttpStatus.*

@Transactional(readOnly = true)
class OkiBarController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond OkiBar.list(params), model: [okiBarInstanceCount: OkiBar.count()]
    }

    def show(OkiBar okiBarInstance) {
        respond okiBarInstance
    }

    def create() {
        respond new OkiBar(params)
    }

    def getOkiBarByActivity(int activityId) {
        def activityInstance = Activity.findById(activityId)
        if (activityInstance) {
            def okiBar = activityInstance.getOkiBar()
            render okiBar as JSON
        } else {
            response.status = 404
            render "Activity doesnt exists"
        }
    }

    @Transactional
    def save(OkiBar okiBarInstance) {
        if (okiBarInstance == null) {
            notFound()
            return
        }

        if (okiBarInstance.hasErrors()) {
            respond okiBarInstance.errors, view: 'create'
            return
        }

        okiBarInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'okiBar.label', default: 'OkiBar'), okiBarInstance.id])
                redirect okiBarInstance
            }
            '*' { respond okiBarInstance, [status: CREATED] }
        }
    }

    def edit(OkiBar okiBarInstance) {
        respond okiBarInstance
    }

    @Transactional
    def update(OkiBar okiBarInstance) {
        if (okiBarInstance == null) {
            notFound()
            return
        }

        if (okiBarInstance.hasErrors()) {
            respond okiBarInstance.errors, view: 'edit'
            return
        }

        okiBarInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'OkiBar.label', default: 'OkiBar'), okiBarInstance.id])
                redirect okiBarInstance
            }
            '*' { respond okiBarInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(OkiBar okiBarInstance) {

        if (okiBarInstance == null) {
            notFound()
            return
        }

        okiBarInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'OkiBar.label', default: 'OkiBar'), okiBarInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'okiBar.label', default: 'OkiBar'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
