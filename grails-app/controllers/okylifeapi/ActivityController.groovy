package okylifeapi

import classes.Location
import grails.converters.JSON
import grails.transaction.Transactional
import org.apache.commons.validator.routines.EmailValidator
import org.codehaus.groovy.grails.web.json.JSONArray
import org.codehaus.groovy.grails.web.json.JSONObject

import java.text.SimpleDateFormat

import static org.springframework.http.HttpStatus.*

@Transactional(readOnly = false)
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

    def createActivity(String email) {
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
        SimpleDateFormat format = new SimpleDateFormat("MM/dd/yy")
        Location startLocation = null;
        if (params.startLatitude && params.startLongitude) {
            startLocation = new Location(Double.valueOf(params.startLatitude), Double.valueOf(params.startLongitude))
        }
        //TODO: Delete OkyBar from constructor
        def activityInstance = new Activity(creationDate: format.parse(format.format(new Date())), description: params.description, name: params.name, owner: userInstance, startLocation: startLocation, okiBar: new OkiBar())
        activityInstance.save(flush: true)
        if (!activityInstance.hasErrors()) {
            render "Success"
        } else if (activityInstance.hasErrors()) {
            render "There are several data errors; please verify and re-send the information\n" + activityInstance.errors.getAllErrors().collect() {
                it.defaultMessage
            }
        }
    }

    def getActivitiesByUser(String email) {
        EmailValidator emailValidator = EmailValidator.getInstance()
        if (emailValidator.isValid(email)) {
            def userInstance = User.findByEmail(email)
            if (userInstance) {
                def userActivities = userInstance.getActivities()
                if (userActivities) {
                    JSONArray jsonArray = new JSONArray()
                    userActivities.each {
                        JSONObject jsonObject = new JSONObject()
                        jsonObject.put("id", it.getId())
                        jsonObject.put("activityType", it.getActivityType())
                        jsonObject.put("name", it.getName())
                        jsonObject.put("description", it.getDescription())
                        if (it.getStartLocation() != null) {
                            Location location = it.getStartLocation()
                            jsonObject.put("startLatitude", location.getLatitude())
                            jsonObject.put("startLongitude", location.getLongitude())
                        }
                        jsonArray.put(jsonObject)
                    }
                    render jsonArray as JSON
                } else {
                    response.status = 404
                    render "User doesnt have Activities"
                }
            } else {
                response.status = 404
                render "User doesnt exists"
            }
        } else {
            response.status = 404
            render "Invalid email"
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
