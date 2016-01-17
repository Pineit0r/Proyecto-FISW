package proyecto.fisw
import org.apache.commons.lang.builder.HashCodeBuilder

class CargoProyecto implements Serializable {
    Usuario usuario
    Proyecto proyecto
    String cargo

    boolean equals(other) {
        if (!(other instanceof CargoProyecto)) {
            return false
        }
        other.usuario == usuario && other.proyecto == proyecto && other.cargo == cargo
    }

    int hashCode() {
        def builder = new HashCodeBuilder()
        builder.append usuario
        builder.append proyecto
        builder.append cargo
        builder.toHashCode()
    }

    static mapping = {
        id composite: ['usuario', 'proyecto', 'cargo']
    }

    static constraints = {
    }
}
