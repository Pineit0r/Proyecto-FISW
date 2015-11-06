package proyecto.fisw

class Multimedia {
    String ruta
    String tipo

    static belongsTo = [usuario: Usuario]

    static constraints = {
    }
}
