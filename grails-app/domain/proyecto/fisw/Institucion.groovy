package proyecto.fisw

class Institucion {
    String nombre

    static hasMany = [titulos: Titulo, tesis: Tesis]
    static belongsTo = [pais:Pais]

    Institucion(String nombre, Pais pais) {
        this.nombre = nombre
        this.pais = pais
    }

    static constraints = {
    }
}
