<%@ page import="proyecto.fisw.Usuario" %>

<div class="panel panel-success">
	<div class="panel-heading">
		<h2 class='form-signin-heading'>Registrarse</h2>
	</div>
	<div class="panel-body">


		<g:if test="${flash.message}">
			<div class="alert alert-danger" role="alert">
				<div class='login_message'>${flash.message}</div>
			</div>
		</g:if>
		<g:hasErrors bean="${usuarioInstance}">
			<g:eachError bean="${usuarioInstance}" var="error">
				<div class="alert alert-danger" role="alert">
                    <div class='login_message'><g:message error="${error}"/></div>
				</div>
			</g:eachError>
		</g:hasErrors>

		<g:if test='${flash.message}'>
			<div class="alert alert-danger" role="alert">
				<div class='login_message'>${flash.message}</div>
			</div>
		</g:if>
		<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'nombres', 'error')} required">
			<label for="nombres" class="sr-only">
				<g:message code="usuario.nombres.label" default="Nombre" />
				<span class="required-indicator">*</span>
			</label>

			<g:field type="text" placeholder="Nombres" name="nombres" class="form-control top" required="" value="${usuarioInstance?.nombres}"/>
		</div>

		<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'apellidos', 'error')} required">
			<label for="apellidos" class="sr-only">
				<g:message code="usuario.apellidos.label" default="Apellidos" />
				<span class="required-indicator">*</span>
			</label>

			<g:field type="text" placeholder="Apellidos" name="apellidos" class="form-control middle" required="" value="${usuarioInstance?.apellidos}"/>
		</div>

		<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'username', 'error')} required">
			<label for="username" class="sr-only">
				<g:message code="usuario.username.label" default="Correo" />
				<span class="required-indicator">*</span>
			</label>
			<g:field type="email" placeholder="Correo" name="username" class="form-control middle" required="" value="${usuarioInstance?.username}"/>
		</div>

		<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'password', 'error')} required">
			<label for="password" class="sr-only">
				<g:message code="usuario.password.label" default="Password" />
				<span class="required-indicator">*</span>
			</label>
			<g:field type="password" placeholder="Contraseña" name="password" class="form-control bottom" required="" value="${usuarioInstance?.password}"/>
		</div>

		<fieldset class="buttons">
			<g:submitButton name="create" class="btn btn-success" value="Enviar solicitud" />
		</fieldset>
	</div>
</div>


