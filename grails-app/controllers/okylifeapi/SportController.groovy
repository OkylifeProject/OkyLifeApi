package okylifeapi

import classes.Location
import grails.converters.JSON
import grails.transaction.Transactional
import org.apache.commons.validator.routines.EmailValidator
import org.codehaus.groovy.grails.web.json.JSONArray
import org.codehaus.groovy.grails.web.json.JSONObject

import java.text.SimpleDateFormat

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

    def getSportActivitiesByUser(String email) {
        EmailValidator emailValidator = EmailValidator.getInstance()
        if (emailValidator.isValid(email)) {
            def userInstance = User.findByEmail(email)
            if (userInstance) {
                def userActivities = Sport.findAllByUser(userInstance)
                if (userActivities) {
                    JSONArray jsonArray = new JSONArray()
                    userActivities.each {
                        JSONObject jsonObject = new JSONObject()
                        jsonObject.put("id", it.getId())
                        jsonObject.put("name", it.getName())
                        jsonObject.put("description", it.getDescription())
                        jsonObject.put("creationDate", it.creationDate)
                        if (it.getStartLocation() != null) {
                            Location location = it.getStartLocation()
                            jsonObject.put("startLatitude", location.getLatitude())
                            jsonObject.put("startLongitude", location.getLongitude())
                        }
                        jsonObject.put("type", it.type)
                        jsonObject.put("duration", it.duration)
                        jsonObject.put("distance", it.distance)
                        jsonObject.put("velocity", it.velocity)
                        jsonObject.put("rhythm", it.rhythm)
                        jsonObject.put("targetDistance", it.targetDistance)
                        jsonObject.put("hydration", it.hydration)
                        jsonObject.put("locations", it.locations)
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

    def createSportActivity(String email) {
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
        def sportActivityInstance = new Sport(creationDate: format.parse(format.format(new Date())),
                description: params.description, name: params.name, user: userInstance, startLocation: startLocation,
                type: params.type,
                okiBar: new OkiBar())
        sportActivityInstance.save(flush: true)
        if (!sportActivityInstance.hasErrors()) {
            render "Success"
        } else if (sportActivityInstance.hasErrors()) {
            render "There are several data errors; please verify and re-send the information\n" + sportActivityInstance.errors.getAllErrors()
        }
    }

    def setSportActivityFields(long sportActivityId) {
        def sport = Sport.findById(sportActivityId)
        if (sport) {
            if (params.duration) {
                sport.duration = Double.valueOf(params.duration)
            }
            if (params.distance) {
                sport.distance = Double.valueOf(params.distance)
            }
            if (params.velocity) {
                sport.velocity = Double.valueOf(params.velocity)
            }
            if (params.rhythm) {
                sport.rhythm = Double.valueOf(params.rhythm)
            }
            if (params.targetDistance) {
                sport.targetDistance = Double.valueOf(params.targetDistance)
            }
            if (params.hydration) {
                sport.hydration = Double.valueOf(params.hydration)
            }
            sport.save(flush: true)
            if (sport.hasErrors()) {
                response.status = 505
                render "Error at saving parameters; please check inputs"
            } else {
                render "Success"
            }
        } else {
            response.status = 404
            render "Sport Activity Not Found"
        }
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
