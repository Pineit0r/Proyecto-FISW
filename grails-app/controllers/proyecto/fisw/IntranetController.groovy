package proyecto.fisw

import grails.plugin.springsecurity.annotation.Secured
import grails.plugin.springsecurity.SpringSecurityService

@Secured(['IS_AUTHENTICATED_FULLY'])
class IntranetController {

    def intranet() {
        respond Usuario.list(params), model:[usuarioInstanceCount: Usuario.countByEnabled(false)]
    }

}
