<%--
  Created by IntelliJ IDEA.
  User: FelipeFernandez
  Date: 12-11-15
  Time: 10:09
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
    <head>
        <meta name="layout" content="main"/>
    </head>
    <div>
<body>
    <g:render template="/layouts/headerInterno"/>

    <div class="container">
        <div class="alineacion">

            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h1 class="panel-title" style="font-size: 40px">Intranet</h1>
                        </div>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="well">
                        
                        <sec:ifAllGranted roles="ROLE_ADMIN">
                            <g:if test="${usuarioInstanceCount > 0}">
                                <h1>Existen <g:link class="list" controller="usuario" action="indexPendiente">
                                    cuentas de usuarios</g:link> pendientes de verificación.
                                </h1>
                            </g:if>
                        </sec:ifAllGranted>
                        <sec:ifAllGranted roles="ROLE_DIRECTOR">
                                        <p><div class="well">
                                            <g:link class="btn btn-xs btn-success" controller="evento" action="create">Crear Nuevo Evento</g:link>
                                            <g:link class="btn btn-xs btn-success" controller="congreso" action="create">Agregar Congreso</g:link>
                                            <g:link class="btn btn-xs btn-success" controller="usuario" action="index">Lista de Usuarios</g:link>
                                            <g:link class="btn btn-xs btn-success" controller="usuario" action="indexPendiente">Lista de Usuarios Pendientes</g:link>
                                    </div></p>
                                    </sec:ifAllGranted>
                                    <p><div class="well">
                                    <g:link class="btn btn-xs btn-success" controller="asistCongreso" action="create">Agregar Asistencia a Congreso</g:link>
                                    <g:link class="btn btn-xs btn-success" controller="publicacionLibro" action="create">Agregar Publicación de Capitulos de Libro</g:link>
                                </div></p>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="well">
                                    <h3>Lista de Próximos Eventos</h3>
                                    <g:if test="${proyecto.fisw.Evento.findAllByFechaGreaterThan(new Date()).size() != 0}">
                                    <table class='table table-striped'>
                                        <tr>
                                            <th>Nombre</th>
                                            <th>Fecha</th>
                                            <th>Lugar</th>
                                            <th>Ver</th>
                                        </tr>
                                        <g:each in="${proyecto.fisw.Evento.findAllByFechaGreaterThan(new Date())}" var="evento" status="i">
                                            <tr>
                                                <td>${evento.nombre}</td>
                                                <td>${evento.fecha.getTimeString()}  ${evento.fecha.getDateString()}</td>
                                                <td>${evento.lugar}</td>
                                                <td><g:link class="btn btn-success" action="show" controller="evento" id="${evento.id}">Ver</g:link></td>
                                            </tr>
                                        </g:each>
                                    </table>
                                    </g:if>
                                    <g:else>
                                        <h4>No hay próximos eventos</h4>
                                    </g:else>
                                </div>
                                <div class="well">
                                    <h3>Lista de Próximos Congresos</h3>
                                    <g:if test="${proyecto.fisw.Congreso.findAllByFechaGreaterThan(new Date()).size() != 0}">
                                        <table class='table table-striped'>
                                            <tr>
                                                <th>Nombre</th>
                                                <th>Fecha</th>
                                                <th>Ciudad, País</th>
                                                <th>Ver</th>
                                            </tr>
                                            <g:each in="${proyecto.fisw.Congreso.findAllByFechaGreaterThan(new Date())}" var="congreso">
                                                <tr>
                                                    <td>${congreso.nombre}</td>
                                                    <td>${congreso.fecha.getTimeString()}  ${congreso.fecha.getDateString()}</td>
                                                    <td>${congreso.ciudad.ciudad}, ${congreso.ciudad.pais.nombre}</td>
                                                    <td><g:link class="btn btn-success" action="show" controller="congreso" id="${congreso.id}">Ver</g:link></td>
                                                </tr>
                                            </g:each>
                                        </table>
                                    </g:if>
                                    <g:else>
                                        <h4>No hay próximos congresos</h4>
                                    </g:else>
                                </div>
                            </div>
                        </div>
                </div>
            </div>
            </div>

</body>
</html>


