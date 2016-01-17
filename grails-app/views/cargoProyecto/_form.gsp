<%@ page import="proyecto.fisw.CargoProyecto" %>

<div class="fieldcontain ${hasErrors(bean: cargoProyectoInstance, field: 'proyecto', 'error')} required">
	<label for="proyecto">
		<g:message code="cargoProyecto.proyecto.label" default="Proyecto" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="proyecto" optionValue="nombre" name="proyecto.id" from="${proyecto.fisw.Proyecto.list()}" optionKey="id" required="" value="${cargoProyectoInstance?.proyecto?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: cargoProyectoInstance, field: 'cargo', 'error')} required">
	<label for="cargo">
		<g:message code="cargoProyecto.cargo.label" default="Cargo" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="cargo" required="" value="${cargoProyectoInstance?.cargo}"/>

</div>

<g:hiddenField name="usuario.id" value="1"/>

