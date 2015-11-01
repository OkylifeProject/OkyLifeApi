package okylifeapi

import grails.test.mixin.Mock
import grails.test.mixin.TestFor
import spock.lang.Specification

@TestFor(EatActivityController)
@Mock(EatActivity)
class EatActivityControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when: "The index action is executed"
        controller.index()

        then: "The model is correct"
        !model.eatActivityInstanceList
        model.eatActivityInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when: "The create action is executed"
        controller.create()

        then: "The model is correctly created"
        model.eatActivityInstance != null
    }

    void "Test the save action correctly persists an instance"() {

        when: "The save action is executed with an invalid instance"
        request.contentType = FORM_CONTENT_TYPE
        request.method = 'POST'
        def eatActivity = new EatActivity()
        eatActivity.validate()
        controller.save(eatActivity)

        then: "The create view is rendered again with the correct model"
        model.eatActivityInstance != null
        view == 'create'

        when: "The save action is executed with a valid instance"
        response.reset()
        populateValidParams(params)
        eatActivity = new EatActivity(params)

        controller.save(eatActivity)

        then: "A redirect is issued to the show action"
        response.redirectedUrl == '/eatActivity/show/1'
        controller.flash.message != null
        EatActivity.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when: "The show action is executed with a null domain"
        controller.show(null)

        then: "A 404 error is returned"
        response.status == 404

        when: "A domain instance is passed to the show action"
        populateValidParams(params)
        def eatActivity = new EatActivity(params)
        controller.show(eatActivity)

        then: "A model is populated containing the domain instance"
        model.eatActivityInstance == eatActivity
    }

    void "Test that the edit action returns the correct model"() {
        when: "The edit action is executed with a null domain"
        controller.edit(null)

        then: "A 404 error is returned"
        response.status == 404

        when: "A domain instance is passed to the edit action"
        populateValidParams(params)
        def eatActivity = new EatActivity(params)
        controller.edit(eatActivity)

        then: "A model is populated containing the domain instance"
        model.eatActivityInstance == eatActivity
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when: "Update is called for a domain instance that doesn't exist"
        request.contentType = FORM_CONTENT_TYPE
        request.method = 'PUT'
        controller.update(null)

        then: "A 404 error is returned"
        response.redirectedUrl == '/eatActivity/index'
        flash.message != null


        when: "An invalid domain instance is passed to the update action"
        response.reset()
        def eatActivity = new EatActivity()
        eatActivity.validate()
        controller.update(eatActivity)

        then: "The edit view is rendered again with the invalid instance"
        view == 'edit'
        model.eatActivityInstance == eatActivity

        when: "A valid domain instance is passed to the update action"
        response.reset()
        populateValidParams(params)
        eatActivity = new EatActivity(params).save(flush: true)
        controller.update(eatActivity)

        then: "A redirect is issues to the show action"
        response.redirectedUrl == "/eatActivity/show/$eatActivity.id"
        flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when: "The delete action is called for a null instance"
        request.contentType = FORM_CONTENT_TYPE
        request.method = 'DELETE'
        controller.delete(null)

        then: "A 404 is returned"
        response.redirectedUrl == '/eatActivity/index'
        flash.message != null

        when: "A domain instance is created"
        response.reset()
        populateValidParams(params)
        def eatActivity = new EatActivity(params).save(flush: true)

        then: "It exists"
        EatActivity.count() == 1

        when: "The domain instance is passed to the delete action"
        controller.delete(eatActivity)

        then: "The instance is deleted"
        EatActivity.count() == 0
        response.redirectedUrl == '/eatActivity/index'
        flash.message != null
    }
}
