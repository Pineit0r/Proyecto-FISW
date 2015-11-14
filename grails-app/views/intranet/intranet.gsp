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
    <title><g:message code="dashboard.header" default="Welcome to Grails Webinar"/> </title>
    <style type="text/css" media="screen">
    #login {
        margin: 15px 0px;
        padding: 0px;
        text-align: center;
    }
    </style>
</head>
<body>
    <h2>Intranet</h2>
    <h3>Bienvenido
        <sec:ifLoggedIn>
            <sec:loggedInUserInfo field="username"/>
        </sec:ifLoggedIn>
        <sec:ifAllGranted roles="ROLE_ADMIN">
            <g:if test="${usuarioInstanceCount > 0}">
                <h1>Existen <g:link class="list" controller="usuario" action="indexPendiente">cuentas de usuarios</g:link> pendientes de verificación.</h1>
            </g:if>
        </sec:ifAllGranted>
    </h3>
</body>
</html>
