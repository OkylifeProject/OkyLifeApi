package okylifeapi

import grails.converters.JSON
import grails.transaction.Transactional
import org.apache.commons.validator.routines.EmailValidator
import org.codehaus.groovy.grails.web.json.JSONArray
import org.codehaus.groovy.grails.web.json.JSONObject

import java.text.SimpleDateFormat

import static org.springframework.http.HttpStatus.*

@Transactional(readOnly = false)
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

    def getEatActivitiesByUser(String email) {
        EmailValidator emailValidator = EmailValidator.getInstance()
        if (emailValidator.isValid(email)) {
            def userInstance = User.findByEmail(email)
            if (userInstance) {
                def userActivities = EatActivity.findAllByUser(userInstance)
                if (userActivities) {
                    JSONArray jsonArray = new JSONArray()
                    userActivities.each {
                        JSONObject jsonObject = new JSONObject()
                        jsonObject.put("id", it.getId())
                        jsonObject.put("name", it.getName())
                        jsonObject.put("description", it.getDescription())
                        jsonObject.put("creationDate", it.creationDate)
                        jsonObject.put("type", it.type)
                        jsonObject.put("portionSize", it.portionSize)
                        jsonObject.put("totalCarbohydrates", it.totalCarbohydrates)
                        jsonObject.put("totalFat", it.totalFat)
                        jsonObject.put("totalPortions", it.totalPortions)
                        jsonObject.put("totalProteins", it.totalProteins)
                        jsonArray.put(jsonObject)
                    }
                    render jsonArray as JSON
                } else {
                    response.status = 404
                    render "User doesnt have Eat Activities"
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

    def getEatActivityIngredients(long eatActivityId) {
        def eatActivity = EatActivity.get(eatActivityId)
        if (eatActivity) {
            def ingredients = eatActivity.getIngredients()
            if (!ingredients.isEmpty() && ingredients != null) {
                JSONArray jsonIngredients = new JSONArray()
                ingredients.each {
                    JSONObject jsonIngredient = new JSONObject()
                    jsonIngredient.put("name", it.name)
                    jsonIngredient.put("brand", it.brand)
                    jsonIngredient.put("description", it.description)
                    jsonIngredient.put("number", it.number)
                    jsonIngredient.put("carbohydrates", it.carbohydrates)
                    jsonIngredient.put("fat", it.fat)
                    jsonIngredient.put("proteins", it.proteins)
                    jsonIngredients.put(jsonIngredient)
                }
                render jsonIngredients as JSON
            } else {
                response.status = 404
                render "There are not Ingredients"
            }
        } else {
            response.status = 404
            render "Error: Eat Activity Not Found"
        }
    }

    def createEatActivity(String email) {
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
        def eatActivity = new EatActivity(creationDate: format.parse(format.format(new Date())), description: params.description, name: params.name, user: userInstance, type: params.type)
        if (params.ingredients) {

        }

        eatActivity.save(flush: true)
        if (!eatActivity.hasErrors()) {
            if (params.longitude && params.latitude) {
                def location = new Location(longitude: Double.valueOf(params.longitude), latitude: Double.valueOf(params.latitude), activity: eatActivity)
                location.save(flush: true)
            }
            render "Success"
        } else if (eatActivity.hasErrors()) {
            render "There are several data errors; please verify and re-send the information\n" + eatActivity.errors.getAllErrors()
        }
    }

    def setEatActivityFields(long eatActivityId) {
        def eatActivity = EatActivity.findById(eatActivityId)
        if (eatActivity) {
            if (params.portionSize) {
                eatActivity.portionSize = Double.valueOf(params.portionSize)
            }
            if (params.totalCarbohydrates) {
                eatActivity.totalCarbohydrates = Double.valueOf(params.totalCarbohydrates)
            }
            if (params.totalFat) {
                eatActivity.totalFat = Double.valueOf(params.totalFat)
            }
            if (params.totalPortions) {
                eatActivity.totalPortions = Double.valueOf(params.totalPortions)
            }
            if (params.totalProteins) {
                eatActivity.totalProteins = Double.valueOf(params.totalProteins)
            }
            eatActivity.save(flush: true)
            if (eatActivity.hasErrors()) {
                response.status = 505
                render "Error at saving parameters; please check inputs"
            } else {
                render "Success"
            }
        } else {
            response.status = 404
            render "EatActivity Activity Not Found"
        }
    }

    def addIngredient(long eatActivityId) {
        def eatActivity = EatActivity.findById(eatActivityId)
        if (eatActivity) {
            def ingredient = new Ingredient(name: params.name, description: params.description,
                    number: Double.valueOf(params.number),
                    fat: Double.valueOf(params.fat),
                    carbohydrates: Double.valueOf(params.carbohydrates),
                    proteins: Double.valueOf(params.proteins),
                    calories: Double.valueOf(params.calories),
                    rationType: params.rationType,
                    eatActivity: eatActivity)
            ingredient.save(flush: true)
            if (!ingredient.hasErrors()) {
                render "Success"
            } else {
                response.status = 505
                render ingredient.getErrors().getAllErrors()
            }
        } else {
            response.status = 404
            render "EatActivity Activity Not Found"
        }
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
