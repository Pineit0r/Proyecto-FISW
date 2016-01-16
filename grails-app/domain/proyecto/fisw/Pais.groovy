package proyecto.fisw

class Pais {
    static hasMany = [ciudades: Ciudad, instituciones: Institucion]
    String nombre

    Pais(String nombre) {
        this.nombre = nombre
    }

    static constraints = {
    }
}
