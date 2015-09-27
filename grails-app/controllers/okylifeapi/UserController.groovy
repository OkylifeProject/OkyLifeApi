package okylifeapi

import grails.converters.JSON
import grails.transaction.Transactional
import org.apache.commons.validator.routines.EmailValidator
import org.codehaus.groovy.grails.web.json.JSONObject
import sun.misc.BASE64Decoder
import sun.misc.BASE64Encoder

import java.text.SimpleDateFormat

import static org.springframework.http.HttpStatus.*

@Transactional(readOnly = true)
class UserController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond User.list(params), model: [userInstanceCount: User.count()]
    }

    def show(User userInstance) {
        respond userInstance
    }

    def create() {
        respond new User(params)
    }

    def registerUser() {

        SimpleDateFormat format = new SimpleDateFormat("MM/dd/yy")
        if (User.findByEmail(params.email)) {
            render "Email already in use"
            return
        }
        Date birthDate = format.parse(params.birthDate)

        def userInstance = new User(sex: params.sex, firstName: params.firstName, lastName: params.lastName, password: params.password, email: params.email, birthDate: birthDate)
        userInstance.save(flush: true)
        if (!userInstance.hasErrors()) {
            if (params.image) {
                def newFile = new File('app-data/profile-pics/' + params.email + '-pic.jpg')
                newFile.getParentFile().mkdirs()
                newFile.createNewFile()
                newFile.bytes = new BASE64Decoder().decodeBuffer(params.image)
                userInstance.imagePath = newFile.getName()
                userInstance.save(flush: true)
            }
        }

        if (userInstance.hasErrors()) {
            render "There are several data errors; please verify and re-send the information\n" + userInstance.errors.getAllErrors().collect {
                it.defaultMessage
            }
        } else {
            render "Success"
        }
    }

    def loginUser(String email, String password) {
        EmailValidator emailValidator = EmailValidator.getInstance();
        def userInstance
        if (emailValidator.isValid(email)) {
            userInstance = User.findByEmailAndPassword(email, password)
        }
        JSONObject myResponse = new JSONObject();
        myResponse.put("status", "success")
        if (userInstance) {
            def userImage = new File('app-data/profile-pics/' + userInstance.imagePath)
            if (userImage.exists()) {
                myResponse.put("imageHash", userImage.bytes.encodeAsSHA1())
            } else {
                myResponse.put("imageHash", "")
            }
            myResponse.put("email", userInstance.email)
            myResponse.put("id", userInstance.id)
            render myResponse as JSON
        } else {
            response.status = 404
            render "Incorrect email or password. Please try again"
        }
    }

    def getImageHash(String email) {
        def userInstance = User.findByEmail(email)
        if (userInstance.imagePath != null && userInstance.imagePath != "") {
            def userImage = new File('app-data/profile-pics/' + userInstance.imagePath)
            if (userImage) {
                render userImage.bytes.encodeAsSHA1()
            } else {
                render ""
            }
        }
    }

    def getImage(String email) {
        def user = User.findByEmail(email)
        JSONObject response = new JSONObject()
        if (user.imagePath != null && user.imagePath != "") {
            def userImage = new File('app-data/profile-pics/' + user.imagePath)
            if (userImage) {
                def encode = new BASE64Encoder().encode(userImage.bytes)
                response.put("imageBytes", encode)
                render response as JSON
            } else {
                render ""
            }

        }

    }

    @Transactional
    def save(User userInstance) {
        if (userInstance == null) {
            notFound()
            return
        }

        if (userInstance.hasErrors()) {
            respond userInstance.errors, view: 'create'
            return
        }

        userInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])
                redirect userInstance
            }
            '*' { respond userInstance, [status: CREATED] }
        }
    }

    def edit(User userInstance) {
        respond userInstance
    }

    @Transactional
    def update(User userInstance) {
        if (userInstance == null) {
            notFound()
            return
        }

        if (userInstance.hasErrors()) {
            respond userInstance.errors, view: 'edit'
            return
        }

        userInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'User.label', default: 'User'), userInstance.id])
                redirect userInstance
            }
            '*' { respond userInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(User userInstance) {

        if (userInstance == null) {
            notFound()
            return
        }

        userInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'User.label', default: 'User'), userInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
