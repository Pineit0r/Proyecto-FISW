package proyecto.fisw

import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN'])
class AdminController {

    def admin() {
        respond Usuario.list(params), model:[usuarioInstanceCount: Usuario.countByEnabled(false)]
    }
}
