package proyecto.fisw

class Usuario {
    String correo
    String nombre
    Rol rol
    Rol_Lab rol_lab
    Area area

    static constraints = {
        correo(blank: false)
        nombre(blank: false)
    }
}
