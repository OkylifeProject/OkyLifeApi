package okylifeapi

import grails.transaction.Transactional

import java.text.SimpleDateFormat

import static org.springframework.http.HttpStatus.*

@Transactional(readOnly = true)
class ActivityController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Activity.list(params), model: [activityInstanceCount: Activity.count()]
    }

    def show(Activity activityInstance) {
        respond activityInstance
    }

    def create() {
        respond new Activity(params)
    }

    def createActivity() {
        SimpleDateFormat format = new SimpleDateFormat("MM/dd/yy")
        if (Activity.findByName(params.name)) {
            render "Activity name already in use"
            return
        }
        Date creationDate = format.parse(params.creationDate)
        def activityInstance = new Activity(activityType: params.type, creationDate: creationDate, description: params.description, name: params.name)
        if (!activityInstance.hasErrors()) {
            activityInstance.save(flush: true)
            render "Success"
        } else if (activityInstance.hasErrors()) {
            render "here are several data errors; please verify and re-send the information\n" + activityInstance.errors.getAllErrors().collect() {
                it.defaultMessage
            }
        }
    }

    @Transactional
    def save(Activity activityInstance) {
        if (activityInstance == null) {
            notFound()
            return
        }

        if (activityInstance.hasErrors()) {
            respond activityInstance.errors, view: 'create'
            return
        }

        activityInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'activity.label', default: 'Activity'), activityInstance.id])
                redirect activityInstance
            }
            '*' { respond activityInstance, [status: CREATED] }
        }
    }

    def edit(Activity activityInstance) {
        respond activityInstance
    }

    @Transactional
    def update(Activity activityInstance) {
        if (activityInstance == null) {
            notFound()
            return
        }

        if (activityInstance.hasErrors()) {
            respond activityInstance.errors, view: 'edit'
            return
        }

        activityInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Activity.label', default: 'Activity'), activityInstance.id])
                redirect activityInstance
            }
            '*' { respond activityInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Activity activityInstance) {

        if (activityInstance == null) {
            notFound()
            return
        }

        activityInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Activity.label', default: 'Activity'), activityInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'activity.label', default: 'Activity'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
