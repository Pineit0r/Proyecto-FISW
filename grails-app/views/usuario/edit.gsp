<%@ page import="proyecto.fisw.Usuario" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#edit-usuario" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		%{--<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>--}%
		<div id="edit-usuario" class="content scaffold-edit" role="main">
			<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
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





				<ol class="property-list usuario">

					<g:if test="${usuarioInstance?.username}">
						<li class="fieldcontain">
							<span id="username-label" class="property-label"><g:message code="usuario.username.label" default="Correo" /></span>

							<span class="property-value" aria-labelledby="username-label"><g:fieldValue bean="${usuarioInstance}" field="username"/></span>

						</li>
					</g:if>

					<g:if test="${usuarioInstance?.nombre}">
						<li class="fieldcontain">
							<span id="nombre-label" class="property-label"><g:message code="usuario.nombre.label" default="Nombre" /></span>

							<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${usuarioInstance}" field="nombre"/></span>

						</li>
					</g:if>

				%{--<g:if test="${usuarioInstance?.accountLocked}">
				<li class="fieldcontain">
					<span id="accountLocked-label" class="property-label"><g:message code="usuario.accountLocked.label" default="Account Locked" /></span>

						<span class="property-value" aria-labelledby="accountLocked-label"><g:formatBoolean boolean="${usuarioInstance?.accountLocked}" /></span>

				</li>
				</g:if>--}%

					<g:if test="${usuarioInstance?.area}">
						<li class="fieldcontain">
							<span id="area-label" class="property-label"><g:message code="usuario.area.label" default="Area" /></span>

							<span class="property-value" aria-labelledby="area-label"><g:link controller="area" action="show" id="${usuarioInstance?.area?.id}">${usuarioInstance?.area?.nombre}</g:link></span>

						</li>
					</g:if>

					%{--<g:if test="${usuarioInstance?.passwordExpired}">
						<li class="fieldcontain">
							<span id="passwordExpired-label" class="property-label"><g:message code="usuario.passwordExpired.label" default="Password Expired" /></span>

							<span class="property-value" aria-labelledby="passwordExpired-label"><g:formatBoolean boolean="${usuarioInstance?.passwordExpired}" /></span>

						</li>
					</g:if>--}%

					<g:if test="${usuarioInstance?.rol_lab}">
						<li class="fieldcontain">
							<span id="rol_lab-label" class="property-label"><g:message code="usuario.rol_lab.label" default="Rollab" /></span>

							<span class="property-value" aria-labelledby="rol_lab-label"><g:link controller="rol_Lab" action="show" id="${usuarioInstance?.rol_lab?.id}">${usuarioInstance?.rol_lab?.nombre}</g:link></span>

						</li>
					</g:if>

				</ol>



			<g:form url="[resource:usuarioInstance, action:'update']" method="PUT" >
				<g:hiddenField name="version" value="${usuarioInstance?.version}" />
				<fieldset class="form">
					<g:render template="form2"/>
				</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
