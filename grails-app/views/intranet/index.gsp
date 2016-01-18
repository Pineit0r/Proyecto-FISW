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

                    <div class="col-md-5">
                        <div class="well">

                            <sec:ifAnyGranted roles="ROLE_DIRECTOR">
                                <ul class="nav nav-pills nav-stacked">
                                    <g:if test="${usuarioInstanceCount == 0}">
                                        <li class="disabled"><a href="#">Solicitudes pendientes<span class="badge">${usuarioInstanceCount}</span></a></li>
                                    </g:if>
                                    <g:else>
                                        <li class="active"><g:link style="color: white" class="list" controller="usuario" action="indexPendiente" >Solicitudes pendientes <span class="badge">${usuarioInstanceCount}</span></g:link></li>
                                    </g:else>
                                    <li><g:link  controller="usuario" action="index"><span class="glyphicon glyphicon-th-list"></span> Lista de Usuarios</g:link></li>
                                    <hr>

                                    <li><g:link controller="publicacionLibro" action="create"><span class="glyphicon glyphicon-plus"></span> Publicación de Capitulos de Libro</g:link></li>

                                </ul>
                                <hr>

                                <ul class="nav nav-pills nav-justified">
                                    <li><g:link controller="evento" action="create"><span class="glyphicon glyphicon-plus"></span> Nuevo Evento</g:link></li>
                                    <li><g:link controller="congreso" action="create"><span class="glyphicon glyphicon-plus"></span> Agregar Congreso</g:link></li>

                                    <hr>

                                    <li><g:link controller="asistCongreso" action="create"><span class="glyphicon glyphicon-edit"></span> Registrar asistencia a congreso</g:link></li>
                                    <li><g:link controller="asistCongreso" action="index"><span class="glyphicon glyphicon-time"></span> Mis asistencias</g:link></li>
                                </ul>

                                <ul class="nav nav-pills nav-justified">
                                    <li><g:link controller="proyecto" action="create"><span class="glyphicon glyphicon-plus"></span> Nuevo Proyecto</g:link></li>
                                <li><g:link controller="proyecto" action="index"><span class="glyphicon glyphicon-th-list"></span>  Proyectos</g:link></li>
                                </ul>

                                <ul class="nav nav-pills nav-justified">
                                    <li><g:link controller="reporte" action="create"><span class="glyphicon glyphicon-plus"></span> Nuevo Reporte</g:link></li>
                                </ul>
                            </sec:ifAnyGranted>


                            <sec:ifAnyGranted roles="ROLE_USER">
                                <ul class="nav nav-pills nav-stacked">
                                    <g:if test="${reporteInstanceCount != 0}">
                                        <li class="active"><g:link style="color: white" class="list" controller="reporte" action="index" >Reportes recibidos <span class="badge">${reporteInstanceCount}</span></g:link></li>
                                    </g:if>
                                    <g:else>
                                        <li><g:link class="list" controller="reporte" action="index" ><span class="glyphicon glyphicon-th-list"></span> Reportes recibidos</g:link></li>
                                    </g:else>
                                    <li><g:link controller="publicacionLibro" action="create"><span class="glyphicon glyphicon-plus"></span> Publicación de Capitulos de Libro</g:link></li>

                                </ul>
                                <hr>
                                <ul class="nav nav-pills nav-justified">
                                    <li><g:link controller="asistCongreso" action="create"><span class="glyphicon glyphicon-edit"></span> Registrar asistencia a congreso</g:link></li>
                                    <li><g:link controller="asistCongreso" action="index"><span class="glyphicon glyphicon-time"></span> Mis asistencias</g:link></li>
                                </ul>

                                <ul class="nav nav-pills nav-justified">
                                    <li><g:link controller="proyecto" action="create"><span class="glyphicon glyphicon-plus"></span> Nuevo Proyecto</g:link></li>
                                    <li><g:link controller="proyecto" action="index"><span class="glyphicon glyphicon-th-list"></span>  Proyectos</g:link></li>
                                </ul>
                            </sec:ifAnyGranted>


                            <sec:ifAnyGranted roles="ROLE_ADMIN">
                                <ul class="nav nav-pills nav-stacked">
                                    <g:if test="${usuarioInstanceCount == 0}">
                                        <li class="disabled"><a href="#">Solicitudes pendientes<span class="badge">${usuarioInstanceCount}</span></a></li>
                                    </g:if>
                                    <g:else>
                                        <li class="active" ><g:link class="list" controller="usuario" style="color: white" action="indexPendiente" >Solicitudes pendientes <span class="badge">${usuarioInstanceCount}</span></g:link></li>
                                    </g:else>
                                    <li><g:link  controller="usuario" action="index"><span class="glyphicon glyphicon-th-list"></span> Lista de Usuarios</g:link></li>
                                </ul>
                                <hr>

                                <ul class="nav nav-pills nav-justified">
                                    <li><g:link controller="evento" action="create"><span class="glyphicon glyphicon-plus"></span> Nuevo Evento</g:link></li>
                                    <li><g:link controller="congreso" action="create"><span class="glyphicon glyphicon-plus"></span> Agregar Congreso</g:link></li>

                                </ul>
                            </sec:ifAnyGranted>
                        </div>
                    </div>

                    <div class="col-md-7">
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <h3 style="text-align: center">Próximos Eventos</h3>
                            </div>
                            <div class="panel-body">
                            <g:if test="${proyecto.fisw.Evento.findAllByFechaGreaterThan(new Date()).size() != 0}">
                                <table class='table table-condensed'>
                                    <thead>
                                        <tr>
                                            <th>Nombre</th>
                                            <th>Fecha</th>
                                            <th>Lugar</th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <g:each in="${proyecto.fisw.Evento.findAllByFechaGreaterThan(new Date()).sort {it.fecha}}" var="evento" status="i">
                                            <tr>
                                                <td>${evento.nombre}</td>
                                                <td>${evento.fecha.getTimeString()}  ${evento.fecha.getDateString()}</td>
                                                <td>${evento.lugar}</td>
                                                <td><g:link class="btn btn-success btn-xs" action="show" controller="evento" id="${evento.id}"><span class="glyphicon glyphicon-eye-open"></span> Ver</g:link></td>
                                            </tr>
                                        </g:each>
                                    </tbody>

                                </table>
                            </g:if>
                            <g:else>
                                <h4>No hay próximos eventos</h4>
                            </g:else>
                                </div>
                        </div>
                    </div>


                    <div class="col-md-7">
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <h3 style="text-align: center">Próximos Congresos</h3>
                            </div>
                            <div class="panel-body">

                                    <g:if test="${proyecto.fisw.Congreso.findAllByFechaGreaterThan(new Date()).size() != 0}">
                                        <table class='table table-condensed'>
                                            <thead>
                                                <tr>
                                                    <th>Nombre</th>
                                                    <th>Fecha</th>
                                                    <th>Ciudad, País</th>
                                                    <th></th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            <g:each in="${proyecto.fisw.Congreso.findAllByFechaGreaterThan(new Date()).sort {it.fecha}}" var="congreso">
                                                <tr>
                                                    <td>${congreso.nombre}</td>
                                                    <td>${congreso.fecha.getDateString()}</td>
                                                    <td>${congreso.ciudad.ciudad}, ${congreso.ciudad.pais.nombre}</td>
                                                    <td><g:link class="btn btn-success btn-xs" action="show" controller="congreso" id="${congreso.id}"><span class="glyphicon glyphicon-eye-open"></span> Ver</g:link></td>
                                                </tr>
                                            </g:each>
                                            </tbody>
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
        <hr>
        <div class="centrado"
            <g:render template="/layouts/footer"/>
        </div>
        <br>
    </body>
</html>


