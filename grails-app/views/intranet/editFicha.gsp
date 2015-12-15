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
            <h2>Editar Ficha Personal</h2>
            <h3><g:getUserName /></h3>
            <g:render template="form"/>
        </div>
    </div>
</div>
</body>
</html>