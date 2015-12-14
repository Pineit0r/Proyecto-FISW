import proyecto.fisw.*


class BootStrap {

    def init = { servletContext ->
        def adminRol = new Rol("ROLE_ADMIN").save(failOnError: true)
        def userRol = new Rol("ROLE_USER").save(failOnError: true)
        def directorRol = new Rol("ROLE_DIRECTOR").save(failOnError: true)

        def usuarioAdmin = new User("admin@admin.cl", "admin").save(failOnError: true)
        def usuarioUser = new User("user@user.cl", "user").save(failOnError: true)
        def usuarioDirector = new User("director@director.cl", "director").save(failOnError: true)

        UserRol.create usuarioUser,userRol,true
        UserRol.create usuarioAdmin,adminRol,true
        UserRol.create usuarioDirector,directorRol,true

        def quimicaArea
        def biologiaArea
        if (Area.list().size()==0) {
            quimicaArea = new Area("Quimica").save(failOnError: true)
            biologiaArea = new Area("Biologia").save(failOnError: true)
        }
        else {
            quimicaArea = Area.findByNombre("Quimica")
            biologiaArea = Area.findByNombre("Biologia")
        }

        def estudianteRol_Lab
        def profesorRol_Lab
        if (RolLab.list().size()==0) {
            estudianteRol_Lab = new RolLab("Estudiante").save(failOnError: true)
            profesorRol_Lab = new RolLab("Profesor").save(failOnError: true)
        }
        else {
            estudianteRol_Lab = RolLab.findByNombre("Estudiante")
            profesorRol_Lab = RolLab.findByNombre("Profesor")
        }

        def usuarioTest = new Usuario("test@test.cl", "test", "test", quimicaArea, profesorRol_Lab).save(failOnError: true)
        def usuarioFelipe = new Usuario("felipe@felipe.cl", "felipe", "felipe", biologiaArea, estudianteRol_Lab).save(failOnError: true)

        UserRol.create usuarioTest,userRol,true
        UserRol.create usuarioFelipe,userRol,true
    }
    def destroy = {
    }
}
