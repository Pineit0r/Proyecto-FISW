<%@ page import="proyecto.fisw.Rol" %>



<div class="fieldcontain ${hasErrors(bean: rolInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="rol.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required="" value="${rolInstance?.nombre}"/>

</div>

