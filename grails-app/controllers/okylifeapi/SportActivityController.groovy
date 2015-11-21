package okylifeapi

import grails.converters.JSON
import grails.transaction.Transactional
import org.apache.commons.validator.routines.EmailValidator
import org.codehaus.groovy.grails.web.json.JSONArray
import org.codehaus.groovy.grails.web.json.JSONObject

import java.text.SimpleDateFormat

import static org.springframework.http.HttpStatus.*

@Transactional(readOnly = false)
class SportActivityController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond SportActivity.list(params), model: [sportActivityInstanceCount: SportActivity.count()]
    }

    def show(SportActivity sportActivityInstance) {
        respond sportActivityInstance
    }

    def create() {
        respond new SportActivity(params)
    }

    def getSportActivityById(long id) {
        def sportActivity = SportActivity.get(id)
        if (!sportActivity) {
            response.status = 404
            render "SportActivity Not Found"
            return
        }
        JSONObject jsonSportActivity = new JSONObject()
        jsonSportActivity.put("name", sportActivity.getName())
        jsonSportActivity.put("description", sportActivity.getDescription())
        jsonSportActivity.put("creationDate", sportActivity.getCreationDate())
        jsonSportActivity.put("locations", sportActivity.getLocations())

        jsonSportActivity.put("type", sportActivity.getType())
        jsonSportActivity.put("duration", sportActivity.getDuration())
        jsonSportActivity.put("distance", sportActivity.getDistance())
        jsonSportActivity.put("velocity", sportActivity.getVelocity())
        jsonSportActivity.put("rhythm", sportActivity.getRhythm())
        jsonSportActivity.put("targetDistance", sportActivity.getTargetDistance())
        jsonSportActivity.put("hydration", sportActivity.getHydration())
        jsonSportActivity.put("calories", sportActivity.getCalories())

        render jsonSportActivity as JSON
    }

    def getSportActivitiesByUser(String email) {
        EmailValidator emailValidator = EmailValidator.getInstance()
        if (emailValidator.isValid(email)) {
            def userInstance = User.findByEmail(email)
            if (userInstance) {
                def userActivities = SportActivity.findAllByUser(userInstance)
                if (userActivities) {
                    JSONArray jsonArray = new JSONArray()
                    userActivities.each {
                        JSONObject jsonObject = new JSONObject()
                        jsonObject.put("id", it.getId())
                        jsonObject.put("name", it.getName())
                        jsonObject.put("description", it.getDescription())
                        jsonObject.put("creationDate", it.creationDate)
                        jsonObject.put("type", it.type)
                        jsonObject.put("duration", it.duration)
                        jsonObject.put("distance", it.distance)
                        jsonObject.put("velocity", it.velocity)
                        jsonObject.put("rhythm", it.rhythm)
                        jsonObject.put("targetDistance", it.targetDistance)
                        jsonObject.put("hydration", it.hydration)
                        jsonArray.put(jsonObject)
                    }
                    render jsonArray as JSON
                } else {
                    response.status = 404
                    render "User doesnt have Sport Activities"
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
        def sport = new SportActivity(creationDate: format.parse(format.format(new Date())), description: params.description, name: params.name, user: userInstance, type: params.type)

        /**ADITIONAL PARAMETERS**/
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
        if (params.calories) {
            sport.calories = Double.valueOf(params.calories)
        }

        sport.save(flush: true)

        if (!sport.hasErrors()) {
            if (params.longitude && params.latitude) {
                def location = new Location(longitude: Double.valueOf(params.longitude), latitude: Double.valueOf(params.latitude), activity: sport)
                location.save(flush: true)
            }

            if (params.locationSet) {
                JSONObject jsonObject
                JSONArray locations
                try {
                    jsonObject = new JSONObject(params.locationSet)
                    locations = jsonObject.getJSONArray("locations")
                } catch (Exception e) {
                    response.status = 505
                    render "Fatal Error: Invalid Data Array: " + jsonObject.toString()
                    return
                }
                if (!locations.isEmpty()) {
                    locations.each {
                        def locationInstance = new Location(activity: sport,
                                longitude: it.getAt("longitude"), latitude: it.getAt("latitude"))
                        locationInstance.save(flush: true)
                        if (locationInstance.hasErrors()) {
                            render locationInstance.getErrors().getAllErrors()
                            return
                        }
                    }
                }
            }

            render "Success"
        } else if (sport.hasErrors()) {
            render "There are several data errors; please verify and re-send the information\n" + sport.errors.getAllErrors()
        }
    }

    def setSportActivityFields(long sportActivityId) {
        def sport = SportActivity.findById(sportActivityId)
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
            render "SportActivity Activity Not Found"
        }
    }

    @Transactional
    def save(SportActivity sportActivityInstance) {
        if (sportActivityInstance == null) {
            notFound()
            return
        }

        if (sportActivityInstance.hasErrors()) {
            respond sportActivityInstance.errors, view: 'create'
            return
        }

        sportActivityInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'sportActivity.label', default: 'SportActivity'), sportActivityInstance.id])
                redirect sportActivityInstance
            }
            '*' { respond sportActivityInstance, [status: CREATED] }
        }
    }

    def edit(SportActivity sportActivityInstance) {
        respond sportActivityInstance
    }

    @Transactional
    def update(SportActivity sportActivityInstance) {
        if (sportActivityInstance == null) {
            notFound()
            return
        }

        if (sportActivityInstance.hasErrors()) {
            respond sportActivityInstance.errors, view: 'edit'
            return
        }

        sportActivityInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'SportActivity.label', default: 'SportActivity'), sportActivityInstance.id])
                redirect sportActivityInstance
            }
            '*' { respond sportActivityInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(SportActivity sportActivityInstance) {

        if (sportActivityInstance == null) {
            notFound()
            return
        }

        sportActivityInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'SportActivity.label', default: 'SportActivity'), sportActivityInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'sportActivity.label', default: 'SportActivity'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
