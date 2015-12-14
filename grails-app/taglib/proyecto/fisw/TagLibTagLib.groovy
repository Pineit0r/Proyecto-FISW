package proyecto.fisw

class TagLibTagLib {
    def springSecurityService

    static defaultEncodeAs = [taglib:'html']
    //static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]

    def getUserName = { attrs, body ->
        out << ((Usuario) springSecurityService.currentUser).nombre.capitalize()
    }

}
