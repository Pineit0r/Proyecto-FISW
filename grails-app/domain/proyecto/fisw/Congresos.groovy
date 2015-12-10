package proyecto.fisw

class Congresos {
    static belongsTo = [ciudad: Ciudad]

    String nombre
    String lugar
    Date fecha

    static constraints = {
    }
}
