package proyecto.fisw

class CargoProyecto {
    Usuario usuario
    Proyecto proyecto
    String cargo

    static constraints = {
        usuario unique: ["proyecto", "cargo"]
    }
}