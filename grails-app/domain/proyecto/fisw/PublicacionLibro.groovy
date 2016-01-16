package proyecto.fisw

class PublicacionLibro {
    Usuario usuario
    String ruta
    String anho
    String titulo
    String autores
    String ISBN
    String editorial // Posible tabla

    PublicacionLibro (Usuario usuario, String anho, String titulo, String autores, String ISBN, String editorial) {
        this.usuario = usuario
        this.anho = anho
        this.titulo = titulo
        this.autores = autores
        this.ISBN = ISBN
        this.editorial = Editorial
    }

    static constraints = {
        ruta nullable: true
    }
}
