package proyecto.fisw

class UsuarioTitulo {
    Usuario usuario
    Titulo titulo

    static constraints = {
        usuario unique: ["titulo"]
    }
}
