package proyecto.fisw

import grails.plugin.springsecurity.annotation.Secured
import static org.springframework.http.HttpStatus.*

@Secured(['ROLE_ADMIN'])
class AdminController {

    def index() {
        respond Usuario.list(params), model:[usuarioInstanceCount: Usuario.countByEnabled(false)]
    }
}
