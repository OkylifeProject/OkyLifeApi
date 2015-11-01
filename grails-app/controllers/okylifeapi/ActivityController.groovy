package okylifeapi

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
        //TODO: Delete OkyBar from constructor
        def activityInstance = new Activity(creationDate: format.parse(format.format(new Date())), description: params.description, name: params.name, user: userInstance, okiBar: new OkiBar())
        activityInstance.save(flush: true)
        if (!activityInstance.hasErrors()) {
            if (params.longitude && params.latitude) {
                def location = new Location(longitude: Double.valueOf(params.longitude), latitude: Double.valueOf(params.latitude), activity: activityInstance)
                location.save(flush: true)
            }
            render "Success"
        } else if (activityInstance.hasErrors()) {
            render "There are several data errors; please verify and re-send the information\n" + activityInstance.errors.getAllErrors()
        }
    }

    def getUserActivities(String email) {
        EmailValidator emailValidator = EmailValidator.getInstance()
        if (emailValidator.isValid(email)) {
            def userInstance = User.findByEmail(email)
            if (userInstance) {
                def userActivities = userInstance.getActivities()
                if (userActivities) {
                    JSONArray jsonArray = new JSONArray()
                    userActivities.each {
                        JSONObject jsonObject = new JSONObject()
                        JSONArray jsonLocations = new JSONArray()
                        jsonObject.put("id", it.getId())
                        jsonObject.put("name", it.getName())
                        jsonObject.put("description", it.getDescription())
                        jsonObject.put("creationDate", it.creationDate)
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

    def getActivityLocations(long activityId) {
        def activityInstance = Activity.get(activityId)
        if (activityInstance) {
            def locations = activityInstance.getLocations()
            if (locations != [] && locations != null) {
                JSONArray jsonLocations = new JSONArray()
                locations.each {
                    JSONObject jsonLocation = new JSONObject()
                    jsonLocation.put("latitude", it.getLatitude())
                    jsonLocation.put("longitude", it.getLongitude())
                    jsonLocations.put(jsonLocation)
                }
                render jsonLocations as JSON
            } else {
                response.status = 404
                render "Locations Not Found"
            }
        } else {
            response.status = 404
            render "Activity Not Found"
        }
    }

    def addLocation(long activityId, String location) {
        JSONObject jsonLocation
        try {
            jsonLocation = new JSONObject(location)
        } catch (Exception e) {
            response.status = 505
            render "Fatal Error: Invalid Data Array: "
            return
        }
        if (!jsonLocation.isEmpty()) {
            def activityInstance = Activity.get(Long.valueOf(activityId))
            if (activityInstance) {
                def locationInstance = new Location(longitude: Double.valueOf(jsonLocation.get("longitude")),
                        latitude: Double.valueOf(jsonLocation.get("latitude")), activity: activityInstance)
                locationInstance.save(flush: true)
                if (!locationInstance.hasErrors()) {
                    render "Success"
                } else {
                    render locationInstance.getErrors().getAllErrors()
                }
            } else {
                response.status = 404
                render "Activity Not found"
            }
        } else {
            response.status = 505
            render "Invalid Data Received"
        }
    }

    def addLocationSet(String locationSet, long activityId) {
        JSONObject jsonObject
        JSONArray locations
        try {
            jsonObject = new JSONObject(locationSet)
            locations = jsonObject.getJSONArray("locations")
        } catch (Exception e) {
            response.status = 505
            render "Fatal Error: Invalid Data Array: " + jsonObject.toString()
            return
        }

        def activityInstance = Activity.get(activityId)
        if (activityInstance) {
            if (!locations.isEmpty()) {
                locations.each {
                    def locationInstance = new Location(activity: activityInstance,
                            longitude: it.getAt("longitude"), latitude: it.getAt("latitude"))
                    locationInstance.save(flush: true)
                    if (locationInstance.hasErrors()) {
                        render locationInstance.getErrors().getAllErrors()
                        return
                    }
                }
                render "Success"
            } else {
                render "There are not locations"
            }
        } else {
            response.status = 404
            render "Activity Not Found"
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
