package okylifeapi

import grails.converters.JSON
import grails.transaction.Transactional
import org.apache.commons.validator.routines.EmailValidator
import org.codehaus.groovy.grails.web.json.JSONArray
import org.codehaus.groovy.grails.web.json.JSONObject

import static org.springframework.http.HttpStatus.*

@Transactional(readOnly = false)
class MessageController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Message.list(params), model: [messageInstanceCount: Message.count()]
    }

    def show(Message messageInstance) {
        respond messageInstance
    }

    def create() {
        respond new Message(params)
    }

    def sendMessage(String emailRecipient, String emailRemitent) {
        EmailValidator emailValidator = EmailValidator.getInstance()
        if (emailValidator.isValid(emailRecipient) && emailValidator.isValid(emailRemitent)) {
            def userRecipient = User.findByEmail(emailRecipient)
            def userRemitent = User.findByEmail(emailRemitent)
            if (userRecipient && userRemitent) {
                def message = new Message(subject: params.subject, content: params.content, remitent: userRemitent, recipient: userRecipient)
                message.save(flush: true)
                if (!message.hasErrors()) {
                    render "Success"
                } else {
                    response.status = 404
                    render "There are several data errors; please verify and re-send the information\n" + message.errors.getAllErrors().collect {
                        it.defaultMessage
                    }
                }
            } else {
                response.status = 404
                render "User doenst exists"
            }
        } else {
            response.status = 404
            render "Invalid email"
        }
    }

    def getMessagesByUser(String email) {
        EmailValidator emailValidator = EmailValidator.getInstance()
        if (emailValidator.isValid(email)) {
            def userInstance = User.findByEmail(email)
            if (userInstance) {
                def messageInstances = userInstance.getMessages()
                if (messageInstances) {
                    JSONArray jsonArray = new JSONArray()
                    messageInstances.each {
                        JSONObject jsonObject = new JSONObject()
                        jsonObject.put("id", it.getId())
                        jsonObject.put("remitentEmail", it.getRemitent().getEmail())
                        jsonObject.put("recipientEmail", it.getRecipient().getEmail())
                        jsonObject.put("subject", it.getSubject())
                        jsonObject.put("content", it.getContent())
                        jsonArray.put(jsonObject)
                    }
                    render jsonArray as JSON
                } else {
                    response.status = 404
                    render "User doesnt have messages"
                }
            } else {
                response.status = 404
                render "User doenst exists"
            }
        } else {
            esponse.status = 404
            render "Invalid email"
        }
    }

    @Transactional
    def save(Message messageInstance) {
        if (messageInstance == null) {
            notFound()
            return
        }

        if (messageInstance.hasErrors()) {
            respond messageInstance.errors, view: 'create'
            return
        }

        messageInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'message.label', default: 'Message'), messageInstance.id])
                redirect messageInstance
            }
            '*' { respond messageInstance, [status: CREATED] }
        }
    }

    def edit(Message messageInstance) {
        respond messageInstance
    }

    @Transactional
    def update(Message messageInstance) {
        if (messageInstance == null) {
            notFound()
            return
        }

        if (messageInstance.hasErrors()) {
            respond messageInstance.errors, view: 'edit'
            return
        }

        messageInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Message.label', default: 'Message'), messageInstance.id])
                redirect messageInstance
            }
            '*' { respond messageInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Message messageInstance) {

        if (messageInstance == null) {
            notFound()
            return
        }

        messageInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Message.label', default: 'Message'), messageInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'message.label', default: 'Message'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
