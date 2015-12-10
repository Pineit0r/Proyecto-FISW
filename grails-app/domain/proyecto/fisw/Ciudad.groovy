package proyecto.fisw

class Ciudad {
    static hasMany = [congresos: Congresos]
    def Pais pais
    static belongsTo = [Pais]
    String ciudad

    static constraints = {
    }
}
