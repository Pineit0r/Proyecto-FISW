<html>
	<head>
		<meta name="layout" content="main">
	</head>
	<body>
		<g:render template="/layouts/headerExterno"/>
		<div class="site-wrapper">
			<div class="site-wrapper-inner">
				<div class="formulario" id='login'>
					<div class='inner'>
						<div id="create-usuario" class="content scaffold-create" role="main">

							<g:if test="${flash.message}">
								<div class="login_message">${flash.message}</div>
							</g:if>
							<g:hasErrors bean="${usuarioInstance}">
								<ul class="errors" role="alert">
									<g:eachError bean="${usuarioInstance}" var="error">
										<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
									</g:eachError>
								</ul>
							</g:hasErrors>
							<g:form url="[resource:usuarioInstance, action:'save']" class="form-signin">
								<h2 class='form-signin-heading'>Registro</h2>
								<fieldset class="form">
				        	<g:render template="form"/>
								</fieldset>
								<fieldset class="buttons">
									<g:submitButton name="create" class="btn btn-lg  btn-block" value="Enviar solicitud" />
								</fieldset>
							</g:form>
						</div>
					</div>
				</div>
			</div>
		</div>
    </body>
</html>
