package proyecto.fisw

class Publicacion {
    Usuario usuario
    String ruta
    String nombre

    static belongsTo = [area: Area]

    static constraints = {
    }
}
