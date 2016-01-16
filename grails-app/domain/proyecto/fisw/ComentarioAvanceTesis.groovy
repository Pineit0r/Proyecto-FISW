package proyecto.fisw

class ComentarioAvanceTesis {
    String comentario

    static belongsTo = [autor: Usuario]

    static constraints = {
    }
}
