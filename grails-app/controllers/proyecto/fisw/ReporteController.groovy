package proyecto.fisw


import static org.springframework.http.HttpStatus.*
import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional

@Transactional(readOnly = true)
@Secured(['IS_AUTHENTICATED_FULLY'])
class ReporteController {
    def springSecurityService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        Usuario user = (Usuario) springSecurityService.currentUser
        respond Reporte.findAllByUsuario(user).sort {it.creado}.reverse()
    }

    @Transactional
    def show(Reporte reporteInstance) {
        Usuario user = (Usuario) springSecurityService.currentUser
        if (user == reporteInstance.usuario) {
            reporteInstance.visto = true
            reporteInstance.save flush: true, failOnError: true
        }
        respond reporteInstance
    }

    @Secured(['ROLE_DIRECTOR'])
    def create() {
        respond new Reporte(params)
    }

    @Transactional
    @Secured(['ROLE_DIRECTOR'])
    def save(Reporte reporteInstance) {
        params.creado = new Date()
        params.visto = false
        reporteInstance.properties = params

        if (reporteInstance == null) {
            notFound()
            return
        }

        if (reporteInstance.hasErrors()) {
            respond reporteInstance.errors, view: 'create'
            return
        }

        reporteInstance.director = (Usuario) springSecurityService.currentUser
        reporteInstance.creado = new Date()
        reporteInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'reporte.label', default: 'Reporte'), reporteInstance.id])
                redirect reporteInstance
            }
            '*' { respond reporteInstance, [status: CREATED] }
        }
    }

    @Secured(['ROLE_DIRECTOR'])
    def edit(Reporte reporteInstance) {
        respond reporteInstance
    }

    @Transactional
    def update(Reporte reporteInstance) {
        if (reporteInstance == null) {
            notFound()
            return
        }

        if (reporteInstance.hasErrors()) {
            respond reporteInstance.errors, view: 'edit'
            return
        }

        reporteInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Reporte.label', default: 'Reporte'), reporteInstance.id])
                redirect reporteInstance
            }
            '*' { respond reporteInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Reporte reporteInstance) {

        if (reporteInstance == null) {
            notFound()
            return
        }

        reporteInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Reporte.label', default: 'Reporte'), reporteInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'reporte.label', default: 'Reporte'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
