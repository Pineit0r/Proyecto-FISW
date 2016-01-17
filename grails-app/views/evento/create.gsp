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
	<g:form url="[resource:eventoInstance, action:'save']" action="upload" controller="multimedia" style="max-width: 450px; margin-left: auto; margin-right: auto">
		<div class="row">
			<div class="panel panel-success">
				<div class="panel-heading">
					<h1 class='panel-title' style="font-size: 40px">Crear nuevo evento</h1>
				</div>
				<fieldset class="form">
					<div class="panel-body">
						<g:if test='${flash.message}'>
							<div class="alert alert-danger" role="alert">
								<button type="button" class="close" data-dismiss="alert">&times;</button>${flash.message}
							</div>
						</g:if>
						<div class="well">
							<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="btn btn-success" value="Crear Evento" />
				</fieldset>
				<p></p>
			</div>
		</div>
		</div>
     </div>
	</g:form>
</div>
</div>
</div>
</body>
</html>