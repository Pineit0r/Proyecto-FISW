package proyecto.fisw

class Tesis {
    Usuario autor
    String nombre
    String ruta
    Date modificado // debe ser primaria
    Usuario tutor
    Usuario cotutor

    //static mapping = {
    //    id composite: ['usuario', 'modificado']
    //}

    static hasMany = [avances: AvanceTesis]
    static constraints = {
        // tutor puede ser nulo
        // cotutor igual
    }
}
