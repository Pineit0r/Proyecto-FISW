
<%@ page import="proyecto.fisw.PublicacionLibro" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'publicacionLibro.label', default: 'PublicacionLibro')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-publicacionLibro" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-publicacionLibro" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list publicacionLibro">
			
				<g:if test="${publicacionLibroInstance?.ruta}">
				<li class="fieldcontain">
					<span id="ruta-label" class="property-label"><g:message code="publicacionLibro.ruta.label" default="Ruta" /></span>
					
						<span class="property-value" aria-labelledby="ruta-label"><g:fieldValue bean="${publicacionLibroInstance}" field="ruta"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${publicacionLibroInstance?.ISBN}">
				<li class="fieldcontain">
					<span id="ISBN-label" class="property-label"><g:message code="publicacionLibro.ISBN.label" default="ISBN" /></span>
					
						<span class="property-value" aria-labelledby="ISBN-label"><g:fieldValue bean="${publicacionLibroInstance}" field="ISBN"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${publicacionLibroInstance?.anho}">
				<li class="fieldcontain">
					<span id="anho-label" class="property-label"><g:message code="publicacionLibro.anho.label" default="Anho" /></span>
					
						<span class="property-value" aria-labelledby="anho-label"><g:fieldValue bean="${publicacionLibroInstance}" field="anho"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${publicacionLibroInstance?.autores}">
				<li class="fieldcontain">
					<span id="autores-label" class="property-label"><g:message code="publicacionLibro.autores.label" default="Autores" /></span>
					
						<span class="property-value" aria-labelledby="autores-label"><g:fieldValue bean="${publicacionLibroInstance}" field="autores"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${publicacionLibroInstance?.editorial}">
				<li class="fieldcontain">
					<span id="editorial-label" class="property-label"><g:message code="publicacionLibro.editorial.label" default="Editorial" /></span>
					
						<span class="property-value" aria-labelledby="editorial-label"><g:fieldValue bean="${publicacionLibroInstance}" field="editorial"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${publicacionLibroInstance?.titulo}">
				<li class="fieldcontain">
					<span id="titulo-label" class="property-label"><g:message code="publicacionLibro.titulo.label" default="Titulo" /></span>
					
						<span class="property-value" aria-labelledby="titulo-label"><g:fieldValue bean="${publicacionLibroInstance}" field="titulo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${publicacionLibroInstance?.usuario}">
				<li class="fieldcontain">
					<span id="usuario-label" class="property-label"><g:message code="publicacionLibro.usuario.label" default="Usuario" /></span>
					
						<span class="property-value" aria-labelledby="usuario-label"><g:link controller="usuario" action="show" id="${publicacionLibroInstance?.usuario?.id}">${publicacionLibroInstance?.usuario?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:publicacionLibroInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${publicacionLibroInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
