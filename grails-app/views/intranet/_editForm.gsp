<%@ page import="proyecto.fisw.Usuario" %>



<div class="fieldcontain ${hasErrors(bean: usuario, field: 'nombre', 'error')} required">
	<div class="form-group">
	<label for="nombres">
		<g:message code="usuario.nombre.label" default="Nombres" />
		<span class="required-indicator">*</span>
	</label>

	<g:field type="text"  name="nombres" class="form-control" required="" value="${usuario?.nombres.capitalize()}"/>
	</div>
</div>

<div class="fieldcontain ${hasErrors(bean: usuario, field: 'apellidos', 'error')} required">
	<div class="form-group">
		<label for="nombres">
			<g:message code="usuario.nombre.label" default="Apellidos" />
			<span class="required-indicator">*</span>
		</label>

		<g:field type="text"  name="nombres" class="form-control" required="" value="${usuario?.apellidos.capitalize()}"/>
	</div>
</div>


<div class="fieldcontain ${hasErrors(bean: usuario, field: 'area', 'error')} required">
	<div class="form-group">
	<label for="area">
		<g:message code="usuario.area.label" default="Area" />
		<span class="required-indicator">*</span>
	</label>
	<g:select optionValue="nombre" noSelection="['':'Seleccione Área']" id="area" class="form-control" name="area.id" from="${proyecto.fisw.Area.list()}" optionKey="id" required="" value="${usuario?.area?.id}"/>
	</div>
</div>


<div class="fieldcontain ${hasErrors(bean: usuario, field: 'rol_lab', 'error')} required">
	<div class="form-group">
	<label for="rol_lab">
		<g:message code="usuario.rol_lab.label" default="Rol en el Laboratorio" />
		<span class="required-indicator">*</span>
	</label>
	<g:select  optionValue="nombre" noSelection="['':'Seleccione Rol']" id="rol_lab" class="form-control" name="rol_lab.id" from="${proyecto.fisw.RolLab.list()}" optionKey="id" required="" value="${usuario?.rol_lab?.id}"/>
	</div>
</div>

<div class="fieldcontain ${hasErrors(bean: usuario, field: 'titulo', 'error')} required">
	<div class="form-group">
		<label for="titulo">
			<g:message code="usuario.username.label" default="Carrera" />
			<span class="required-indicator">*</span>
		</label>
		<g:field type="text" placeholder="Carrera" name="usuario.titulo.nombre" class="form-control" required="" value="${usuario?.titulo?.nombre}"/>
		<g:field type="text" placeholder="Universidad" name="usuario.titulo.institucion.nombre" class="form-control" required="" value="${usuario?.titulo?.institucion?.nombre}"/>
		<g:field type="text" placeholder="País" name="usuario.titulo.institucion.pais.nombre" class="form-control" required="" value="${usuario?.titulo?.institucion?.pais?.nombre}"/>
	</div>
</div>

<fieldset class="buttons">
	<g:submitButton name="create" class="btn btn-success" value="Aceptar" />
</fieldset>