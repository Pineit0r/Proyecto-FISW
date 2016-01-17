
<%@ page import="proyecto.fisw.Congreso" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'congreso.label', default: 'Congreso')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-congreso" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-congreso" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="congreso.ciudad.label" default="Ciudad" /></th>
					
						<g:sortableColumn property="fecha" title="${message(code: 'congreso.fecha.label', default: 'Fecha')}" />
					
						<g:sortableColumn property="lugar" title="${message(code: 'congreso.lugar.label', default: 'Lugar')}" />
					
						<g:sortableColumn property="nombre" title="${message(code: 'congreso.nombre.label', default: 'Nombre')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${congresoInstanceList}" status="i" var="congresoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${congresoInstance.id}">${fieldValue(bean: congresoInstance, field: "ciudad")}</g:link></td>
					
						<td><g:formatDate date="${congresoInstance.fecha}" /></td>
					
						<td>${fieldValue(bean: congresoInstance, field: "lugar")}</td>
					
						<td>${fieldValue(bean: congresoInstance, field: "nombre")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${congresoInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
