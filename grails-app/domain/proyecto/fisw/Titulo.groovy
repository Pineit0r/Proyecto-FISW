package proyecto.fisw

class Titulo {
    String titulo
    Boolean tipo

    static hasMany = [usuarioTitulo: UsuarioTitulo]

    static belongsTo = [institucion: Institucion]

    static constraints = {
    }
}
