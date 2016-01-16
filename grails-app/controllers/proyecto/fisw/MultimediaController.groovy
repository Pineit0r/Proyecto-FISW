package proyecto.fisw

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import org.springframework.web.multipart.MultipartHttpServletRequest
import org.springframework.web.multipart.commons.CommonsMultipartFile
import grails.transaction.Transactional

@Secured("IS_AUTHENTICATED_ANONYMOUSLY")
@Transactional(readOnly = true)
class MultimediaController {
    def springSecurityService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Multimedia.list(params), model: [multimediaInstanceCount: Multimedia.count()]
    }

    def list() {
        params.max = 10
        [multimediaInstanceList: Multimedia.list(params), multimediaInstanceTotal: Multimedia.count()]
    }

    @Transactional
    def upload() {
        if(request instanceof MultipartHttpServletRequest) {
            MultipartHttpServletRequest mpr = (MultipartHttpServletRequest)request;
            CommonsMultipartFile file = (CommonsMultipartFile) mpr.getFile("file");

            if(file.empty) {
                flash.message = "Debe seleccionar un archivo."
                redirect (controller:'usuario', action:'addPhoto')
            } else {
                def multimediaInstance = new Multimedia()
                multimediaInstance.filename = file.originalFilename
                multimediaInstance.fullpath = request.getSession().getServletContext().getRealPath("") + "/.." + grailsApplication.config.uploadFolder + multimediaInstance.filename
                multimediaInstance.subido = new Date()
                multimediaInstance.tipo = params.tipo
                Usuario user = (Usuario) springSecurityService.currentUser
                multimediaInstance.usuario = user
                file.transferTo(new File(multimediaInstance.fullpath))
                multimediaInstance.save()
                if (params.tipo == 'fotoPerfil')
                    redirect (controller:'usuario', action:'ficha')
                else
                    redirect (controller:'usuario', action:'addPhoto')
            }
        }
    }

    def download(long id) {
        Multimedia multimediaInstance = Multimedia.get(id)
        if ( multimediaInstance == null) {
            flash.message = "Document not found."
            redirect (action:'list')
        } else {
            response.setContentType("APPLICATION/OCTET-STREAM")
            response.setHeader("Content-Disposition", "Attachment;Filename=\"${multimediaInstance.filename}\"")
            def file = new File(multimediaInstance.fullpath)
            def fileInputStream = new FileInputStream(file)
            def outputStream = response.getOutputStream()
            byte[] buffer = new byte[4096];
            int len;
            while ((len = fileInputStream.read(buffer)) > 0) {
                outputStream.write(buffer, 0, len);
            }
            outputStream.flush()
            outputStream.close()
            fileInputStream.close()
        }
    }

    def show(Multimedia multimediaInstance) {
        respond multimediaInstance
    }

    def create() {
        System.out.println("SADFASFASDF: " + request.getSession().getServletContext().getRealPath(""))
        respond new Multimedia(params)
    }

    @Transactional
    def save(Multimedia multimediaInstance) {
        if (multimediaInstance == null) {
            notFound()
            return
        }

        if (multimediaInstance.hasErrors()) {
            respond multimediaInstance.errors, view: 'create'
            return
        }

        multimediaInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'multimedia.label', default: 'Multimedia'), multimediaInstance.id])
                redirect multimediaInstance
            }
            '*' { respond multimediaInstance, [status: CREATED] }
        }
    }

    def edit(Multimedia multimediaInstance) {
        respond multimediaInstance
    }

    @Transactional
    def update(Multimedia multimediaInstance) {
        if (multimediaInstance == null) {
            notFound()
            return
        }

        if (multimediaInstance.hasErrors()) {
            respond multimediaInstance.errors, view: 'edit'
            return
        }

        multimediaInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Multimedia.label', default: 'Multimedia'), multimediaInstance.id])
                redirect multimediaInstance
            }
            '*' { respond multimediaInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Multimedia multimediaInstance) {

        if (multimediaInstance == null) {
            notFound()
            return
        }

        multimediaInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Multimedia.label', default: 'Multimedia'), multimediaInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'multimedia.label', default: 'Multimedia'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
