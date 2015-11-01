package okylifeapi

import grails.converters.JSON
import grails.transaction.Transactional
import org.apache.commons.validator.routines.EmailValidator
import org.codehaus.groovy.grails.web.json.JSONArray
import org.codehaus.groovy.grails.web.json.JSONObject

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
