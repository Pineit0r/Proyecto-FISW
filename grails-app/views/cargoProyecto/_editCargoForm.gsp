<%@ page import="proyecto.fisw.CargoProyecto" %>

<div class="fieldcontain ${hasErrors(bean: cargoProyectoInstance, field: 'cargo', 'error')} required">
	<label for="cargo">
		<g:message code="cargoProyecto.cargo.label" default="Cargo" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="cargo" required="" value="${cargoProyectoInstance?.cargo}"/>

</div>

<g:hiddenField name="usuario.id" value="1"/>

