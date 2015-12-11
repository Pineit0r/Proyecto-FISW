<html>
    <head>

    </head>

    <body>
<!--<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <sec:ifAnyGranted roles="ROLE_ADMIN">
            <li><g:link controller="admin">Dashboard Administrador</g:link></li>
        </sec:ifAnyGranted>
        <sec:ifAnyGranted roles="ROLE_USER">
            <li><g:link controller="home">Dashboard Usuario</g:link></li>
        </sec:ifAnyGranted>
        <sec:ifAnyGranted roles="ROLE_DIRECTOR">
            <li><g:link controller="director">Dashboard Director</g:link></li>
        </sec:ifAnyGranted>
        <sec:ifLoggedIn>
            <li><g:link controller="intranet">Intranet</g:link></li>
            <li><g:link controller="logout">Logout</g:link></li>
        </sec:ifLoggedIn>
        <sec:ifNotLoggedIn>
            <li><g:link controller="login">Login</g:link></li>
            <li><g:link controller="usuario"action="create">Registrate</g:link></li>
        </sec:ifNotLoggedIn>
    </ul>
</div>
-->
<div class="cover-container">
    <div class="masthead clearfix">
        <div class="inner">
            <div class="noBackground">
                <h3 class="masthead-brand">Labmmba</h3>
                <nav>
                    <ul class="nav masthead-nav">

                        <li class="active"><g:link controller="home" action="index">Inicio</g:link></li>
                        <li><g:link controller="login">Login</g:link></li>

                    </ul>
                </nav>
            </div>
        </div>
    </div>
</div>
    </body>
</html>