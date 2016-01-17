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
					<li class="active">Ver Proyecto</li>
				</ol>
			</div>

			<div class="col-md-8 col-md-offset-2">
				<div class="panel panel-success">
					<div class="panel-heading">
						<h1 class='panel-title' style="font-size: 40px">Detalles proyecto</h1>
					</div>

					<g:form url="[resource:proyectoInstance, action:'save']">
						<div class="panel-body">
							<table class="table table-condensed">
								<tbody>
									<tr>
										<td>Nombre</td>
										<td><g:fieldValue bean="${proyectoInstance}" field="nombre"/></td>
									</tr>

									<tr>
										<td>Año Inicio - Año Fin</td>
										<td><g:fieldValue bean="${proyectoInstance}" field="inicio"/> - <g:fieldValue bean="${proyectoInstance}" field="fin"/></td>
									</tr>
									<tr>
										<td>Otro</td>
										<td><g:fieldValue bean="${proyectoInstance}" field="otro"/></td>
									</tr>
									<tr>
										<td>Área(s)</td>
										<td>
											<g:each in="${proyecto.fisw.ProyectoArea.findAllByProyecto(proyectoInstance)}" var="proyectoArea">
												<g:fieldValue bean="${proyectoArea.area}" field="nombre"/><br/>
											</g:each>
										</td>
									</tr>
								</tbody>
							</table>
						</div>

						<div class="panel-footer">
							<g:form url="[resource:proyectoInstance, action:'delete']" method="DELETE">
								<fieldset class="buttons">
									<g:link class="btn btn-primary" action="edit" resource="${proyectoInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
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


%{--
<%@ page import="proyecto.fisw.Proyecto" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'proyecto.label', default: 'Proyecto')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-proyecto" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-proyecto" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list proyecto">
			
				<g:if test="${proyectoInstance?.fin}">
				<li class="fieldcontain">
					<span id="fin-label" class="property-label"><g:message code="proyecto.fin.label" default="Fin" /></span>
					
						<span class="property-value" aria-labelledby="fin-label"><g:fieldValue bean="${proyectoInstance}" field="fin"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${proyectoInstance?.inicio}">
				<li class="fieldcontain">
					<span id="inicio-label" class="property-label"><g:message code="proyecto.inicio.label" default="Inicio" /></span>
					
						<span class="property-value" aria-labelledby="inicio-label"><g:fieldValue bean="${proyectoInstance}" field="inicio"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${proyectoInstance?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label"><g:message code="proyecto.nombre.label" default="Nombre" /></span>
					
						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${proyectoInstance}" field="nombre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${proyectoInstance?.otro}">
				<li class="fieldcontain">
					<span id="otro-label" class="property-label"><g:message code="proyecto.otro.label" default="Otro" /></span>
					
						<span class="property-value" aria-labelledby="otro-label"><g:fieldValue bean="${proyectoInstance}" field="otro"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:proyectoInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${proyectoInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
--}%
