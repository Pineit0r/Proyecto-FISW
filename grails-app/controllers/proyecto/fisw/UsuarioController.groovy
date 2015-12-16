package proyecto.fisw

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
@Secured(['IS_AUTHENTICATED_FULLY'])
class UsuarioController {
    def springSecurityService

    static allowedMethods = [save: "POST", update: "PUT", updateFicha: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Usuario.list(params), model:[usuarioInstanceCount: Usuario.count()]
    }

    def indexPendiente(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Usuario.findAllByEnabled(false), model:[usuarioInstanceCount: Usuario.countByEnabled(false)]
    }

    def show(Usuario usuarioInstance) {
        respond usuarioInstance
    }

    @Secured("IS_AUTHENTICATED_ANONYMOUSLY")
    def create() {
        respond new Usuario(params)
    }

    @Transactional
    @Secured("IS_AUTHENTICATED_ANONYMOUSLY")
    def save(Usuario usuarioInstance) {
        if (usuarioInstance == null) {
            notFound()
            return
        }

        if (usuarioInstance.hasErrors()) {
            respond usuarioInstance.errors, view:'create'
            return
        }
        usuarioInstance.enabled = false
        usuarioInstance.registroCompletado = false
        usuarioInstance.save flush:true

        Rol rol_admin = Rol.findByAuthority('ROLE_ADMIN')
        def admin = UserRol.findAllByRol(rol_admin)

        admin.each { administrador ->
            sendMail {
                to administrador.user
                subject "Autorización de Registro - Sistema Labmmba"
                html g.render(template:"email", model:[ usuario: usuarioInstance])
            }
        }

        Rol rol_director = Rol.findByAuthority('ROLE_DIRECTOR')
        def director = UserRol.findByRol(rol_director)

        sendMail {
            to director.user
            subject "Autorización de Registro - Sistema Labmmba"
            html g.render(template:"email", model:[ usuario: usuarioInstance])
        }



        Rol rol = Rol.find{authority == 'ROLE_USER'}
        UserRol.create usuarioInstance,rol,true
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'usuario.label', default: 'Usuario'), usuarioInstance.id])
                redirect usuarioInstance
            }
            '*' { respond usuarioInstance, [status: CREATED] }
        }
    }

    @Secured(['ROLE_ADMIN','ROLE_DIRECTOR'])
    def edit(Usuario usuarioInstance) {
        respond usuarioInstance
    }

    @Transactional
    @Secured(['ROLE_ADMIN','ROLE_DIRECTOR'])
    def update(Usuario usuarioInstance) {
        if (usuarioInstance == null) {
            notFound()
            return
        }

        if (usuarioInstance.hasErrors()) {
            respond usuarioInstance.errors, view:'edit'
            return
        }

        usuarioInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Usuario.label', default: 'Usuario'), usuarioInstance.id])
                redirect usuarioInstance
            }
            '*'{ respond usuarioInstance, [status: OK] }
        }
    }

    @Transactional
    @Secured(['IS_AUTHENTICATED_FULLY'])
    def updateFicha(Usuario usuarioInstance) {
        if (usuarioInstance == null) {
            notFound()
            return
        }

        Titulo titulo = Titulo.findByNombre(params.titulo.nombre)
        UsuarioTitulo usuarioTitulo = UsuarioTitulo.findOrSaveWhere(titulo: titulo, usuario: usuarioInstance)

        if (usuarioInstance.hasErrors()) {
            respond usuarioInstance.errors, view:'edit'
            return
        }

        usuarioInstance.save flush:true, failOnError: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Usuario.label', default: 'Usuario'), usuarioInstance.id])
                render view: "ficha", model: [usuarioInstance: usuarioInstance]//redirect usuarioInstance
            }
            '*'{ render view: "ficha" /*respond usuarioInstance, [status: OK]*/ }
        }
    }

    @Transactional
    @Secured(['ROLE_ADMIN','ROLE_DIRECTOR'])
    def delete(Usuario usuarioInstance) {

        if (usuarioInstance == null) {
            notFound()
            return
        }

        UserRol.findByUser(usuarioInstance).delete flush: true
        usuarioInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Usuario.label', default: 'Usuario'), usuarioInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'usuario.label', default: 'Usuario'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }

    def ficha() {
        if (!((Usuario) springSecurityService.currentUser).registroCompletado) {
            Usuario usuario = (Usuario) springSecurityService.currentUser
            render(view: "editFicha", model: [usuarioInstance: usuario])
        } else {
            return [
                    usuarioInstance: springSecurityService.currentUser as Usuario
            ]
        }
    }

    def editFicha() {

        Usuario usuario = (Usuario) springSecurityService.currentUser
        /*
        if (usuario.usuarioTitulo == null)
            Titulo titulo = new Titulo(params)
        */

        def usuarioTitulo = UsuarioTitulo.findAllByUsuario(usuario)

        Titulo titulo

        for (UsuarioTitulo u : usuarioTitulo) {
            if (u.titulo != null)
                if (!u.titulo.tipo) {
                    titulo = u.titulo
                    break
                }
        }

        return [usuarioInstance: usuario, tituloInstance: titulo]
    }
}
