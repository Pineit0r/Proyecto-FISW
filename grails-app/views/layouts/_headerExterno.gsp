 <!-- Header que desaparece
    aplicado solo en home.gsp, en login.gsp y en registro.gsp
 -->

<html>
    <head>
    </head>

    <body>
        <div class="cover-container">
            <div class="masthead clearfix">
                <div class="inner">
                    <div class="noBackground">

                        <h3 class="masthead-brand"><g:link controller="home" action="index">Labmmba</g:link></h3>
                        <nav>
                            <ul class="nav masthead-nav">

                                <li class="active"><g:link controller="home" action="index"><span class="glyphicon glyphicon-home"></span> Inicio</g:link></li>
                                <sec:ifLoggedIn>
                                    <li><g:link controller="intranet">Intranet</g:link></li>
                                    <li><g:link controller="logout">Logout</g:link></li>
                                </sec:ifLoggedIn>
                                <sec:ifNotLoggedIn>
                                    <li><g:link controller="login"><span class="glyphicon glyphicon-log-in"></span> Iniciar sesión</g:link></li>
                                </sec:ifNotLoggedIn>

                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>