package proyecto.fisw

class Titulo {
    String nombre

    /*
     * tipo: indica el tipo de titulo
     * false: Pregrado
     * true: Postgrado
     */
    Boolean tipo

    static hasMany = [usuarioTitulo: UsuarioTitulo]

    static belongsTo = [institucion: Institucion]

    Titulo(String nombre, Institucion institucion, Boolean tipo) {
        this.nombre = nombre
        this.institucion = institucion
        this.tipo = tipo
    }

    static constraints = {
    }
}
