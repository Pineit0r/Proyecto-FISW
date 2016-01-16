package proyecto.fisw

class Ciudad {

    String ciudad
    static hasMany = [congresos: Congreso]
    static belongsTo = [pais:Pais]
    static constraints = {
    }
}
