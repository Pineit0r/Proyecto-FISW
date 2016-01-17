
<%@ page import="proyecto.fisw.PublicacionLibro" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'publicacionLibro.label', default: 'PublicacionLibro')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-publicacionLibro" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-publicacionLibro" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="ruta" title="${message(code: 'publicacionLibro.ruta.label', default: 'Ruta')}" />
					
						<g:sortableColumn property="ISBN" title="${message(code: 'publicacionLibro.ISBN.label', default: 'ISBN')}" />
					
						<g:sortableColumn property="anho" title="${message(code: 'publicacionLibro.anho.label', default: 'Anho')}" />
					
						<g:sortableColumn property="autores" title="${message(code: 'publicacionLibro.autores.label', default: 'Autores')}" />
					
						<g:sortableColumn property="editorial" title="${message(code: 'publicacionLibro.editorial.label', default: 'Editorial')}" />
					
						<g:sortableColumn property="titulo" title="${message(code: 'publicacionLibro.titulo.label', default: 'Titulo')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${publicacionLibroInstanceList}" status="i" var="publicacionLibroInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${publicacionLibroInstance.id}">${fieldValue(bean: publicacionLibroInstance, field: "ruta")}</g:link></td>
					
						<td>${fieldValue(bean: publicacionLibroInstance, field: "ISBN")}</td>
					
						<td>${fieldValue(bean: publicacionLibroInstance, field: "anho")}</td>
					
						<td>${fieldValue(bean: publicacionLibroInstance, field: "autores")}</td>
					
						<td>${fieldValue(bean: publicacionLibroInstance, field: "editorial")}</td>
					
						<td>${fieldValue(bean: publicacionLibroInstance, field: "titulo")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${publicacionLibroInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
