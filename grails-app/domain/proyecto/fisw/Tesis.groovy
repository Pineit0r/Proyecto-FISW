package proyecto.fisw

class Tesis {
    String nombre
    String ruta
    Date modificado

    static belongsTo = [usuario: Usuario]

    static constraints = {
    }
}
