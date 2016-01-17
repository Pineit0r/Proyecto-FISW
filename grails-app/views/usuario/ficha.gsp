<%--
  Created by IntelliJ IDEA.
  User: FelipeFernandez
  Date: 12-12-15
  Time: 9:56
--%>
<%@ page import="proyecto.fisw.Usuario" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
    <head>
        <meta name="layout" content="main"/>
    </head>

    <body>
        <g:render template="/layouts/headerInterno"/>
        <div class="fixed-navbar-content">
            <div class="site-wrapper">
                <div class="centrado">
                    <div class="container">
                        </br>

                        <div class="jumbotron">
                            <div class="row">
                                <div class="panel panel-success">
                                    <div class="panel-heading">
                                        <h1 class="panel-title" style="font-size: 40px">Ficha Personal</h1>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <img src="/Proyecto-FISW/assets/<g:getPhoto />" width="140" height="140" class="img-circle">
                                    <h2><g:getUserName /></h2>
                                    <p><g:getRole /></p>
                                    <p><g:link class="btn btn-block btn-primary" controller="usuario" action="editFicha">Editar Ficha Personal</g:link></p>
                                    <p><g:link class="btn btn-block btn-primary" controller="usuario" action="addPhoto">Añadir Foto</g:link></p>
                                </div>

                                <div class="col-md-6">
                                    <div class="well">
                                        <p><span class="label label-success">Cargo en el Laboratorio:</span>
                                            ${usuarioInstance?.rol_lab?.nombre}</p>

                                        <p><span class="label label-success">Área de investigación:</span>
                                            ${usuarioInstance?.area?.nombre}</p>

                                        <p><span class="label label-success">Estudios de Pregrado:</span>
                                        <g:if test="${tituloPregradoInstance != null}">
                                            ${tituloPregradoInstance?.nombre}, ${tituloPregradoInstance?.institucion?.nombre}, ${tituloPregradoInstance?.institucion?.pais?.nombre}</p>
                                        </g:if>
                                        <g:else>
                                            -</p>
                                        </g:else>
                                        <g:if test="${tituloPostgradoInstance != null}">
                                        <p><span class="label label-success">Estudios de Postgrado:</span>

                                            ${tituloPostgradoInstance?.nombre}, ${tituloPostgradoInstance?.institucion?.nombre}, ${tituloPostgradoInstance?.institucion?.pais?.nombre}</p>
                                        </g:if>
                                        <g:if test="${!usuarioInstance?.publicacionesLibro.empty}">
                                            <p><span class="label label-success">Publicaciones en Capítulos de Libros:</span>
                                            <g:each in="${usuarioInstance?.publicacionesLibro}">

                                                <p>${it.titulo}, ${it.autores}, ${it.anho}, ${it.ISBN}, ${it.editorial}</p>
                                            </g:each><p>
                                        </g:if>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr>
                    <g:render template="/layouts/footer"/>
                </div>
            </div>
        </div>
    <br>
    </body>
</html>