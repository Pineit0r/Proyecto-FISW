<%@ page import="proyecto.fisw.Proyecto" %>



<div class="fieldcontain ${hasErrors(bean: proyectoInstance, field: 'fin', 'error')} required">
	<label for="fin">
		<g:message code="proyecto.fin.label" default="Fin" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fin" precision="day"  value="${proyectoInstance?.fin}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: proyectoInstance, field: 'inicio', 'error')} required">
	<label for="inicio">
		<g:message code="proyecto.inicio.label" default="Inicio" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="inicio" precision="day"  value="${proyectoInstance?.inicio}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: proyectoInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="proyecto.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required="" value="${proyectoInstance?.nombre}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: proyectoInstance, field: 'otro', 'error')} required">
	<label for="otro">
		<g:message code="proyecto.otro.label" default="Otro" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="otro" required="" value="${proyectoInstance?.otro}"/>

</div>

