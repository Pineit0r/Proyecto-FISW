package proyecto.fisw

class Pais {
    static hasMany = [ciudades: Ciudad, instituciones: Institucion]
    String pais

    static constraints = {
    }
}
