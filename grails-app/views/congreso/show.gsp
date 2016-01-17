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
								<li class="active">Ver Congreso</li>
							</ol>
						</div>

						<div class="col-md-8 col-md-offset-2">
							<div class="panel panel-success">
								<div class="panel-heading">
									<h1 class='panel-title' style="font-size: 40px">Detalles congreso</h1>
								</div>

								<g:form url="[resource:congresoInstance, action:'save']">
									<div class="panel-body">
										<table class="table table-condensed">
											<thead>
												<tr>
													<th>Nombre</th>
													<th>Fecha</th>
													<th>Ciudad, País</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td><g:fieldValue bean="${congresoInstance}" field="nombre"/></td>
													<td><g:fieldValue bean="${congresoInstance}" field="fecha"/></td>
													<td><g:fieldValue bean="${congresoInstance}" field="ciudad.ciudad"/>, <g:fieldValue bean="${congresoInstance}" field="ciudad.pais.nombre"/></td>
												</tr>
											</tbody>
										</table>
									</div>

									<div class="panel-footer">
										<sec:ifAnyGranted roles="ROLE_DIRECTOR,ROLE_ADMIN">
											<g:form url="[resource:congresoInstance, action:'delete']" method="DELETE">
												<fieldset class="buttons">
													<g:link class="btn btn-primary" action="edit" resource="${congresoInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
													<g:actionSubmit class="btn btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: '¿Estás Seguro?')}');" />
												</fieldset>
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