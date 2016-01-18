<%@ page import="proyecto.fisw.Reporte" %>
<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="main">
</head>
<body>
<g:render template="/layouts/headerInterno"/>
<div class="container">
	<div class="alineacion">
		<div class="centrado">
			<div class="row">
				<div class="col-md-3 col-md-offset-1">
					<ol class="breadcrumb">
						<li><g:link controller="intranet" action="index" style="color: #0f0f0f">Intranet</g:link></li>
						<li class="active">Lista de Reportes</li>
					</ol>
				</div>
			</div>
			<div class="row">
				<div class="col-md-8 col-md-offset-2">
					<div class="panel panel-success">
						<div class="panel-heading">
							<h1 class='panel-title' style="font-size: 40px">Lista de Reportes hechos sobre mi</h1>
						</div>
					<div class="panel-body"/>
						<g:if test="${reporteInstanceList?.size() == 0 || reporteInstanceList == null}">
							No existen Reportes.
						</g:if>
						<g:else>
							<table class="table table-hover">
								<thead>
								<tr>
									<th>Director</th>
									<th>Fecha</th>
									<th>Ver</th>
								</tr>
								</thead>

								<tbody>
									<g:each in="${reporteInstanceList}" status="i" var="reporteInstance">
										<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

											<td>${reporteInstance?.director?.nombres?.capitalize()} ${reporteInstance?.director?.apellidos?.capitalize()}</td>
											<td>${fieldValue(bean: reporteInstance, field: "creado")}</td>
											<td><g:link class="btn btn-success btn-xs" action="show" controller="reporte" id="${reporteInstance.id}"><span class="glyphicon glyphicon-eye-open"></span> Ver</g:link></td>
										</tr>
									</g:each>
								</tbody>
							</table>
						</g:else>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<hr>
<div class="centrado"
<g:render template="/layouts/footer"/>
</div>
</body>
</html>

%{--


<%@ page import="proyecto.fisw.Reporte" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'reporte.label', default: 'Reporte')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-reporte" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-reporte" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="reporte.admin.label" default="Admin" /></th>
					
						<g:sortableColumn property="reporte" title="${message(code: 'reporte.reporte.label', default: 'Reporte')}" />
					
						<th><g:message code="reporte.usuario.label" default="Usuario" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${reporteInstanceList}" status="i" var="reporteInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${reporteInstance.id}">${fieldValue(bean: reporteInstance, field: "director")}</g:link></td>
					
						<td>${fieldValue(bean: reporteInstance, field: "reporte")}</td>
					
						<td>${fieldValue(bean: reporteInstance, field: "usuario")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${reporteInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
--}%
