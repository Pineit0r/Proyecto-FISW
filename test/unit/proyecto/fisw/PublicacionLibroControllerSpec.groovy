package proyecto.fisw


import grails.test.mixin.*
import spock.lang.*

@TestFor(PublicacionLibroController)
@Mock(PublicacionLibro)
class PublicacionLibroControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when: "The index action is executed"
        controller.index()

        then: "The model is correct"
        !model.publicacionLibroInstanceList
        model.publicacionLibroInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when: "The create action is executed"
        controller.create()

        then: "The model is correctly created"
        model.publicacionLibroInstance != null
    }

    void "Test the save action correctly persists an instance"() {

        when: "The save action is executed with an invalid instance"
        request.contentType = FORM_CONTENT_TYPE
        request.method = 'POST'
        def publicacionLibro = new PublicacionLibro()
        publicacionLibro.validate()
        controller.save(publicacionLibro)

        then: "The create view is rendered again with the correct model"
        model.publicacionLibroInstance != null
        view == 'create'

        when: "The save action is executed with a valid instance"
        response.reset()
        populateValidParams(params)
        publicacionLibro = new PublicacionLibro(params)

        controller.save(publicacionLibro)

        then: "A redirect is issued to the show action"
        response.redirectedUrl == '/publicacionLibro/show/1'
        controller.flash.message != null
        PublicacionLibro.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when: "The show action is executed with a null domain"
        controller.show(null)

        then: "A 404 error is returned"
        response.status == 404

        when: "A domain instance is passed to the show action"
        populateValidParams(params)
        def publicacionLibro = new PublicacionLibro(params)
        controller.show(publicacionLibro)

        then: "A model is populated containing the domain instance"
        model.publicacionLibroInstance == publicacionLibro
    }

    void "Test that the edit action returns the correct model"() {
        when: "The edit action is executed with a null domain"
        controller.edit(null)

        then: "A 404 error is returned"
        response.status == 404

        when: "A domain instance is passed to the edit action"
        populateValidParams(params)
        def publicacionLibro = new PublicacionLibro(params)
        controller.edit(publicacionLibro)

        then: "A model is populated containing the domain instance"
        model.publicacionLibroInstance == publicacionLibro
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when: "Update is called for a domain instance that doesn't exist"
        request.contentType = FORM_CONTENT_TYPE
        request.method = 'PUT'
        controller.update(null)

        then: "A 404 error is returned"
        response.redirectedUrl == '/publicacionLibro/index'
        flash.message != null


        when: "An invalid domain instance is passed to the update action"
        response.reset()
        def publicacionLibro = new PublicacionLibro()
        publicacionLibro.validate()
        controller.update(publicacionLibro)

        then: "The edit view is rendered again with the invalid instance"
        view == 'edit'
        model.publicacionLibroInstance == publicacionLibro

        when: "A valid domain instance is passed to the update action"
        response.reset()
        populateValidParams(params)
        publicacionLibro = new PublicacionLibro(params).save(flush: true)
        controller.update(publicacionLibro)

        then: "A redirect is issues to the show action"
        response.redirectedUrl == "/publicacionLibro/show/$publicacionLibro.id"
        flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when: "The delete action is called for a null instance"
        request.contentType = FORM_CONTENT_TYPE
        request.method = 'DELETE'
        controller.delete(null)

        then: "A 404 is returned"
        response.redirectedUrl == '/publicacionLibro/index'
        flash.message != null

        when: "A domain instance is created"
        response.reset()
        populateValidParams(params)
        def publicacionLibro = new PublicacionLibro(params).save(flush: true)

        then: "It exists"
        PublicacionLibro.count() == 1

        when: "The domain instance is passed to the delete action"
        controller.delete(publicacionLibro)

        then: "The instance is deleted"
        PublicacionLibro.count() == 0
        response.redirectedUrl == '/publicacionLibro/index'
        flash.message != null
    }
}
