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
                <h2>Intranet</h2>
                <h3>Bienvenido</h3>
                <div class="container"
                    <sec:ifLoggedIn>
                        <sec:loggedInUserInfo field="username"/>
                    </sec:ifLoggedIn>
                    <sec:ifAllGranted roles="ROLE_ADMIN">
                        <g:if test="${usuarioInstanceCount > 0}">
                            <h1>Existen <g:link class="list" controller="usuario" action="indexPendiente">cuentas de usuarios</g:link> pendientes de verificación.</h1>
                        </g:if>
                    </sec:ifAllGranted>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
