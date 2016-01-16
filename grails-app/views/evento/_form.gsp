<%@ page import="proyecto.fisw.Evento" %>



<div class="fieldcontain ${hasErrors(bean: eventoInstance, field: 'fecha', 'error')} required">
	<label for="fecha">
		<g:message code="evento.fecha.label" default="Fecha" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fecha" precision="day"  value="${eventoInstance?.fecha}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: eventoInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="evento.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required="" value="${eventoInstance?.nombre}"/>

</div>

<g:hiddenField name="usuario.id" value="2" />

