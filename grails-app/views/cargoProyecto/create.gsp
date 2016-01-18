<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
	<meta name="layout" content="main"/>
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
						<li class="active">Asociarse a Proyecto</li>
					</ol>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6 col-md-offset-3">
					<div class="panel panel-success">
						<div class="panel-heading">
							<h1 class='panel-title' style="font-size: 40px">Asociarse a Proyecto</h1>
						</div>
						<fieldset class="form">
							<div class="panel-body">
								<g:if test='${flash.message}'>
									<div class="alert alert-danger" role="alert">
										<button type="button" class="close" data-dismiss="alert">&times;</button>${flash.message}
									</div>
								</g:if>
								<g:form url="[resource:cargoProyectoInstance, action:'save']">
									<div class="well">
										<g:if test="${proyecto.fisw.Proyecto.count == 0}">
											<div class="alert alert-danger" role="alert">
												<button type="button" class="close" data-dismiss="alert">&times;</button>No existen proyectos. <g:link class="btn btn-primary btn-xs" action="create" controller="proyecto">Crear Nuevo Proyecto</g:link>
											</div>
										</g:if>
										<g:else>
											<g:render template="form"/>
										<div class="form-group">
											<g:submitButton name="create" class="btn btn-success" value="Asociarse a Proyecto" />
										</div>
										</g:else>
									</div>
								</g:form>
							</div>
						</fieldset>
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

%{--<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'cargoProyecto.label', default: 'CargoProyecto')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#create-cargoProyecto" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="create-cargoProyecto" class="content scaffold-create" role="main">
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${cargoProyectoInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${cargoProyectoInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form url="[resource:cargoProyectoInstance, action:'save']" >
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>--}%
