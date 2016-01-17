
<%@ page import="proyecto.fisw.Usuario" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
	</head>
	<body>
	<g:render template="/layouts/headerInterno"/>
	<div class="container">
		<div class="alineacion">
			<div class="centrado">
				<div class="row">
					<div class="col-md-4 col-md-offset-1">
						<ol class="breadcrumb">
							<li><g:link controller="intranet" action="index" style="color: #0f0f0f">Intranet</g:link></li>
							<li><g:link controller="usuario" action="index" style="color: #0f0f0f">Lista usuarios</g:link></li>
							<li class="active">Ver usuario</li>
						</ol>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6 col-md-offset-3">
						<div class="panel panel-success">
							<div class="panel-heading">
								<h1 class='panel-title' style="font-size: 40px">Usuario</h1>
							</div>
							<div class="panel-body">

								<table class="table table-condensed">
									<tbody>
										<tr>
											<td>Nombre</td>
											<td><g:fieldValue bean="${usuarioInstance}" field="nombres"/></td>
										</tr>
										<tr>
											<td>Apellido</td>
											<td><g:fieldValue bean="${usuarioInstance}" field="apellidos"/></td>
										</tr>
										<tr>
											<td>Correo</td>
											<td><g:fieldValue bean="${usuarioInstance}" field="username"/></td>
										</tr>
										<tr>
											<td>Area de investigación</td>
											<td><g:fieldValue bean="${usuarioInstance?.area}" field="nombre"/></td>
										</tr>

										<tr>
											<td>Verificado</td>
											<sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_DIRECTOR">
												<g:if test="${usuarioInstance?.enabled}">
													<td><span class="glyphicon glyphicon-ok-circle"></span></td>
												</g:if>
												<g:else>
													<td><span class="glyphicon glyphicon-remove-circle"></span></td>
												</g:else>

											</sec:ifAnyGranted>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="panel-footer">
								<g:form url="[resource:usuarioInstance, action:'delete']" method="DELETE">
									<fieldset class="buttons">
										<g:actionSubmit class="btn btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
									</fieldset>
								</g:form>
							</div>
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
