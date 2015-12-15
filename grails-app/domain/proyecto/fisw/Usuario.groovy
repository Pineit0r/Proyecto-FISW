package proyecto.fisw

class Usuario extends User {
    String nombres
    String apellidos
    RolLab rol_lab
    Area area

    static hasMany = [titulo: Titulo]

    static belongsTo = [user: User]

    Usuario(String correo, String password, String nombres, String apellidos, Area area, RolLab rol_lab) {
        super(correo, password)
        this.nombres = nombres
        this.apellidos = apellidos
        this.rol_lab = rol_lab
        this.area = area
    }

    def getFullName() {
        def nom = nombres.split("\\s+").collect { it.toLowerCase().capitalize() }.inject('') { accumulator, current -> accumulator + current + ' ' }.trim()
        def ape = apellidos.split("\\s+").collect { it.toLowerCase().capitalize() }.inject('') { accumulator, current -> accumulator + current + ' ' }.trim()
        return "${nom} ${ape}"
    }

    static constraints = {
    }
}
