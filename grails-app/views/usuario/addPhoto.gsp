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
                    <g:uploadForm action="upload" controller="multimedia" style="max-width: 400px; margin-left: auto; margin-right: auto">
                        <div class="row">
                           <div class="panel panel-success">
                               <div class="panel-heading">
                                   <h1 class='panel-title' style="font-size: 40px">Añadir foto personal</h1>
                               </div>
                                <fieldset class="form">
                                    <div class="panel-body">
                                        <g:if test='${flash.message}'>
                                            <div class="alert alert-danger" role="alert">
                                                <button type="button" class="close" data-dismiss="alert">&times;</button>${flash.message}
                                            </div>
                                        </g:if>
                                      <div class="well">
                                    <input type="file" name="file" />
                                    <input name="tipo" value="fotoPerfil" hidden>
                                </fieldset>
                                      <fieldset class="buttons">
                                        <g:submitButton name="upload" class="btn btn-success" value="Subir Foto" />
                                      </fieldset>
                                      <p></p>
                                  </div>
                                  </div>
                           </div>
                        </div>
                    </g:uploadForm>
                </div>
            </div>
        </div>
    </body>
</html>