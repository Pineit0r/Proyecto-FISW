package proyecto.fisw

class Titulo {
    String titulo
    Boolean tipo

    static belongsTo = [institucion: Institucion, usuario: Usuario]

    static constraints = {
    }
}
