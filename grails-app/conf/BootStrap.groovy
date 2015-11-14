import proyecto.fisw.*


class BootStrap {

    def init = { servletContext ->
        def adminRol = new Rol_S("ROLE_ADMIN").save(failOnError: true)
        def userRol = new Rol_S("ROLE_USER").save(failOnError: true)
        def directorRol = new Rol_S("ROLE_DIRECTOR").save(failOnError: true)

        def usuarioAdmin = new User("admin", "admin").save(failOnError: true)
        def usuarioUser = new User("user", "user").save(failOnError: true)
        def usuarioDirector = new User("director", "director").save(failOnError: true)

        UserRol_S.create usuarioUser,userRol,true
        UserRol_S.create usuarioAdmin,adminRol,true
        UserRol_S.create usuarioDirector,directorRol,true

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
        if (Rol_Lab.list().size()==0) {
            estudianteRol_Lab = new Rol_Lab("Estudiante").save(failOnError: true)
            profesorRol_Lab = new Rol_Lab("Profesor").save(failOnError: true)
        }
        else {
            estudianteRol_Lab = Rol_Lab.findByNombre("Estudiante")
            profesorRol_Lab = Rol_Lab.findByNombre("Profesor")
        }

        def usuarioTest = new Usuario("test", "test", "test", quimicaArea, estudianteRol_Lab).save(failOnError: true)
        def usuarioFelipe = new Usuario("felipe", "felipe", "felipe", biologiaArea, estudianteRol_Lab).save(failOnError: true)

        UserRol_S.create usuarioTest,userRol,true
        UserRol_S.create usuarioFelipe,userRol,true
    }
    def destroy = {
    }
}
