package proyecto.fisw

class Usuario extends User {
    String nombre
    RolLab rol_lab
    Area area

    static hasMany = [titulo: Titulo]

    // username corresponde a correo
    Usuario(String username, String password, String nombre, Area area, RolLab rol_lab) {
        super(username, password)
        this.nombre = nombre
        this.rol_lab = rol_lab
        this.area = area
    }

    static constraints = {
        nombre(blank: false)
    }
}
