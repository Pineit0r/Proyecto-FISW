<%--
  Created by IntelliJ IDEA.
  User: FelipeFernandez
  Date: 12-11-15
  Time: 10:37
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
<h2>Dashboard Administrador</h2>
    <div class="nav" role="navigation">
        <ul>
            <li><g:link class="list" controller="usuario" action="index">Lista de Usuarios</g:link></li>
            <li><g:link class="list" controller="usuario" action="indexPendiente">Lista de Usuarios Pendientes</g:link></li>
        </ul>
    </div>
<g:if test="${usuarioInstanceCount > 0}">
    <div class='login_message'>Existen <g:link class="list" controller="usuario" action="indexPendiente">cuentas de usuarios</g:link> pendientes de verificación.</div>
</g:if>
</body>
</html>