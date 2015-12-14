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
<g:render template="/layouts/headerInterno" model="${pageScope.variables}"/>
<div class="fixed-navbar-content">
    <div class="site-wrapper">
        <div class="centrado">
            <h2>Ficha Personal</h2>
            <h3>${usuario.nombre.capitalize()}</h3>
        </div>
    </div>
</div>
</body>
</html>