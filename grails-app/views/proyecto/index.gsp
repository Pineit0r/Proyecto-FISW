
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
						<li class="active">Lista de Proyectos</li>
					</ol>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6 col-md-offset-3">
					<div class="panel panel-success">
						<div class="panel-heading">
							<h1 class='panel-title' style="font-size: 40px">Lista de Proyectos</h1>
						</div>
						<div class="panel-body">
							<g:if test="${proyecto.fisw.Proyecto.count == 0}">
									No existen proyectos. <g:link class="btn btn-primary btn-xs" action="create" controller="proyecto">Crear Nuevo Proyecto</g:link>
							</g:if>
							<g:else>
							<table class="table table-hover">
								<thead>
								<tr>
									<th>Nombre</th>
									<th>Año inicio - fin</th>
									<th>Ver</th>
								</tr>
								</thead>

								<tbody>
								<g:each in="${proyectoInstanceList}" status="i" var="proyectoInstance">
									<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

										<td>${fieldValue(bean: proyectoInstance, field: "nombre")}</td>
										<td>${fieldValue(bean: proyectoInstance, field: "inicio")} - ${fieldValue(bean: proyectoInstance, field: "fin")}</td>
										<td><g:link class="btn btn-success btn-xs" action="show" controller="proyecto" id="${proyectoInstance.id}"><span class="glyphicon glyphicon-eye-open"></span> Ver</g:link></td>
									</tr>
								</g:each>
								</tbody>
							</table>
						</div>
						</g:else>
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



%{--
<%@ page import="proyecto.fisw.Proyecto" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'proyecto.label', default: 'Proyecto')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-proyecto" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-proyecto" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="fin" title="${message(code: 'proyecto.fin.label', default: 'Fin')}" />
					
						<g:sortableColumn property="inicio" title="${message(code: 'proyecto.inicio.label', default: 'Inicio')}" />
					
						<g:sortableColumn property="nombre" title="${message(code: 'proyecto.nombre.label', default: 'Nombre')}" />
					
						<g:sortableColumn property="otro" title="${message(code: 'proyecto.otro.label', default: 'Otro')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${proyectoInstanceList}" status="i" var="proyectoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${proyectoInstance.id}">${fieldValue(bean: proyectoInstance, field: "fin")}</g:link></td>
					
						<td>${fieldValue(bean: proyectoInstance, field: "inicio")}</td>
					
						<td>${fieldValue(bean: proyectoInstance, field: "nombre")}</td>
					
						<td>${fieldValue(bean: proyectoInstance, field: "otro")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${proyectoInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
--}%
