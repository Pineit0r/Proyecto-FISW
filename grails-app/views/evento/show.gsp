<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
	<meta name="layout" content="main"/>
</head>

<body>
<g:render template="/layouts/headerInterno"/>
<div class="fixed-navbar-content">
<div class="site-wrapper">
<div class="centrado">
	<g:form url="[resource:eventoInstance, action:'save']" action="upload" controller="multimedia" style="max-width: 600px; margin-left: auto; margin-right: auto">
		<div class="row">
			<div class="panel panel-success">
				<div class="panel-heading">
					<h1 class='panel-title' style="font-size: 40px"><g:fieldValue bean="${eventoInstance}" field="nombre"/></h1>
				</div>
				<div class="panel-body">

					<table class="table">
						<tbody>
						<tr>
							<td>Nombre</td>
							<td><g:fieldValue bean="${eventoInstance}" field="nombre"/></td>
						</tr>
						<tr>
							<td>Fecha</td>
							<td><g:fieldValue bean="${eventoInstance}" field="fecha"/></td>
						</tr>
						<tr>
							<td>Lugar</td>
							<td><g:fieldValue bean="${eventoInstance}" field="lugar"/></td>
						</tr>
						<tr>
							<td>Descripción</td>
							<td><g:fieldValue bean="${eventoInstance}" field="descripcion"/></td>
						</tr>
						</tbody>
					</table>
					<sec:ifAnyGranted roles="ROLE_DIRECTOR">
						<g:form url="[resource:eventoInstance, action:'delete']" method="DELETE">
							<fieldset class="buttons">
								<g:link class="edit" action="edit" resource="${eventoInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
								<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: '¿Estás Seguro?')}');" />
							</fieldset>
						</g:form>
					</sec:ifAnyGranted>
				</div>
			</div>
		</div>
		</div>
     </div>
	</g:form>
</div>
</div>
</div>
</body>
</html>


%{--<%@ page import="proyecto.fisw.Evento" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'evento.label', default: 'Evento')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-evento" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-evento" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list evento">

				<g:if test="${eventoInstance?.fecha}">
				<li class="fieldcontain">
					<span id="fecha-label" class="property-label"><g:message code="evento.fecha.label" default="Fecha" /></span>

						<span class="property-value" aria-labelledby="fecha-label"><g:formatDate date="${eventoInstance?.fecha}" /></span>

				</li>
				</g:if>

				<g:if test="${eventoInstance?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label"><g:message code="evento.nombre.label" default="Nombre" /></span>

						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${eventoInstance}" field="nombre"/></span>

				</li>
				</g:if>

				<g:if test="${eventoInstance?.usuario}">
				<li class="fieldcontain">
					<span id="usuario-label" class="property-label"><g:message code="evento.usuario.label" default="Usuario" /></span>

						<span class="property-value" aria-labelledby="usuario-label"><g:link controller="usuario" action="show" id="${eventoInstance?.usuario?.id}">${eventoInstance?.usuario?.encodeAsHTML()}</g:link></span>

				</li>
				</g:if>

			</ol>
			<g:form url="[resource:eventoInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${eventoInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>--}%
