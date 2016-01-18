<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
	<meta name="layout" content="main"/>
</head>

<body>
<g:render template="/layouts/headerInterno"/>
<div class="container">
	<div class="alineacion">


		<div class="row">
			<div class="col-md-4 col-md-offset-1">
				<ol class="breadcrumb">
					<li><g:link controller="intranet" action="index" style="color: #0f0f0f">Intranet</g:link></li>
					<li><g:link controller="reporte" action="index" style="color: #0f0f0f">Lista Reportes</g:link></li>
					<li class="active">Ver Reporte</li>
				</ol>
			</div>
			<div class="col-md-8 col-md-offset-2">
				<div class="panel panel-success">
					<div class="panel-heading">
						<h1 class='panel-title' style="font-size: 40px">Detalles del Reporte</h1>
					</div>

					<g:form url="[resource:reporteInstance, action:'save']" >
						<div class="panel-body">
							<table class="table table-condensed">
								<tbody>
								<tr>
									<td>Usuario</td>
									<td>${reporteInstance?.usuario?.nombres.capitalize()} ${reporteInstance?.usuario?.apellidos.capitalize()}</td>
								</tr>
								<tr>
									<td>Fecha</td>
									<td><g:fieldValue bean="${reporteInstance}" field="creado"/></td>
								</tr>
								<tr>
									<td>Reporte</td>
									<td><g:fieldValue bean="${reporteInstance}" field="reporte"/></td>
								</tr>
								</tbody>
							</table>
						</div>
						<div class="panel-footer">

							<sec:ifAnyGranted roles="ROLE_DIRECTOR">
								<g:form url="[resource:reporteInstance, action:'delete']" method="DELETE">

									<g:link class="btn btn-primary" action="edit" resource="${reporteInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
									<g:actionSubmit class="btn btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: '¿Estás Seguro?')}');" />

								</g:form>
							</sec:ifAnyGranted>

						</div>
					</g:form>

				</div>
			</div>
		</div>
	</div>
</div>
<hr>
<div class="centrado">
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
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-reporte" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-reporte" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list reporte">
			
				<g:if test="${reporteInstance?.director}">
				<li class="fieldcontain">
					<span id="director-label" class="property-label"><g:message code="reporte.director.label" default="Admin" /></span>
					
						<span class="property-value" aria-labelledby="director-label"><g:link controller="usuario" action="show" id="${reporteInstance?.director?.id}">${reporteInstance?.director?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${reporteInstance?.reporte}">
				<li class="fieldcontain">
					<span id="reporte-label" class="property-label"><g:message code="reporte.reporte.label" default="Reporte" /></span>
					
						<span class="property-value" aria-labelledby="reporte-label"><g:fieldValue bean="${reporteInstance}" field="reporte"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${reporteInstance?.usuario}">
				<li class="fieldcontain">
					<span id="usuario-label" class="property-label"><g:message code="reporte.usuario.label" default="Usuario" /></span>
					
						<span class="property-value" aria-labelledby="usuario-label"><g:link controller="usuario" action="show" id="${reporteInstance?.usuario?.id}">${reporteInstance?.usuario?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:reporteInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${reporteInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
--}%
