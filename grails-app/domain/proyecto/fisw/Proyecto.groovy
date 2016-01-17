package proyecto.fisw

class Proyecto {
    String nombre
    String inicio
    String fin
    String otro

    static hasMany = [areas: ProyectoArea]

    static constraints = {
    }
}
