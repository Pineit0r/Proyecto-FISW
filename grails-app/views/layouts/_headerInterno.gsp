<html>
    <head>
    </head>

    <body>
        <nav class="navbar navbar-default navbar-fixed-top">
            <div class="container">

                <div class="navbar-header">
                    <g:link class="navbar-brand" controller="home" action="index">Labmmba</g:link>
                </div>
                <div id="navbar" class="navbar-collapse collapse">
                    <ul class="nav navbar-nav navbar-left">

                        <sec:ifLoggedIn>
                            <li class="active"><g:link controller="intranet">Intranet</g:link></li>
                        </sec:ifLoggedIn>

                        <sec:ifAnyGranted roles="ROLE_ADMIN">
                            <li><g:link controller="admin">Menú</g:link></li>
                        </sec:ifAnyGranted>

                        <sec:ifAnyGranted roles="ROLE_USER">
                            <li><g:link controller="home" href="#">Menú</g:link></li> <!-- Corregir -->
                        </sec:ifAnyGranted>

                        <sec:ifAnyGranted roles="ROLE_DIRECTOR">
                            <li><g:link controller="director">Menú</g:link></li>
                        </sec:ifAnyGranted>

                    </ul>

                    <ul class="nav navbar-nav navbar-right">
                        <sec:ifLoggedIn>
                            <li>
                                <p class="navbar-text ">Bienvenido <g:getUserName />
                                    <sec:ifAnyGranted roles="ROLE_USER">
                                        <span data-toggle="tooltip" data-placement="bottom" title="Autorizado" class="glyphicon glyphicon-ok-sign"></span>
                                    </sec:ifAnyGranted>
                                </p>
                            </li>

                            <li class="dropdown">

                                <g:img class="dropdown-toggle img-circle"  data-toggle="dropdown" dir="imagenes" id="user-image"  file="default_user.png" width="40" height="40"></g:img>

                                <ul class="dropdown-menu" role="menu">
                                    <li><g:link controller="intranet" action="ficha"><span class="glyphicon glyphicon-user"></span> Ficha Personal</g:link></li>
                                    <li role="separator" class="divider"></li>
                                    <li><g:link controller="logout"><span class="glyphicon glyphicon-off"></span> Cerrar sesión</g:link></li>
                                </ul>

                        </sec:ifLoggedIn>
                    </ul>
                </div>
            </div>
        </nav>
    </body>
</html>