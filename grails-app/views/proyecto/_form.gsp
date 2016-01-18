<%@ page import="proyecto.fisw.Proyecto" %>

<div class="fieldcontain ${hasErrors(bean: proyectoInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="proyecto.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required="" class="form-control" value="${proyectoInstance?.nombre}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: proyectoInstance, field: 'inicio', 'error')} required">
	<label for="inicio">
		<g:message code="proyecto.inicio.label" default="Año Inicio" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="inicio" class="form-control" value="${proyectoInstance?.inicio}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: proyectoInstance, field: 'fin', 'error')} required">
	<label for="fin">
		<g:message code="proyecto.fin.label" default="Año Fin" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="fin" class="form-control" value="${proyectoInstance?.fin}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: proyectoInstance, field: 'otro', 'error')} required">
	<label for="otro">
		<g:message code="proyecto.otro.label" default="Otro" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="otro" class="form-control" required="" value="${proyectoInstance?.otro}"/>

</div>


<div class="fieldcontain ${hasErrors(bean: proyectoInstance, field: 'area', 'error')} required">
	<div class="form-group">
		<label for="area">
			<g:message code="usuario.area.label" default="Area(s)" />
			<span class="required-indicator">*</span>
		</label>
		<g:select multiple="multiple" optionValue="nombre"  id="area" name="area.id" from="${proyecto.fisw.Area.list()}" optionKey="id" required="" class="many-to-one form-control" value="${proyectoInstance?.areas?.area?.id}"/>
	</div>
</div>

<g:hiddenField name="creador.id" value="${proyectoInstance?.creador?.id}" />