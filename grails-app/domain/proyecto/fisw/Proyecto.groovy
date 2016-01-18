package proyecto.fisw

class Proyecto {
    String nombre
    String inicio
    String fin
    String otro
    Usuario creador

    static hasMany = [areas: ProyectoArea, cargos: CargoProyecto]

    static constraints = {
    }
}
