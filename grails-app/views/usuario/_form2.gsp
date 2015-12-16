<%@ page import="proyecto.fisw.Usuario" %>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'enabled', 'error')} ">
	<label for="enabled">
		<g:message code="usuario.enabled.label" default="Verificado" />
		
	</label>
	<g:checkBox name="enabled" value="${usuarioInstance?.enabled}" />

</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'nombres', 'error')} required">
	<label for="nombres" class="sr-only">
		<g:message code="usuario.nombres.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>

	<g:field type="text" placeholder="Nombres" name="nombres" class="form-control top" required="" value="${usuarioInstance?.nombres}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'apellidos', 'error')} required">
	<label for="apellidos" class="sr-only">
		<g:message code="usuario.apellidos.label" default="Apellidos" />
		<span class="required-indicator">*</span>
	</label>

	<g:field type="text" placeholder="Apellidos" name="apellidos" class="form-control middle" required="" value="${usuarioInstance?.apellidos}"/>
</div>