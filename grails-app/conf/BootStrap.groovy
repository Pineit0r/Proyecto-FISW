import proyecto.fisw.*


class BootStrap {

    def init = { servletContext ->

        def adminRol = new Rol("ROLE_ADMIN").save(failOnError: true)
        def userRol = new Rol("ROLE_USER").save(failOnError: true)
        def directorRol = new Rol("ROLE_DIRECTOR").save(failOnError: true)

        def chile = new Pais("Chile").save(failOnError: true)
        def alemania = new Pais("Alemania").save(failOnError: true)

        def Valpo = new Ciudad("Valparaíso", chile).save(failOnError: true)
        def Berlin = new Ciudad("Berlin", alemania).save(failOnError: true)
        def santiago = new Ciudad("Santiago",chile).save(failOnError: true)

        def clca = new Congreso("Congreso Latinoamericano de Ciencias Ambientales", new Date().parse('yyyy-MM-dd','2016-09-01'), Berlin).save(failOnError: true)
        def encq = new Congreso("Encuentro Nacional de Ciencias Químicas", new Date().parse('yyyy-MM-dd','2016-05-12'), Valpo).save(failOnError: true)

        def usm = new Institucion("USM", chile).save(failOnError: true)
        def pucv = new Institucion("PUCV", chile).save(failOnError: true)
        def uc = new Institucion("UC",chile).save(failOnError: true)

        new Titulo("Informática", usm, false).save(failOnError: true)
        new Titulo("Informática", pucv, true).save(failOnError: true)
        new Titulo("Industrial", usm, false).save(failOnError: true)
        new Titulo("Industrial", pucv, true).save(failOnError: true)
        new Titulo("Química", usm, true).save(failOnError: true)
        new Titulo("Química", usm, false).save(failOnError: true)
        new Titulo("Laboratorista",uc,false).save(failOnError: true)


        def biotechVegetalArea = Area.findOrSaveByNombre("Biotecnología vegetal")
        def compuestosArea = Area.findOrSaveByNombre("Compuestos bioactivos")
        def microbiologiaArea = Area.findOrSaveByNombre("Microbiología")
        def biotechAmbientArea = Area.findOrSaveByNombre("Biotecnología Ambiental")

        def estudiantePregradoRolLab = RolLab.findOrSaveByNombre("Estudiante de Pregrado")
        def estudiantePostgradoRolLab = RolLab.findOrSaveByNombre("Estudiante de Postgrado")
        def trabajadorRolLab = RolLab.findOrSaveByNombre("Trabajador")
        def jefeLaboratorioRolLab = RolLab.findOrSaveByNombre("Jefe de Laboratorio")
        def colaboradorRolLab = RolLab.findOrSaveByNombre("Colaborador")

        def usuario = new Usuario("felipe@felipe.cl", "felipe", "felipe", "fernández", compuestosArea, jefeLaboratorioRolLab).save(failOnError: true)
        def adminFelipeG= new Usuario("tatafel_8@hotmail.com","123","Felipe","Gonzalez", microbiologiaArea,trabajadorRolLab).save(failOnError: true)
        def adminFelipeF = new Usuario("felipefdezpino@gmail.com", "admin00", "Administrador", "", biotechVegetalArea, trabajadorRolLab).save(failOnError: true)
        def director = new Usuario("Director@director.cl","director","Juan","Pérez",biotechVegetalArea,trabajadorRolLab).save(failOnError: true)

        UserRol.create adminFelipeG,adminRol,true
        //UserRol.create adminFelipeF,adminRol,true
        UserRol.create usuario,userRol,true
        UserRol.create director,directorRol,true
    }
    def destroy = {
    }
}
