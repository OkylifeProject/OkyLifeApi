package okylifeapi

import grails.converters.JSON
import grails.transaction.Transactional
import org.apache.commons.validator.routines.EmailValidator
import org.codehaus.groovy.grails.web.json.JSONArray
import org.codehaus.groovy.grails.web.json.JSONObject

import java.text.SimpleDateFormat

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

    def getVisitPlaceActivitiesByUser(String email) {
        EmailValidator emailValidator = EmailValidator.getInstance()
        if (emailValidator.isValid(email)) {
            def userInstance = User.findByEmail(email)
            if (userInstance) {
                def userActivities = VisitPlaceActivity.findAllByUser(userInstance)
                if (userActivities) {
                    JSONArray jsonArray = new JSONArray()
                    userActivities.each {
                        JSONObject jsonObject = new JSONObject()
                        jsonObject.put("id", it.getId())
                        jsonObject.put("name", it.getName())
                        jsonObject.put("description", it.getDescription())
                        jsonObject.put("creationDate", it.creationDate)
                        jsonObject.put("type", it.type)
                        jsonObject.put("address", it.address)
                        jsonObject.put("distance", it.distance)
                        jsonArray.put(jsonObject)
                    }
                    render jsonArray as JSON
                } else {
                    response.status = 404
                    render "User doesn't have Visit Place Activities"
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

    def createVisitPlaceActivity(String email) {
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
        def visitPlace = new VisitPlaceActivity(creationDate: format.parse(format.format(new Date())), description: params.description, name: params.name, user: userInstance)
        if (params.calories) {
            visitPlace.calories = Double.valueOf(params.calories)
        }
        if (params.address) {
            visitPlace.address = String.valueOf(params.address)
        }
        if (params.distance) {
            visitPlace.distance = Double.valueOf(params.distance)
        }
        visitPlace.save(flush: true)
        if (!visitPlace.hasErrors()) {
            if (params.longitude && params.latitude) {
                def location = new Location(longitude: Double.valueOf(params.longitude), latitude: Double.valueOf(params.latitude), activity: visitPlace)
                location.save(flush: true)
            }
            render "Success"
        } else if (visitPlace.hasErrors()) {
            render "There are several data errors; please verify and re-send the information\n" + visitPlace.errors.getAllErrors()
        }
    }

    def setVisitPlaceActivityFields(long visitPlaceActivityId) {
        def visitPlace = VisitPlaceActivity.findById(visitPlaceActivityId)
        if (visitPlace) {
            if (params.type) {
                visitPlace.type = params.type
            }
            if (params.address) {
                visitPlace.address = params.address
            }
            if (params.distance) {
                visitPlace.distance = Double.valueOf(params.distance)
            }
            visitPlace.save(flush: true)
            if (visitPlace.hasErrors()) {
                response.status = 505
                render "Error at saving parameters; please check inputs"
            } else {
                render "Success"
            }
        } else {
            response.status = 404
            render "VisitPlace Activity Not Found"
        }
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
