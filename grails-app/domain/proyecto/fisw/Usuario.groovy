package proyecto.fisw

class Usuario extends User {
    String nombre
    RolLab rol_lab
    Area area

    static hasMany = [titulo: Titulo]

    static belongsTo = [user: User]

    Usuario(String correo, String password, String nombre, Area area, RolLab rol_lab) {
        super(correo, password)
        this.nombre = nombre
        this.rol_lab = rol_lab
        this.area = area
    }

    def attachUser() {
        super.attachUsuario(this)
    }

    static constraints = {
        nombre(blank: false)
    }
}
