package proyecto.fisw

class RolLab {
    String nombre

    static hasMany = [usuarios: Usuario]

    RolLab(String nombre) {
        this.nombre = nombre
    }

    static constraints = {
    }
}
