package proyecto.fisw

class Evento {
    String nombre
    String descripcion
    String lugar
    Date fecha

    static belongsTo = [usuario: Usuario]

    static constraints = {
    }
}
