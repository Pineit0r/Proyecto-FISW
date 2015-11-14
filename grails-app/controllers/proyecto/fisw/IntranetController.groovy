package proyecto.fisw

import grails.plugin.springsecurity.annotation.Secured

@Secured(['IS_AUTHENTICATED_FULLY'])
class IntranetController {

    def intranet() {
        respond Usuario.list(params), model:[usuarioInstanceCount: Usuario.countByEnabled(false)]
    }
}
