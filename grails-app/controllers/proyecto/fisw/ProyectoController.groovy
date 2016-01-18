package proyecto.fisw


import static org.springframework.http.HttpStatus.*
import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional

@Transactional(readOnly = true)
@Secured(['IS_AUTHENTICATED_FULLY'])
class ProyectoController {
    def springSecurityService

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

        proyectoInstance.save flush: true, failOnError: true

        params.list("area.id").each {
            Area area = Area.findById(it)
            ProyectoArea proyectoArea = new ProyectoArea(proyecto: proyectoInstance, area: area)
            proyectoArea.save(flush: true, failOnError: true)
        }

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

        Usuario user = (Usuario) springSecurityService.currentUser
        if (user != proyectoInstance.creador) {
            flash.messageError = "Solo el creador puede editar el proyecto."
            //respond proyectoInstance, view: 'edit'
            redirect proyectoInstance
        } else {

            ProyectoArea.findAllByProyecto(proyectoInstance).each {
                it.delete()
            }

            params.list("area.id").each {
                Area area = Area.findById(it)
                ProyectoArea proyectoArea = new ProyectoArea(proyecto: proyectoInstance, area: area)
                proyectoArea.save(flush: true, failOnError: true)
            }

            proyectoInstance.creador = user
            proyectoInstance.save flush: true

            request.withFormat {
                form multipartForm {
                    flash.message = message(code: 'default.updated.message', args: [message(code: 'Proyecto.label', default: 'Proyecto'), proyectoInstance.id])
                    redirect proyectoInstance
                }
                '*' { respond proyectoInstance, [status: OK] }
            }
        }
    }

    @Transactional
    def delete(Proyecto proyectoInstance) {

        if (proyectoInstance == null) {
            notFound()
            return
        }

        Usuario user = (Usuario) springSecurityService.currentUser
        if (user != proyectoInstance.creador) {
            flash.message = "Solo el creador puede eliminar el proyecto."
            respond proyectoInstance, view: 'show'
        } else {
            proyectoInstance.delete flush: true

            request.withFormat {
                form multipartForm {
                    flash.message = message(code: 'default.deleted.message', args: [message(code: 'Proyecto.label', default: 'Proyecto'), proyectoInstance.id])
                    redirect action: "index", method: "GET"
                }
                '*' { render status: NO_CONTENT }
            }
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
