
<%@ page import="proyecto.fisw.Proyecto" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'proyecto.label', default: 'Proyecto')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-proyecto" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-proyecto" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="fin" title="${message(code: 'proyecto.fin.label', default: 'Fin')}" />
					
						<g:sortableColumn property="inicio" title="${message(code: 'proyecto.inicio.label', default: 'Inicio')}" />
					
						<g:sortableColumn property="nombre" title="${message(code: 'proyecto.nombre.label', default: 'Nombre')}" />
					
						<g:sortableColumn property="otro" title="${message(code: 'proyecto.otro.label', default: 'Otro')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${proyectoInstanceList}" status="i" var="proyectoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${proyectoInstance.id}">${fieldValue(bean: proyectoInstance, field: "fin")}</g:link></td>
					
						<td>${fieldValue(bean: proyectoInstance, field: "inicio")}</td>
					
						<td>${fieldValue(bean: proyectoInstance, field: "nombre")}</td>
					
						<td>${fieldValue(bean: proyectoInstance, field: "otro")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${proyectoInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
