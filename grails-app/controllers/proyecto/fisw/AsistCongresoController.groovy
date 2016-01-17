package proyecto.fisw

import grails.plugin.springsecurity.SpringSecurityService
import org.springframework.web.multipart.MultipartHttpServletRequest
import org.springframework.web.multipart.commons.CommonsMultipartFile

import static org.springframework.http.HttpStatus.*
import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional

@Transactional(readOnly = true)
@Secured(['IS_AUTHENTICATED_FULLY'])
class AsistCongresoController {
    def springSecurityService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        Usuario user = (Usuario) springSecurityService.currentUser
        return [asistCongresoInstanceList: AsistCongreso.findAllByUsuario(user), asistCongresoInstanceCount: AsistCongreso.findAllByUsuario(user).size()]
    }

    def show(AsistCongreso asistCongresoInstance) {
        respond asistCongresoInstance
    }

    def create() {
        respond new AsistCongreso(params)
    }

    @Transactional
    def save(AsistCongreso asistCongresoInstance) {
        if (asistCongresoInstance == null) {
            notFound()
            return
        }

        if (asistCongresoInstance.hasErrors()) {
            respond asistCongresoInstance.errors, view: 'create'
            return
        }

        def multimediaInstance = null

        if(request instanceof MultipartHttpServletRequest) {
            MultipartHttpServletRequest mpr = (MultipartHttpServletRequest)request;
            CommonsMultipartFile file = (CommonsMultipartFile) mpr.getFile("file");

            if(!file.empty) {
                multimediaInstance = new Multimedia()
                multimediaInstance.filename = file.originalFilename
                multimediaInstance.fullpath = request.getSession().getServletContext().getRealPath("") + "/.." + grailsApplication.config.uploadFolder + multimediaInstance.filename
                multimediaInstance.subido = new Date()
                multimediaInstance.tipo = params.tipo
                Usuario user = (Usuario) springSecurityService.currentUser
                multimediaInstance.usuario = user
                file.transferTo(new File(multimediaInstance.fullpath))
                multimediaInstance.save(failOnError: true)
            }
        }

        asistCongresoInstance.poster = multimediaInstance
        Usuario user = (Usuario) springSecurityService.currentUser
        asistCongresoInstance.usuario = user
        asistCongresoInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'asistCongreso.label', default: 'AsistCongreso'), asistCongresoInstance.id])
                redirect asistCongresoInstance
            }
            '*' { respond asistCongresoInstance, [status: CREATED] }
        }
    }

    def edit(AsistCongreso asistCongresoInstance) {
        respond asistCongresoInstance
    }

    @Transactional
    def update(AsistCongreso asistCongresoInstance) {
        if (asistCongresoInstance == null) {
            notFound()
            return
        }

        if (asistCongresoInstance.hasErrors()) {
            respond asistCongresoInstance.errors, view: 'edit'
            return
        }

        asistCongresoInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'AsistCongreso.label', default: 'AsistCongreso'), asistCongresoInstance.id])
                redirect asistCongresoInstance
            }
            '*' { respond asistCongresoInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(AsistCongreso asistCongresoInstance) {

        if (asistCongresoInstance == null) {
            notFound()
            return
        }

        asistCongresoInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'AsistCongreso.label', default: 'AsistCongreso'), asistCongresoInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'asistCongreso.label', default: 'AsistCongreso'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
