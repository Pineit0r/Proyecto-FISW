package proyecto.fisw

class Area {
    String nombre

    static hasMany = [publicaciones: Publicacion]

    Area(String nombre) {
        this.nombre = nombre
    }

    static constraints = {
    }
}
