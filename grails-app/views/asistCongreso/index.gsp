<%@ page import="proyecto.fisw.AsistCongreso" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
	<meta name="layout" content="main"/>
</head>
<div>
	<body>
	<g:render template="/layouts/headerInterno"/>
	<div class="fixed-navbar-content">
		<div class="site-wrapper">
			<div class="centrado">

				<div class="container">
					<div class="jumbotron">
						<div class="row">
							<div class="panel panel-success">
								<div class="panel-heading">
									<h1 class="panel-title" style="font-size: 40px">Asistencia a Congresos</h1>
								</div>
							</div>
							<div class="col-md-3"></div>

							<div class="col-md-6">
								<div class="well">
									<g:if test="${asistCongresoInstanceList.size() != 0}">
										<table class='table table-striped'>
											<tr>
												<th>Congreso</th>
												<th>Poster</th>
											</tr>
											<g:each in="${asistCongresoInstanceList}" var="asistCongreso">
												<tr>
													<td>${asistCongreso.congreso.nombre}</td>
													<td>
														<g:if test="${asistCongreso.poster != null}">
														<g:link class="btn btn-success" controller="multimedia" action="download" id="${asistCongreso.poster.id}">Descargar</g:link>
														</g:if>
														<g:else>
															-
														</g:else>
													</td>
												</tr>
											</g:each>
										</table>
									</g:if>
									<g:else>
										<h4>No registra asistencia a congresos.</h4>
									</g:else>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</body>
</html>


%{--<%@ page import="proyecto.fisw.AsistCongreso" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'asistCongreso.label', default: 'AsistCongreso')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-asistCongreso" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-asistCongreso" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="asistCongreso.poster.label" default="Poster" /></th>
					
						<th><g:message code="asistCongreso.congreso.label" default="Congreso" /></th>
					
						<th><g:message code="asistCongreso.usuario.label" default="Usuario" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${asistCongresoInstanceList}" status="i" var="asistCongresoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${asistCongresoInstance.id}">${fieldValue(bean: asistCongresoInstance, field: "poster")}</g:link></td>
					
						<td>${fieldValue(bean: asistCongresoInstance, field: "congreso")}</td>
					
						<td>${fieldValue(bean: asistCongresoInstance, field: "usuario")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${asistCongresoInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>--}%
