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
								<li class="active">Crear Evento</li>
							</ol>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6 col-md-offset-3">
							<div class="panel panel-success">
								<div class="panel-heading">
									<h1 class='panel-title' style="font-size: 40px">Crear nuevo evento</h1>
								</div>

								<fieldset class="form">
									<div class="panel-body">
										<g:if test='${flash.message}'>
											<div class="alert alert-danger" role="alert">
												<button type="button" class="close" data-dismiss="alert">&times;</button>${flash.message}
											</div>
										</g:if>
											<g:form url="[resource:eventoInstance, action:'save']">
												<div class="well">
													<g:render template="form"/>
													<div class="form-group">
														<g:submitButton name="create" class="btn btn-success" value="Crear Evento" />
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
		<div class="centrado">
			<g:render template="/layouts/footer"/>
		</div>
	</body>
</html>