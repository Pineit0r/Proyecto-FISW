package proyecto.fisw

class AsistCongreso {
    static belongsTo = [usuario: Usuario, congreso: Congreso]
    Multimedia poster

    static constraints = {
        poster nullable: true, blank: true
    }
}
