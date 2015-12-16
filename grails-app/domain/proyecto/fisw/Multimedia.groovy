package proyecto.fisw

import grails.plugin.springsecurity.annotation.Secured

class Multimedia {
    Usuario usuario
    String filename
    String fullpath
    String tipo
    Date subido

    static constraints = {
        filename blank: false, nullable: false
        fullpath blank: false, nullable: false
    }
}
