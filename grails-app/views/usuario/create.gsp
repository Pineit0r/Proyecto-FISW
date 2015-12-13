<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
	</head>
	<body>
	<g:render template="/layouts/headerExterno"/>
	<div class="site-wrapper">
		<div class="site-wrapper-inner">
			<div class="container">
				<div class="row">
					<div class="col-md-4 col-md-offset-6">
						<div class="centrado">
							<div id="create-usuario" class="content scaffold-create" role="main">
								<h1>Registrarse</h1>
								<g:if test="${flash.message}">
									<div class="message" role="status">${flash.message}</div>
								</g:if>
								<g:hasErrors bean="${usuarioInstance}">
									<ul class="errors" role="alert">
										<g:eachError bean="${usuarioInstance}" var="error">
											<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
										</g:eachError>
									</ul>
								</g:hasErrors>
								<g:form url="[resource:usuarioInstance, action:'save']" >
									<fieldset class="form">
					        	<g:render template="form"/>
									</fieldset>
									<fieldset class="buttons">
										<g:submitButton name="create" class="btn btn-default" value="Enviar solicitud" />
									</fieldset>
								</g:form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
    </body>
</html>
