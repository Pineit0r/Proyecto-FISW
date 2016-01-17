package proyecto.fisw

class PublicacionLibro {
    Usuario usuario
    String anho
    String titulo
    String autores
    String ISBN
    String editorial // Posible tabla
    Multimedia pdf

    PublicacionLibro (Usuario usuario, String anho, String titulo, String autores, String ISBN, String editorial) {
        this.usuario = usuario
        this.anho = anho
        this.titulo = titulo
        this.autores = autores
        this.ISBN = ISBN
        this.editorial = editorial
    }

    static constraints = {
        pdf nullable: true, blank: true
        titulo(unique: true)
        ISBN(unique: true)
    }
}
