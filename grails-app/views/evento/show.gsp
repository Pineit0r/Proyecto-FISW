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
	<g:form url="[resource:eventoInstance, action:'save']" style="max-width: 600px; margin-left: auto; margin-right: auto">
		<div class="row">
			<div class="panel panel-success">
				<div class="panel-heading">
					<h1 class='panel-title' style="font-size: 40px"><g:fieldValue bean="${eventoInstance}" field="nombre"/></h1>
				</div>
				<div class="panel-body">

					<table class="table">
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
					<sec:ifAnyGranted roles="ROLE_DIRECTOR">
						<g:form url="[resource:eventoInstance, action:'delete']" method="DELETE">
							<fieldset class="buttons">
								<g:link class="edit" action="edit" resource="${eventoInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
								<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: '¿Estás Seguro?')}');" />
							</fieldset>
						</g:form>
					</sec:ifAnyGranted>
				</div>
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
