import proyecto.fisw.*


class BootStrap {

    def init = { servletContext ->
        def adminRol = new Rol("ROLE_ADMIN").save(failOnError: true)
        def userRol = new Rol("ROLE_USER").save(failOnError: true)
        def directorRol = new Rol("ROLE_DIRECTOR").save(failOnError: true)

        def chile = new Pais("Chile").save(failOnError: true)
        def francia = new Pais("Francia").save(failOnError: true)

        def usm = new Institucion("USM", chile).save(failOnError: true)
        def pucv = new Institucion("PUCV", chile).save(failOnError: true)
        def utc = new Institucion("UTC", francia).save(failOnError: true)

        def informatica = new Titulo("Informática", usm, false).save(failOnError: true)
        def industrial = new Titulo("Industrial", pucv, false).save(failOnError: true)
        def quimica = new Titulo("Química", utc, true).save(failOnError: true)

        def biotechVegetalArea = Area.findOrSaveByNombre("Biotecnología vegetal")
        def compuestosArea = Area.findOrSaveByNombre("Compuestos bioactivos")
        def microbiologiaArea = Area.findOrSaveByNombre("Microbiología")
        def biotechAmbientArea = Area.findOrSaveByNombre("Biotecnología Ambiental")

        def estudiantePregradoRolLab = RolLab.findOrSaveByNombre("Estudiante de Pregrado")
        def estudiantePostgradoRolLab = RolLab.findOrSaveByNombre("Estudiante de Postgrado")
        def trabajadorRolLab = RolLab.findOrSaveByNombre("Trabajador")
        def jefeLaboratorioRolLab = RolLab.findOrSaveByNombre("Jefe de Laboratorio")
        def colaboradorRolLab = RolLab.findOrSaveByNombre("Colaborador")

        def usuarioFelipe = new Usuario("felipe@felipe.cl", "felipe", "felipe", "fernández", compuestosArea, jefeLaboratorioRolLab).save(failOnError: true)
        def adminFelipe= new Usuario("tatafel_8@hotmail.com","123","Felipe","Gonzalez", microbiologiaArea,trabajadorRolLab).save(failOnError: true)
        def usuarioAdmin = new Usuario("felipefdezpino@gmail.com", "admin00", "Administrador", "Administrador", biotechVegetalArea, trabajadorRolLab).save(failOnError: true)

        UserRol.create adminFelipe,adminRol,true
        UserRol.create usuarioAdmin,adminRol,true
        UserRol.create usuarioFelipe,userRol,true
    }
    def destroy = {
    }
}
