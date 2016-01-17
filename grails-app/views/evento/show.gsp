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
							<li class="active">Ver Evento</li>
						</ol>
					</div>
					<div class="col-md-8 col-md-offset-2">
						<div class="panel panel-success">
							<div class="panel-heading">
								<h1 class='panel-title' style="font-size: 40px">Detalles evento</h1>
							</div>

							<g:form url="[resource:eventoInstance, action:'save']" >
								<div class="panel-body">
									<table class="table table-condensed">
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
								</div>
								<div class="panel-footer">

									<sec:ifAnyGranted roles="ROLE_DIRECTOR">
										<g:form url="[resource:eventoInstance, action:'delete']" method="DELETE">

												<g:link class="btn btn-primary" action="edit" resource="${eventoInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
												<g:actionSubmit class="bnt btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: '¿Estás Seguro?')}');" />

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
