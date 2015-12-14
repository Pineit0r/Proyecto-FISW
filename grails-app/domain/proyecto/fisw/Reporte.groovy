package proyecto.fisw

class Reporte {
    String reporte

    static belongsTo = [admin: Usuario, usuario: Usuario]

    static constraints = {
    }
}
