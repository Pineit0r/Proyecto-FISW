<%@ page import="proyecto.fisw.AsistCongreso" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
	<meta name="layout" content="main"/>
</head>
<div>
	<body>
		<g:render template="/layouts/headerInterno"/>
		<div class="container">
			<div class="alineacion">
				<div class="row">
					<div class="col-md-3 col-md-offset-1">
						<ol class="breadcrumb">
							<li><g:link controller="intranet" action="index" style="color: #0f0f0f">Intranet</g:link></li>
							<li class="active">Mi asistencia</li>
						</ol>
					</div>

					<div class="col-md-10 col-md-offset-1">
						<div class="panel panel-success">
							<div class="panel-heading">
								<h1 class="panel-title" style="font-size: 40px">Mi asistencia</h1>
							</div>

							<div class="panel-body">
								<div class="well">
									<g:if test="${asistCongresoInstanceList.size() != 0}">
										<table class='table table-striped'>
											<thead>
												<tr>
													<th>Congreso</th>
													<th>Poster</th>
												</tr>
											</thead>
											<tbody>
											<g:each in="${asistCongresoInstanceList}" var="asistCongreso">
												<tr>
													<td>${asistCongreso.congreso.nombre}</td>
													<td>
														<g:if test="${asistCongreso.poster != null}">
															<g:link class="btn btn-success btn-xs" controller="multimedia" action="download" id="${asistCongreso.poster.id}">Descargar</g:link>
														</g:if>
														<g:else>
															-
														</g:else>
													</td>
												</tr>
											</g:each>
											</tbody>
										</table>
									</g:if>
									<g:else>
										<h4>No registra asistencia a congresos.</h4>
									</g:else>
								</div>
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
