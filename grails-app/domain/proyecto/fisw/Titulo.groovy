package proyecto.fisw

class Titulo {
    String titulo
    Usuario usuario

    static belongsTo = [institucion: Institucion]

    static constraints = {
    }
}
