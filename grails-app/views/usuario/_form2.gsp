<%@ page import="proyecto.fisw.Usuario" %>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'enabled', 'error')} ">
	<label for="enabled">
		<g:message code="usuario.enabled.label" default="Verificado" />
		
	</label>
	<g:checkBox name="enabled" value="${usuarioInstance?.enabled}" />

</div>

