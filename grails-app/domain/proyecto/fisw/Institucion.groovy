package proyecto.fisw

class Institucion {
    static hasMany = [titulos: Titulo, tesis: Tesis]
    def Pais pais
    static belongsTo = [Pais]
    String nombre

    static constraints = {
    }
}
