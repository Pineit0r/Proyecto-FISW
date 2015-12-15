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
                        <g:form url="[resource:usuario, action:'editFicha']" class="form-signin" style="max-width: 500px">
                            <div class="row">
                                    <div class="panel panel-success">
                                        <div class="panel-heading">
                                            <h1 class='panel-title' style="font-size: 40px">Editar Ficha Personal</h1>
                                        </div>
                                            <fieldset class="form">
                                                <div class="panel-body">
                                                <h3><g:getUserName /></h3>
                                <g:render template="editForm"/>
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