package proyecto.fisw

class PublicacionRevistas {
    Usuario usuario
    String ruta
    String titulo
    String autores
    int anno
    String revista
    String keywords

    static belongsTo = [area: Area]

    static constraints = {
    }
}
