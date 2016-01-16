package proyecto.fisw

class Area {
    String nombre

    static hasMany = [publicaciones: PublicacionRevistas]

    Area(String nombre) {
        this.nombre = nombre
    }

    static constraints = {
    }
}
