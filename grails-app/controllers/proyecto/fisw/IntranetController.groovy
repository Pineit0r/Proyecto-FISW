package proyecto.fisw

import grails.plugin.springsecurity.annotation.Secured
//import grails.plugin.springsecurity.SpringSecurityService

@Secured(['IS_AUTHENTICATED_FULLY'])
class IntranetController {
    def springSecurityService

    def index() {
        respond Usuario.list(params), model:[usuarioInstanceCount: Usuario.countByEnabled(false)]
    }

    def ficha() {
        User user = springSecurityService.currentUser
        Usuario usuario = user.usuario
        render usuario
    }

}
