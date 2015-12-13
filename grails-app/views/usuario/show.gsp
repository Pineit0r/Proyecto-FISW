
<%@ page import="proyecto.fisw.Usuario" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
	</head>
	<body>
		<div class="container">
			<div class="centrado">
				<li><g:link class="list" action="index">Lista de Usuarios</g:link></li>


		<div id="show-usuario" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
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

				<sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_DIRECTOR">
					<li class="fieldcontain">
						<span id="enabled-label" class="property-label"><g:message code="usuario.enabled.label" default="Verificado" /></span>

						<span class="property-value" aria-labelledby="enabled-label"><g:formatBoolean boolean="${usuarioInstance?.enabled}" /></span>

					</li>
				</sec:ifAnyGranted>
			
			</ol>
			<g:form url="[resource:usuarioInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${usuarioInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
