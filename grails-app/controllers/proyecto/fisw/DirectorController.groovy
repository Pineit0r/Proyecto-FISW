package proyecto.fisw

import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_DIRECTOR'])
class DirectorController {

    def director() {
        respond Usuario.list(params), model:[usuarioInstanceCount: Usuario.countByEnabled(false)]
    }
}
