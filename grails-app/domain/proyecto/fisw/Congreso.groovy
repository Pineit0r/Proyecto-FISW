package proyecto.fisw

class Congreso {

    String nombre
    String lugar
    Date fecha
    static belongsTo = [ciudad: Ciudad]

    static constraints = {
    }
}
