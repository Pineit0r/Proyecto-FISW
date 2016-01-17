<%--
  Created by IntelliJ IDEA.
  User: FelipeFernandez
  Date: 12-11-15
  Time: 9:56
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html xmlns="http://www.w3.org/1999/html">
    <head>
        <meta name="layout" content="main"/>
    </head>
    <body>

        <g:render template="/layouts/headerExterno"/>
        <div class="site-wrapper" id="portada">
            <div class="site-wrapper-inner">
                <div class="centrado">
                    <div class="cover-container">
                        <div class="inner cover">
                            <h1 class="cover-heading">Laboratorio de Microbiología Molecular y Biotecnología Ambiental</h1>
                            <hr>
                            <h4 style="color: #363636">Si eres parte del laboratorio y no tienes cuenta</h4>
                            <p class="lead">
                                <g:link controller="usuario" action="create" class="btn btn-lg btn-registro">¡Regístrate!</g:link>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Seccion Descripciones -->
        <div class="container-fluid" id="fondo_gris">
            <div class="centrado" id="portada">
                <h1>Nuestro Equipo</h1>
                <div class="row">
                    <g:img class="img-rounded" dir="images" file="equipo.jpg" height="350" width="1000"></g:img>
                    </br>
                    </br>
                    <div class="col-md-6 col-md-offset-3">
                        <p class="lead">
                            Mas de 30 personas conforman el laboratorio entre profesores y alumnos tanto de pregrado y postgrado.
                        </p>

                    </div>
                </div>

                    <hr class="featurette-divider">
                    </br>
                    </br>
                <div class="footer">
                    <g:render template="/layouts/footer"/>
                </div>
            </div>
        </div>
    </body>
</html>
