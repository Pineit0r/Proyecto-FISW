package proyecto.fisw

class TagLibTagLib {
    def springSecurityService

    static defaultEncodeAs = [taglib:'html']
    //static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]

    def getUserName = { attrs, body ->
        if (springSecurityService.currentUser instanceof Usuario) {
            out << ((Usuario) springSecurityService.currentUser).getFullName()
        } else {
            out << ((User) springSecurityService.currentUser).username
        }
    }

    def getRole = { attrs, body ->
        def role = springSecurityService.getPrincipal().getAuthorities()
        if (role.first().getAuthority()=="ROLE_USER")
            out << "Usuario de Laboratorio"
        else if (role.first().getAuthority()=="ROLE_ADMIN")
            out << "Administrador"
        else
            out << "Director"
    }

    def getPhoto = { attrs, body ->
            Usuario user = (Usuario) springSecurityService.currentUser
            def photo = Multimedia.findAllWhere(usuario: user, tipo: "fotoPerfil")
            photo.sort{a,b-> b.subido<=>a.subido}
            if (!photo.empty)
                out << photo.first().filename
            else
                out << "default_user.png"
    }

}
