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

        if (springSecurityService.currentUser instanceof Usuario) {
            return [
                    usuario: springSecurityService.currentUser as Usuario
            ]
        } else {
            return [
                    usuario: springSecurityService.currentUser as User
            ]
        }
    }

    def editFicha() {
        render view: "editFicha"
    }
}
