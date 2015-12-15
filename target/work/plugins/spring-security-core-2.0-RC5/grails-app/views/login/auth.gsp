<html>
<head>
	<meta name='layout' content='main'/>
</head>

<body>
<g:render template="/layouts/headerExterno"/>
<div class="site-wrapper">
	<div class="site-wrapper-inner">
		<div class="formulario" id='login'>
			<div class='inner'>
				<form action='${postUrl}' method='POST' id='loginForm' class='form-signin' autocomplete='off'>
					<div class="panel panel-success">
						<div class="panel-heading">
							<h2 class='form-signin-heading'><g:message code="springSecurity.login.header"/></h2>
						</div>
						<div class="panel-body">

							<g:if test='${flash.message}'>
								<div class="alert alert-danger" role="alert">
									<div class='login_message'>${flash.message}</div>
								</div>
							</g:if>

							<label for='username' class="sr-only"><g:message code="springSecurity.login.username.label"/>:</label>
							<input type='email' class='form-control' name='j_username' id='username' placeholder="Correo" required/>

							<label for='password' class="sr-only"><g:message code="springSecurity.login.password.label"/>:</label>
							<input type='password' class='form-control' name='j_password' id='password' placeholder="Contraseña" required/>

							<p id="remember_me_holder">
								<input type='checkbox' class='chk' name='${rememberMeParameter}' id='remember_me' <g:if test='${hasCookie}'>checked='checked'</g:if>/>
								<label for='remember_me'><g:message code="springSecurity.login.remember.me.label"/></label>
							</p>

							<p>
								<input type='submit' id="submit" class="btn btn-lg btn-success btn-block" value='${message(code: "springSecurity.login.button")}'/>
							</p>
							<div id="registerPane" align="center" class="fheader">
								¿No tienes cuenta? <g:link controller="usuario" action="create" style="color:#000">Registrate</g:link>
							</div>
						</div>
				</form>
			</div>
		</div>
	</div>
</div>

<script type='text/javascript'>
	(function() {
		document.forms['loginForm'].elements['j_username'].focus();
	})();
</script>

</body>
</html>
