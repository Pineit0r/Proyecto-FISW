package proyecto.fisw


import grails.test.mixin.*
import spock.lang.*

@TestFor(ReporteController)
@Mock(Reporte)
class ReporteControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when: "The index action is executed"
        controller.index()

        then: "The model is correct"
        !model.reporteInstanceList
        model.reporteInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when: "The create action is executed"
        controller.create()

        then: "The model is correctly created"
        model.reporteInstance != null
    }

    void "Test the save action correctly persists an instance"() {

        when: "The save action is executed with an invalid instance"
        request.contentType = FORM_CONTENT_TYPE
        request.method = 'POST'
        def reporte = new Reporte()
        reporte.validate()
        controller.save(reporte)

        then: "The create view is rendered again with the correct model"
        model.reporteInstance != null
        view == 'create'

        when: "The save action is executed with a valid instance"
        response.reset()
        populateValidParams(params)
        reporte = new Reporte(params)

        controller.save(reporte)

        then: "A redirect is issued to the show action"
        response.redirectedUrl == '/reporte/show/1'
        controller.flash.message != null
        Reporte.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when: "The show action is executed with a null domain"
        controller.show(null)

        then: "A 404 error is returned"
        response.status == 404

        when: "A domain instance is passed to the show action"
        populateValidParams(params)
        def reporte = new Reporte(params)
        controller.show(reporte)

        then: "A model is populated containing the domain instance"
        model.reporteInstance == reporte
    }

    void "Test that the edit action returns the correct model"() {
        when: "The edit action is executed with a null domain"
        controller.edit(null)

        then: "A 404 error is returned"
        response.status == 404

        when: "A domain instance is passed to the edit action"
        populateValidParams(params)
        def reporte = new Reporte(params)
        controller.edit(reporte)

        then: "A model is populated containing the domain instance"
        model.reporteInstance == reporte
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when: "Update is called for a domain instance that doesn't exist"
        request.contentType = FORM_CONTENT_TYPE
        request.method = 'PUT'
        controller.update(null)

        then: "A 404 error is returned"
        response.redirectedUrl == '/reporte/index'
        flash.message != null


        when: "An invalid domain instance is passed to the update action"
        response.reset()
        def reporte = new Reporte()
        reporte.validate()
        controller.update(reporte)

        then: "The edit view is rendered again with the invalid instance"
        view == 'edit'
        model.reporteInstance == reporte

        when: "A valid domain instance is passed to the update action"
        response.reset()
        populateValidParams(params)
        reporte = new Reporte(params).save(flush: true)
        controller.update(reporte)

        then: "A redirect is issues to the show action"
        response.redirectedUrl == "/reporte/show/$reporte.id"
        flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when: "The delete action is called for a null instance"
        request.contentType = FORM_CONTENT_TYPE
        request.method = 'DELETE'
        controller.delete(null)

        then: "A 404 is returned"
        response.redirectedUrl == '/reporte/index'
        flash.message != null

        when: "A domain instance is created"
        response.reset()
        populateValidParams(params)
        def reporte = new Reporte(params).save(flush: true)

        then: "It exists"
        Reporte.count() == 1

        when: "The domain instance is passed to the delete action"
        controller.delete(reporte)

        then: "The instance is deleted"
        Reporte.count() == 0
        response.redirectedUrl == '/reporte/index'
        flash.message != null
    }
}
