<%@ page import="proyecto.fisw.CargoProyecto" %>
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
			<div class="col-md-3 col-md-offset-1">
				<ol class="breadcrumb">
					<li><g:link controller="intranet" action="index" style="color: #0f0f0f">Intranet</g:link></li>
					<li class="active">Ver Cargo en Proyecto</li>
				</ol>
			</div>

			<div class="col-md-8 col-md-offset-2">
				<div class="panel panel-success">
					<div class="panel-heading">
						<h1 class='panel-title' style="font-size: 40px">Mi cargo en el proyecto</h1>
					</div>

					<g:form url="[resource:cargoProyectoInstance, action:'save']">
						<div class="panel-body">
							<table class="table table-condensed">
								<tbody>
								<tr>
									<td>Nombre Proyecto</td>
									<td><g:fieldValue bean="${cargoProyectoInstance.proyecto}" field="nombre"/></td>
								</tr>

								<tr>
									<td>Mi Cargo</td>
									<td><g:fieldValue bean="${cargoProyectoInstance}" field="cargo"/></td>
								</tr>

								<tr>
									<td>Año Inicio - Año Fin</td>
									<td><g:fieldValue bean="${cargoProyectoInstance.proyecto}" field="inicio"/> - <g:fieldValue bean="${cargoProyectoInstance.proyecto}" field="fin"/></td>
								</tr>
								<tr>
									<td>Otro</td>
									<td><g:fieldValue bean="${cargoProyectoInstance.proyecto}" field="otro"/></td>
								</tr>
								<tr>
									<td>Área(s)</td>
									<td>
										<g:each in="${proyecto.fisw.ProyectoArea.findAllByProyecto(cargoProyectoInstance.proyecto)}" var="proyectoArea">
											<g:fieldValue bean="${proyectoArea.area}" field="nombre"/><br/>
										</g:each>
									</td>
								</tr>
								</tbody>
							</table>
						</div>

						<div class="panel-footer">
							<g:form url="[resource:cargoProyectoInstance, action:'delete']" method="DELETE">
								<fieldset class="buttons">
									<g:link class="btn btn-primary" action="edit" resource="${cargoProyectoInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
									<g:actionSubmit class="btn btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: '¿Estás Seguro?')}');" />
								</fieldset>
							</g:form>
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


%{--<%@ page import="proyecto.fisw.CargoProyecto" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'cargoProyecto.label', default: 'CargoProyecto')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-cargoProyecto" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-cargoProyecto" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list cargoProyecto">
			
				<g:if test="${cargoProyectoInstance?.cargo}">
				<li class="fieldcontain">
					<span id="cargo-label" class="property-label"><g:message code="cargoProyecto.cargo.label" default="Cargo" /></span>
					
						<span class="property-value" aria-labelledby="cargo-label"><g:fieldValue bean="${cargoProyectoInstance}" field="cargo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${cargoProyectoInstance?.proyecto}">
				<li class="fieldcontain">
					<span id="proyecto-label" class="property-label"><g:message code="cargoProyecto.proyecto.label" default="Proyecto" /></span>
					
						<span class="property-value" aria-labelledby="proyecto-label"><g:link controller="proyecto" action="show" id="${cargoProyectoInstance?.proyecto?.id}">${cargoProyectoInstance?.proyecto?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${cargoProyectoInstance?.usuario}">
				<li class="fieldcontain">
					<span id="usuario-label" class="property-label"><g:message code="cargoProyecto.usuario.label" default="Usuario" /></span>
					
						<span class="property-value" aria-labelledby="usuario-label"><g:link controller="usuario" action="show" id="${cargoProyectoInstance?.usuario?.id}">${cargoProyectoInstance?.usuario?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:cargoProyectoInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${cargoProyectoInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>--}%
