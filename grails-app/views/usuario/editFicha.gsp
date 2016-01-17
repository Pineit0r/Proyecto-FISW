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
        <div class="fixed-navbar-content">
            <div class="site-wrapper">
                <div class="centrado">
                    <g:form url="[resource:usuarioInstance, action:'updateFicha']" class="form-signin" method="PUT"  style="max-width: 700px">
                        <div class="row">

                            <div class="panel panel-success">
                                <div class="panel-heading">
                                    <h1 class='panel-title' style="font-size: 40px">Editar Ficha Personal</h1>
                                </div>

                                <fieldset class="form">
                                    <div class="panel-body">
                                        <h3><g:getUserName /></h3>
                                        <g:render template="editForm"/>
                                        <fieldset class="buttons">
                                            <g:actionSubmit class="btn btn-success" action="updateFicha" value="Aceptar" />
                                        </fieldset>
                                    </div>
                                </fieldset>
                            </div>


                        </div>
                    </g:form>
                </div>
            </div>
        </div>
    </body>
</html>