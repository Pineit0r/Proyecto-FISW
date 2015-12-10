package proyecto.fisw

class Tesis {
    def Institucion institucion
    static belongsTo = [Institucion]
    Usuario autor
    String nombre
    String ruta
    Date modificado // debe ser primaria
    Usuario tutor
    Usuario cotutor
    boolean tipo
    Multimedia pdf

    //static mapping = {
    //    id composite: ['usuario', 'modificado']
    //}

    static hasMany = [avances: AvanceTesis]
    static constraints = {
        // tutor puede ser nulo
        // cotutor igual
    }
}
