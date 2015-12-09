package proyecto.fisw

class Institucion {
    String nombre

    static hasMany = [titulos: Titulo]

    static constraints = {
    }
}
