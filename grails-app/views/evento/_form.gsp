<%@ page import="proyecto.fisw.Evento" %>

<div class="fieldcontain ${hasErrors(bean: eventoInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="evento.nombre.label" default="Nombre del Evento" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required="" value="${eventoInstance?.nombre}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: eventoInstance, field: 'fecha', 'error')} required">
	<label for="fecha">
		<g:message code="evento.fecha.label" default="Fecha" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fecha" precision="minute"  value="${eventoInstance?.fecha}"  />

</div>

<g:hiddenField name="usuario.id" value="1" />

<div class="fieldcontain ${hasErrors(bean: eventoInstance, field: 'lugar', 'error')} required">
	<label for="lugar">
		<g:message code="evento.nombre.label" default="Lugar" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="lugar" required="" value="${eventoInstance?.lugar}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: eventoInstance, field: 'descripcion', 'error')} required">
	<label for="descripcion">
		<g:message code="evento.nombre.label" default="Descripción" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="descripcion" rows="4" cols="50" value="${eventoInstance?.descripcion}"/>

</div>

