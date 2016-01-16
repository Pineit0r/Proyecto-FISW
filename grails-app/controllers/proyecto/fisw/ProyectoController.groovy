package proyecto.fisw


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ProyectoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Proyecto.list(params), model: [proyectoInstanceCount: Proyecto.count()]
    }

    def show(Proyecto proyectoInstance) {
        respond proyectoInstance
    }

    def create() {
        respond new Proyecto(params)
    }

    @Transactional
    def save(Proyecto proyectoInstance) {
        if (proyectoInstance == null) {
            notFound()
            return
        }

        if (proyectoInstance.hasErrors()) {
            respond proyectoInstance.errors, view: 'create'
            return
        }

        proyectoInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'proyecto.label', default: 'Proyecto'), proyectoInstance.id])
                redirect proyectoInstance
            }
            '*' { respond proyectoInstance, [status: CREATED] }
        }
    }

    def edit(Proyecto proyectoInstance) {
        respond proyectoInstance
    }

    @Transactional
    def update(Proyecto proyectoInstance) {
        if (proyectoInstance == null) {
            notFound()
            return
        }

        if (proyectoInstance.hasErrors()) {
            respond proyectoInstance.errors, view: 'edit'
            return
        }

        proyectoInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Proyecto.label', default: 'Proyecto'), proyectoInstance.id])
                redirect proyectoInstance
            }
            '*' { respond proyectoInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Proyecto proyectoInstance) {

        if (proyectoInstance == null) {
            notFound()
            return
        }

        proyectoInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Proyecto.label', default: 'Proyecto'), proyectoInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'proyecto.label', default: 'Proyecto'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
