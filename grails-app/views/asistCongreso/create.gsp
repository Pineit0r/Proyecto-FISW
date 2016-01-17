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
	<g:form url="[resource:asistCongresoInstance, action:'save']" class="form-signin" enctype="multipart/form-data" style="max-width: 550px; margin-left: auto; margin-right: auto">
		<div class="row">
			<div class="panel panel-success">
				<div class="panel-heading">
					<h1 class='panel-title' style="font-size: 40px">Agregar Asistencia a Congreso</h1>
				</div>
				<fieldset class="form">
					<div class="panel-body">
						<g:if test='${flash.message}'>
							<div class="alert alert-danger" role="alert">
								<button type="button" class="close" data-dismiss="alert">&times;</button>${flash.message}
							</div>
						</g:if>
						<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="btn btn-success" value="Agregar Asistencia a Congreso" />
				</fieldset>
				<p></p>
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

%{--<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'asistCongreso.label', default: 'AsistCongreso')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#create-asistCongreso" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="create-asistCongreso" class="content scaffold-create" role="main">
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${asistCongresoInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${asistCongresoInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form url="[resource:asistCongresoInstance, action:'save']" >
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
