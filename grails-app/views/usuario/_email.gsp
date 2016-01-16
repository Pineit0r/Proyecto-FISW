<%--
  Created by IntelliJ IDEA.
  User: tataf
  Date: 16-12-2015
  Time: 1:34
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
</head>

<body>
    <h2>Solicitud pendiente</h2>

    Estimado:</br></br>
    Un nuevo usuario ha enviado solicitud para unirse a la comunidad web.
    <p>Nombre usuario: <em>${usuario.nombres.capitalize()} ${usuario.apellidos.capitalize()}</em></br>
    Correo: <em>${usuario.username}</em></p>

    Ingrese a <a href="localhost:8080/Proyecto-FISW">www.localhost:8080/Proyecto-FISW</a> y confirme solicitud.</br>
    Si no desea aceptar la solicitud, solo ignore este mail.
    </br></br>
    Grupo 3 FISW.



</body>
</html>