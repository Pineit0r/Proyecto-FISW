package proyecto.fisw

class Reporte {
    String reporte
    Date creado
    Boolean visto

    static belongsTo = [director: Usuario, usuario: Usuario]

    static constraints = {
    }
}
