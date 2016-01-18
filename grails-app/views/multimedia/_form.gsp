<%@ page import="proyecto.fisw.Multimedia" %>

<div class="fieldcontain ${hasErrors(bean: multimediaInstance, field: 'filename', 'error')} required">
	<label for="filename">
		<g:message code="multimedia.filename.label" default="Filename" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="filename" required="" value="${multimediaInstance?.filename}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: multimediaInstance, field: 'fullpath', 'error')} required">
	<label for="fullpath">
		<g:message code="multimedia.fullpath.label" default="Fullpath" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="fullpath" required="" value="${multimediaInstance?.fullpath}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: multimediaInstance, field: 'subido', 'error')} required">
	<label for="subido">
		<g:message code="multimedia.subido.label" default="Subido" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="subido" precision="day"  value="${multimediaInstance?.subido}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: multimediaInstance, field: 'tipo', 'error')} required">
	<label for="tipo">
		<g:message code="multimedia.tipo.label" default="Tipo" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="tipo" required="" value="${multimediaInstance?.tipo}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: multimediaInstance, field: 'usuario', 'error')} required">
	<label for="usuario">
		<g:message code="multimedia.usuario.label" default="Usuario" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="usuario" name="usuario.id" from="${proyecto.fisw.Usuario.list()}" optionKey="id" required="" value="${multimediaInstance?.usuario?.id}" class="many-to-one"/>

</div>

