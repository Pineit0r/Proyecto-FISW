package proyecto.fisw

import org.springframework.web.multipart.MultipartHttpServletRequest
import org.springframework.web.multipart.commons.CommonsMultipartFile

import static org.springframework.http.HttpStatus.*
import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional

@Transactional(readOnly = true)
@Secured(['IS_AUTHENTICATED_FULLY'])
class PublicacionLibroController {
    def springSecurityService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond PublicacionLibro.list(params), model: [publicacionLibroInstanceCount: PublicacionLibro.count()]
    }

    def show(PublicacionLibro publicacionLibroInstance) {
        respond publicacionLibroInstance
    }

    def create() {
        respond new PublicacionLibro(params)
    }

    @Transactional
    def save(PublicacionLibro publicacionLibroInstance) {
        if (publicacionLibroInstance == null) {
            notFound()
            return
        }

        if (publicacionLibroInstance.hasErrors()) {
            respond publicacionLibroInstance.errors, view: 'create'
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

        Usuario user = (Usuario) springSecurityService.currentUser
        publicacionLibroInstance.usuario = user
        publicacionLibroInstance.pdf = multimediaInstance
        publicacionLibroInstance.save flush: true, failOnError: true

        redirect action: "ficha", controller: "usuario"

        /*
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'publicacionLibro.label', default: 'PublicacionLibro'), publicacionLibroInstance.id])
                redirect publicacionLibroInstance
            }
            '*' { respond publicacionLibroInstance, [status: CREATED] }
        }*/
    }

    def edit(PublicacionLibro publicacionLibroInstance) {
        respond publicacionLibroInstance
    }

    @Transactional
    def update(PublicacionLibro publicacionLibroInstance) {
        if (publicacionLibroInstance == null) {
            notFound()
            return
        }

        if (publicacionLibroInstance.hasErrors()) {
            respond publicacionLibroInstance.errors, view: 'edit'
            return
        }

        publicacionLibroInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'PublicacionLibro.label', default: 'PublicacionLibro'), publicacionLibroInstance.id])
                redirect publicacionLibroInstance
            }
            '*' { respond publicacionLibroInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(PublicacionLibro publicacionLibroInstance) {

        if (publicacionLibroInstance == null) {
            notFound()
            return
        }

        publicacionLibroInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'PublicacionLibro.label', default: 'PublicacionLibro'), publicacionLibroInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'publicacionLibro.label', default: 'PublicacionLibro'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
