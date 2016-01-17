package proyecto.fisw

class Congreso {

    String nombre
    Date fecha
    static belongsTo = [ciudad: Ciudad]

    static constraints = {
    }

    Congreso(String n, Date f, Ciudad c) {
        nombre = n
        fecha = f
        ciudad = c
    }
}
