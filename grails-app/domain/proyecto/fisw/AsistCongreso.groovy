package proyecto.fisw

class AsistCongreso {
    static belongsTo = [usuario: Usuario, congreso: Congresos]

    static constraints = {
    }
}
