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
    <div class="fixed-navbar-content">
        <div class="site-wrapper">
            <div class="centrado">

                <div class="container">
                    <div class="jumbotron">
                        <div class="row">
                            <div class="panel panel-success">
                                <div class="panel-heading">
                                    <h1 class="panel-title" style="font-size: 40px">Intranet</h1>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="well">
                                    <h3>Bienvenido <g:getRole /></h3>
                                    <g:getUserName />
                                    <sec:ifAllGranted roles="ROLE_ADMIN">
                                        <g:if test="${usuarioInstanceCount > 0}">
                                            <h1>Existen <g:link class="list" controller="usuario" action="indexPendiente">
                                                cuentas de usuarios</g:link> pendientes de verificación.
                                            </h1>
                                        </g:if>
                                    </sec:ifAllGranted>
                                    <sec:ifAllGranted roles="ROLE_DIRECTOR">
                                            <p><g:link class="btn btn-success" controller="evento" action="create">Crear Nuevo Evento</g:link></p>
                                    </sec:ifAllGranted>
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
                            </div>
                        </div>
                </div>
            </div>
            </div>
        </div>
    </div>
</body>
</html>


