package proyecto.fisw

class AvanceTesis {
    String ruta
    Date actualizacion

    static belongsTo = [tesis: Tesis]

    static hasMany = [comentarios: ComentarioAvanceTesis]

    static constraints = {
    }
}
