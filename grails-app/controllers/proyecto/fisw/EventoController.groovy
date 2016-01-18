package proyecto.fisw


import static org.springframework.http.HttpStatus.*
import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional

@Transactional(readOnly = true)
@Secured(['ROLE_DIRECTOR','ROLE_ADMIN'])
class EventoController {

    def springSecurityService
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    @Secured(['IS_AUTHENTICATED_FULLY'])
    def show(Evento eventoInstance) {
        respond eventoInstance
    }

    def create() {
        respond new Evento(params)
    }

    @Transactional
    def save(Evento eventoInstance) {
        if (eventoInstance == null) {
            notFound()
            return
        }

        Usuario director = (Usuario) springSecurityService.currentUser
        eventoInstance.usuario = director

        if (eventoInstance.hasErrors()) {
            respond eventoInstance.errors, view: 'create'
            return
        }
        Date now = new Date()
        if (now > params.fecha){
            flash.message = "Fecha inválida."
            redirect (controller:'evento', action:'create')
        } else {
            eventoInstance.save flush: true

            request.withFormat {
                form multipartForm {
                    flash.message = message(code: 'default.created.message', args: [message(code: 'evento.label', default: 'Evento'), eventoInstance.id])
                    redirect eventoInstance
                }
                '*' { respond eventoInstance, [status: CREATED] }
            }
        }
    }

    def edit(Evento eventoInstance) {
        respond eventoInstance
    }

    @Transactional
    def update(Evento eventoInstance) {
        if (eventoInstance == null) {
            notFound()
            return
        }

        if (eventoInstance.hasErrors()) {
            respond eventoInstance.errors, view: 'edit'
            return
        }

        Usuario user = (Usuario) springSecurityService.currentUser
        eventoInstance.usuario = user
        eventoInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Evento.label', default: 'Evento'), eventoInstance.id])
                redirect eventoInstance
            }
            '*' { respond eventoInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Evento eventoInstance) {

        if (eventoInstance == null) {
            notFound()
            return
        }

        eventoInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Evento.label', default: 'Evento'), eventoInstance.id])
                redirect action: "index", controller: "intranet", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'evento.label', default: 'Evento'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
