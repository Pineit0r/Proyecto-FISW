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
						<li class="active">Crear Proyecto</li>
					</ol>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6 col-md-offset-3">
					<div class="panel panel-success">
						<div class="panel-heading">
							<h1 class='panel-title' style="font-size: 40px">Crear nuevo proyecto</h1>
						</div>
						<fieldset class="form">
							<div class="panel-body">
								<g:if test='${flash.message}'>
									<div class="alert alert-danger" role="alert">
										<button type="button" class="close" data-dismiss="alert">&times;</button>${flash.message}
										<g:hasErrors bean="${cargoProyectoInstance}">
											<ul class="errors" role="alert">
												<g:eachError bean="${cargoProyectoInstance}" var="error">
													<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
												</g:eachError>
											</ul>
										</g:hasErrors>
									</div>
								</g:if>
								<g:form url="[resource:proyectoInstance, action:'save']">
									<div class="well">
										<g:render template="form"/>

										<div class="form-group">
											<g:submitButton name="create" class="btn btn-success" value="Agregar Proyecto" />
										</div>
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