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
                                    <g:img dir="imagenes" file="default_user.png" width="140" height="140" class="img-circle"></g:img>
                                    <h2><g:getUserName /></h2>
                                    <p><g:getRole /></p>
                                    <p><g:link class="btn btn-lg btn-primary" controller="usuario" action="editFicha">Editar Ficha Personal</g:link></p>
                                </div>

                                <div class="col-md-6">
                                    <div class="well">
                                        <p><span class="label label-success">Cargo en el Laboratorio:</span>
                                        <g:if test="${usuarioInstance instanceof Usuario}">${usuarioInstance?.rol_lab?.nombre}</p>
                                        </g:if>
                                        <g:else>
                                            -</p>
                                        </g:else>

                                        <p><span class="label label-success">Área de investigación:</span>
                                        <g:if test="${usuarioInstance instanceof Usuario}">${usuarioInstance?.area?.nombre}</p>
                                        </g:if>
                                        <g:else>
                                            -</p>
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