package proyecto.fisw


import static org.springframework.http.HttpStatus.*
import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional

@Transactional(readOnly = true)
@Secured(['ROLE_DIRECTOR'])
class CongresoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    @Secured(['IS_AUTHENTICATED_FULLY'])
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Congreso.list(params), model: [congresoInstanceCount: Congreso.count()]
    }

    @Secured(['IS_AUTHENTICATED_FULLY'])
    def show(Congreso congresoInstance) {
        respond congresoInstance
    }

    def create() {
        respond new Congreso(params)
    }

    @Transactional
    def save(Congreso congresoInstance) {
        if (congresoInstance == null) {
            notFound()
            return
        }

        if (congresoInstance.hasErrors()) {
            respond congresoInstance.errors, view: 'create'
            return
        }

        congresoInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'congreso.label', default: 'Congreso'), congresoInstance.id])
                redirect congresoInstance
            }
            '*' { respond congresoInstance, [status: CREATED] }
        }
    }

    def edit(Congreso congresoInstance) {
        respond congresoInstance
    }

    @Transactional
    def update(Congreso congresoInstance) {
        if (congresoInstance == null) {
            notFound()
            return
        }

        if (congresoInstance.hasErrors()) {
            respond congresoInstance.errors, view: 'edit'
            return
        }

        congresoInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Congreso.label', default: 'Congreso'), congresoInstance.id])
                redirect congresoInstance
            }
            '*' { respond congresoInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Congreso congresoInstance) {

        if (congresoInstance == null) {
            notFound()
            return
        }

        congresoInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Congreso.label', default: 'Congreso'), congresoInstance.id])
                redirect action: "index", controller: "intranet", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'congreso.label', default: 'Congreso'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
