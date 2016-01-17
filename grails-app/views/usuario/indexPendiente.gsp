
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
							<li class="active">Lista Usuarios Pendientes</li>
						</ol>
					</div>
				</div>
				<div class="row">
					<div class="col-md-8 col-md-offset-2">
						<div class="panel panel-success">
							<div class="panel-heading">
								<h1 class='panel-title' style="font-size: 40px">Lista Usuarios Pendientes</h1>
							</div>

							<div class="panel-body">
								<g:if test="${usuarioInstanceCount > 0}">
									<table class="table table-hover">
										<thead>
											<tr>
												<td>Nombre</td>
												<td>Apellido</td>
												<td>Correo</td>
												<td></td>
											</tr>
										</thead>
										<tbody>
											<g:each in="${usuarioInstanceList}" status="i" var="usuarioInstance">
												<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
													<td>${fieldValue(bean: usuarioInstance, field: "nombres")}</td>
													<td>${fieldValue(bean: usuarioInstance, field: "apellidos")}</td>
													<td><g:link action="show" style="color: #0f0f0f;" id="${usuarioInstance.id}">${fieldValue(bean: usuarioInstance, field: "username")}</g:link></td>
													<td><g:link controller="usuario" action="validar" class="btn btn-success btn-xs" id="${usuarioInstance.id}">Validar</g:link> </td>
												</tr>
											</g:each>
										</tbody>
									</table>
								</g:if>
								<g:else>
									<h3>No existen usuarios pendientes.</h3>
								</g:else>
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
