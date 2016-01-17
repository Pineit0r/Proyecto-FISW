package proyecto.fisw


import static org.springframework.http.HttpStatus.*
import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional

@Transactional(readOnly = true)
@Secured(['IS_AUTHENTICATED_FULLY'])
class CargoProyectoController {
    def springSecurityService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond CargoProyecto.list(params), model: [cargoProyectoInstanceCount: CargoProyecto.count()]
    }

    def show(CargoProyecto cargoProyectoInstance) {
        CargoProyecto cargoProyecto = CargoProyecto.get(new CargoProyecto(usuario: params.usuario, proyecto: params.proyecto, cargo: params.cargo))
        respond cargoProyecto
    }

    def create() {
        respond new CargoProyecto(params)
    }

    @Transactional
    def save(CargoProyecto cargoProyectoInstance) {
        if (cargoProyectoInstance == null) {
            notFound()
            return
        }

        if (cargoProyectoInstance.hasErrors()) {
            respond cargoProyectoInstance.errors, view: 'create'
            return
        }

        Usuario user = (Usuario) springSecurityService.currentUser
        cargoProyectoInstance.usuario = user
        cargoProyectoInstance.save flush: true, failOnError: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'cargoProyecto.label', default: 'CargoProyecto'), cargoProyectoInstance.id])
                redirect action: 'show', params: [usuario: cargoProyectoInstance.usuario, proyecto: cargoProyectoInstance.proyecto, cargo: cargoProyectoInstance.cargo]
            }
            '*' { respond cargoProyectoInstance, [status: CREATED] }
        }
    }

    def edit(CargoProyecto cargoProyectoInstance) {
        respond cargoProyectoInstance
    }

    @Transactional
    def update(CargoProyecto cargoProyectoInstance) {
        if (cargoProyectoInstance == null) {
            notFound()
            return
        }

        if (cargoProyectoInstance.hasErrors()) {
            respond cargoProyectoInstance.errors, view: 'edit'
            return
        }

        cargoProyectoInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'CargoProyecto.label', default: 'CargoProyecto'), cargoProyectoInstance.id])
                redirect cargoProyectoInstance
            }
            '*' { respond cargoProyectoInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(CargoProyecto cargoProyectoInstance) {

        if (cargoProyectoInstance == null) {
            notFound()
            return
        }

        cargoProyectoInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'CargoProyecto.label', default: 'CargoProyecto'), cargoProyectoInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'cargoProyecto.label', default: 'CargoProyecto'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
