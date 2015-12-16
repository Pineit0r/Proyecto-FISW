
<%@ page import="proyecto.fisw.Multimedia" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'multimedia.label', default: 'Multimedia')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-multimedia" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-multimedia" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list multimedia">
			
				<g:if test="${multimediaInstance?.filename}">
				<li class="fieldcontain">
					<span id="filename-label" class="property-label"><g:message code="multimedia.filename.label" default="Filename" /></span>
					
						<span class="property-value" aria-labelledby="filename-label"><g:fieldValue bean="${multimediaInstance}" field="filename"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${multimediaInstance?.fullpath}">
				<li class="fieldcontain">
					<span id="fullpath-label" class="property-label"><g:message code="multimedia.fullpath.label" default="Fullpath" /></span>
					
						<span class="property-value" aria-labelledby="fullpath-label"><g:fieldValue bean="${multimediaInstance}" field="fullpath"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${multimediaInstance?.subido}">
				<li class="fieldcontain">
					<span id="subido-label" class="property-label"><g:message code="multimedia.subido.label" default="Subido" /></span>
					
						<span class="property-value" aria-labelledby="subido-label"><g:formatDate date="${multimediaInstance?.subido}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${multimediaInstance?.tipo}">
				<li class="fieldcontain">
					<span id="tipo-label" class="property-label"><g:message code="multimedia.tipo.label" default="Tipo" /></span>
					
						<span class="property-value" aria-labelledby="tipo-label"><g:fieldValue bean="${multimediaInstance}" field="tipo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${multimediaInstance?.usuario}">
				<li class="fieldcontain">
					<span id="usuario-label" class="property-label"><g:message code="multimedia.usuario.label" default="Usuario" /></span>
					
						<span class="property-value" aria-labelledby="usuario-label"><g:link controller="usuario" action="show" id="${multimediaInstance?.usuario?.id}">${multimediaInstance?.usuario?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:multimediaInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${multimediaInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
