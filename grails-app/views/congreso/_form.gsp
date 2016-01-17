<%@ page import="proyecto.fisw.Congreso" %>

<div class="fieldcontain ${hasErrors(bean: congresoInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="congreso.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required="" class="form-control" value="${congresoInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: congresoInstance, field: 'ciudad', 'error')} required">
	<label for="ciudad">
		<g:message code="congreso.ciudad.label" default="Ciudad" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="ciudad" name="ciudad.id" optionKey="id" optionValue="ciudad" from="${proyecto.fisw.Ciudad.list()}" required="" value="${congresoInstance?.ciudad?.id}" class="many-to-one form-control"/>

</div>
<br>
<div class="fieldcontain ${hasErrors(bean: congresoInstance, field: 'fecha', 'error')} required">
	<label for="fecha">
		<g:message code="congreso.fecha.label" default="Fecha" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fecha" precision="day"  class="form-control" value="${congresoInstance?.fecha}"  />
</div>
<br>

