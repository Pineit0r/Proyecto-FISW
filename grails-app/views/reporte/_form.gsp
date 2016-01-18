<%@ page import="proyecto.fisw.Reporte" %>


<div class="fieldcontain ${hasErrors(bean: reporteInstance, field: 'usuario', 'error')} required">
	<label for="usuario">
		<g:message code="reporte.usuario.label" default="Usuario" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="usuario" name="usuario.id" optionValue="username" from="${proyecto.fisw.Usuario.list()}" optionKey="id" required="" value="${reporteInstance?.usuario?.id}" class="many-to-one form-control"/>

</div>
<div class="fieldcontain ${hasErrors(bean: reporteInstance, field: 'reporte', 'error')} required">
	<label for="reporte">
		<g:message code="reporte.reporte.label" default="Reporte" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="reporte" rows="20" cols="14" maxlength="255" class="form-control" required="" value="${reporteInstance?.reporte}"/>

</div>

<g:hiddenField name="director" value="1"/><g:set var="today" value="${new Date()}"/>
<g:hiddenField name="creado" value="${g.formatDate(value: new Date(), format:'dd/MM/yy')}"/>

