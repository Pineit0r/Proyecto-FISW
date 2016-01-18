package proyecto.fisw

import grails.plugin.springsecurity.annotation.Secured
//import grails.plugin.springsecurity.SpringSecurityService

@Secured(['IS_AUTHENTICATED_FULLY'])
class IntranetController {
    def springSecurityService

    def index() {
        Usuario user = (Usuario) springSecurityService.currentUser
        respond Usuario.list(params), model:[usuarioInstanceCount: Usuario.countByEnabled(false), reporteInstanceCount: Reporte.findAllByUsuarioAndVisto(user, false).size()]
    }
}
