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
                            <li><p class="navbar-text ">Bienvenido <g:getUserName /> </p></li>
                            <li><g:link controller="intranet" action="ficha">Ficha Personal</g:link></li>
                            <li><g:link controller="logout">Cerrar sesión</g:link></li>
                        </sec:ifLoggedIn>
                    </ul>
                </div>
            </div>
        </nav>
    </body>
</html>