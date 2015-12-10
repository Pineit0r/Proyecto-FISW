package proyecto.fisw

class Institucion {



    String nombre
    static hasMany = [titulos: Titulo, tesis: Tesis]
    static belongsTo = [pais:Pais]

    static constraints = {
    }
}
