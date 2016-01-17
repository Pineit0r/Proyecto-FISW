<%--
  Created by IntelliJ IDEA.
  User: FelipeFernandez
  Date: 12-12-15
  Time: 9:56
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
                <div class="centrado">
                    <div class="row">
                        <div class="col-md-4 col-md-offset-1">
                            <ol class="breadcrumb">
                                <li><g:link controller="intranet" action="index" style="color: #0f0f0f">Intranet</g:link></li>
                                <li><g:link controller="usuario" action="ficha" style="color: #0f0f0f">Ficha personal</g:link></li>
                                <li class="active">Editar ficha</li>
                            </ol>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-8 col-md-offset-2">
                            <div class="panel panel-success">
                                <div class="panel-heading">
                                    <h1 class='panel-title' style="font-size: 40px">Editar Ficha</h1>
                                </div>
                                <fieldset class="form">
                                    <div class="panel-body">
                                        <g:if test='${flash.message}'>
                                                <div class="alert alert-danger" role="alert">
                                                    <button type="button" class="close" data-dismiss="alert">&times;</button>${flash.message}
                                                </div>
                                        </g:if>
                                        <g:form url="[resource:usuarioInstance, action:'updateFicha']" method="PUT">
                                            <g:render template="editForm"/>
                                            <div class="form-group">
                                                <g:actionSubmit class="btn btn-success" action="updateFicha" value="Actualizar" />
                                            </div>
                                        </g:form>
                                    </div>
                                </fieldset>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <hr>
        <div class="centrado"
            <g:render template="/layouts/footer"/>
        </div>
    </body>
</html>