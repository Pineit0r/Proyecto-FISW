
<%@ page import="proyecto.fisw.Multimedia" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'multimedia.label', default: 'Multimedia')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-multimedia" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-multimedia" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="filename" title="${message(code: 'multimedia.filename.label', default: 'Filename')}" />
					
						<g:sortableColumn property="fullpath" title="${message(code: 'multimedia.fullpath.label', default: 'Fullpath')}" />
					
						<g:sortableColumn property="subido" title="${message(code: 'multimedia.subido.label', default: 'Subido')}" />
					
						<g:sortableColumn property="tipo" title="${message(code: 'multimedia.tipo.label', default: 'Tipo')}" />
					
						<th><g:message code="multimedia.usuario.label" default="Usuario" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${multimediaInstanceList}" status="i" var="multimediaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${multimediaInstance.id}">${fieldValue(bean: multimediaInstance, field: "filename")}</g:link></td>
					
						<td>${fieldValue(bean: multimediaInstance, field: "fullpath")}</td>
					
						<td><g:formatDate date="${multimediaInstance.subido}" /></td>
					
						<td>${fieldValue(bean: multimediaInstance, field: "tipo")}</td>
					
						<td>${fieldValue(bean: multimediaInstance, field: "usuario")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${multimediaInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
