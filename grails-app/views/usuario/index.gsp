
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
						<div class="col-md-3 col-md-offset-1">
							<ol class="breadcrumb">
								<li><g:link controller="intranet" action="index" style="color: #0f0f0f">Intranet</g:link></li>
								<li class="active">Lista Usuarios</li>
							</ol>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6 col-md-offset-3">
							<div class="panel panel-success">
								<div class="panel-heading">
									<h1 class='panel-title' style="font-size: 40px">Lista Usuarios</h1>
								</div>

								<div class="panel-body">
									<table class="table table-hover">
										<thead>
											<tr>
												<td>Nombre</td>
												<td>Correo</td>
												<td>Verificación</td>
											</tr>
										</thead>

										<tbody>
											<g:each in="${usuarioInstanceList}" status="i" var="usuarioInstance">
												<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

													<td>${fieldValue(bean: usuarioInstance, field: "nombres")}</td>
													<td><g:link action="show" style="color: #0f0f0f" id="${usuarioInstance.id}">${fieldValue(bean: usuarioInstance, field: "username")}</g:link></td>

													<sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_DIRECTOR">
														<g:if test="${usuarioInstance?.enabled}">
															<td><span class="glyphicon glyphicon-ok-circle"></span></td>
														</g:if>
														<g:else>
															<td><span class="glyphicon glyphicon-remove-circle"></span></td>
														</g:else>

													</sec:ifAnyGranted>
												</tr>
											</g:each>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
