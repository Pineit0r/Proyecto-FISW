<%@ page import="proyecto.fisw.AsistCongreso" %>
<div class="well">
	<div class="fieldcontain ${hasErrors(bean: asistCongresoInstance, field: 'congreso', 'error')} required">
		<label>Congreso</label>
		<g:select id="congreso" name="congreso.id" optionValue="nombre" from="${proyecto.fisw.Congreso.list()}" optionKey="id" required="" value="${asistCongresoInstance?.congreso?.id}" class="form-control"/>

	</div>
</div>

<div class="well">
	<div class="fieldcontain ${hasErrors(bean: asistCongresoInstance, field: 'poster', 'error')} ">
		<label>Poster</label>
		<div align="center">
			<input type="file" name="file" />
		</div>
	</div>
</div>
<input name="tipo" value="asistCongreso" hidden>

<g:hiddenField name="usuario.id" value="1"/>