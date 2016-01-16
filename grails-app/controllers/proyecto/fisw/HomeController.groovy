package proyecto.fisw

import grails.plugin.springsecurity.annotation.Secured

@Secured(['IS_AUTHENTICATED_ANONYMOUSLY'])
class HomeController {

    def index() {
        render view: "home"
    }
}
