
<%@ page import="proyecto.fisw.CargoProyecto" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'cargoProyecto.label', default: 'CargoProyecto')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-cargoProyecto" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-cargoProyecto" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="cargo" title="${message(code: 'cargoProyecto.cargo.label', default: 'Cargo')}" />
					
						<th><g:message code="cargoProyecto.proyecto.label" default="Proyecto" /></th>
					
						<th><g:message code="cargoProyecto.usuario.label" default="Usuario" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${cargoProyectoInstanceList}" status="i" var="cargoProyectoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${cargoProyectoInstance.id}">${fieldValue(bean: cargoProyectoInstance, field: "cargo")}</g:link></td>
					
						<td>${fieldValue(bean: cargoProyectoInstance, field: "proyecto")}</td>
					
						<td>${fieldValue(bean: cargoProyectoInstance, field: "usuario")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${cargoProyectoInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
