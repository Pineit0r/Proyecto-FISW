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
					<li class="active">Ver Proyecto</li>
				</ol>
			</div>

			<div class="col-md-8 col-md-offset-2">
				<div class="panel panel-success">
					<div class="panel-heading">
						<h1 class='panel-title' style="font-size: 40px">Detalles proyecto</h1>
					</div>

					<g:form url="[resource:proyectoInstance, action:'save']">
						<div class="panel-body">
							<g:if test='${flash.messageError}'>
								<div class="alert alert-danger" role="alert">
									<button type="button" class="close" data-dismiss="alert">&times;</button>${flash.messageError}
								</div>
							</g:if>
							<g:if test='${flash.message}'>
								<div class="alert alert-success" role="alert2">
									<button type="button" class="close" data-dismiss="alert2">&times;</button>${flash.message}
								</div>
							</g:if>
							<table class="table table-condensed">
								<tbody>
									<tr>
										<td>Nombre</td>
										<td><g:fieldValue bean="${proyectoInstance}" field="nombre"/></td>
									</tr>

									<tr>
										<td>Año Inicio - Año Fin</td>
										<td><g:fieldValue bean="${proyectoInstance}" field="inicio"/> - <g:fieldValue bean="${proyectoInstance}" field="fin"/></td>
									</tr>
									<tr>
										<td>Otro</td>
										<td><g:fieldValue bean="${proyectoInstance}" field="otro"/></td>
									</tr>
									<tr>
										<td>Área(s)</td>
										<td>
											<g:each in="${proyecto.fisw.ProyectoArea.findAllByProyecto(proyectoInstance)}" var="proyectoArea">
												<g:fieldValue bean="${proyectoArea.area}" field="nombre"/><br/>
											</g:each>
										</td>
									</tr>
								<tr>
									<td>Integrantes</td>
									<td>
										<g:each in="${proyecto.fisw.CargoProyecto.findAllByProyecto(proyectoInstance)}" var="cargoProyecto">
											${cargoProyecto?.usuario?.nombres.capitalize()} - <g:fieldValue bean="${cargoProyecto}" field="cargo"/><br/>
										</g:each>
									</td>
								</tr>
								</tbody>
							</table>
						</div>

						<div class="panel-footer">
							<g:form url="[resource:proyectoInstance, action:'delete']" method="DELETE">
								<fieldset class="buttons">
									%{--<g:if test="${isCreador}">--}%
									<g:link class="btn btn-primary" controller="cargoProyecto" action="create">Asociarse al proyecto</g:link>
									<g:if test="${applicationContext.springSecurityService.currentUser == proyectoInstance.creador}">
										<g:link class="btn btn-primary" action="edit" resource="${proyectoInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
										<g:actionSubmit class="btn btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: '¿Estás Seguro?')}');" />
									</g:if>
								</fieldset>
							</g:form>
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