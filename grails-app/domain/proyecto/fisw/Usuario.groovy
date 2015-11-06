package proyecto.fisw

class Usuario {
    String correo
    String nombre

    static constraints = {
        correo(blank: false)
        nombre(blank: false)
    }
}
