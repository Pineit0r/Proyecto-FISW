package proyecto.fisw

class Evento {
    String nombre
    Date fecha

    static belongsTo = [usuario: Usuario]

    static constraints = {
    }
}
