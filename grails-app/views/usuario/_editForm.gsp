<%@ page import="proyecto.fisw.Usuario" %>


<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'nombres', 'error')} required">
	<label for="nombres">
		<g:message code="usuario.nombres.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>

	<g:field type="text" placeholder="Nombres" name="nombres" class="form-control top" required="" value="${usuarioInstance?.nombres.capitalize()}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'apellidos', 'error')} required">
	<label for="apellidos">
		<g:message code="usuario.apellidos.label" default="Apellidos" />
		<span class="required-indicator">*</span>
	</label>

	<g:field type="text" placeholder="Apellidos" name="apellidos" class="form-control middle" required="" value="${usuarioInstance?.apellidos.capitalize()}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'area', 'error')} required">
	<div class="form-group">
	<label for="area">
		<g:message code="usuario.area.label" default="Area" />
		<span class="required-indicator">*</span>
	</label>
	<g:select optionValue="nombre" noSelection="['':'Seleccione Área']" id="area" class="form-control" name="area.id" from="${proyecto.fisw.Area.list()}" optionKey="id" required="" value="${usuarioInstance?.area?.id}"/>
	</div>
</div>


<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'rol_lab', 'error')} required">
	<div class="form-group">
	<label for="rol_lab">
		<g:message code="usuario.rol_lab.label" default="Rol en el Laboratorio" />
		<span class="required-indicator">*</span>
	</label>
	<g:select  optionValue="nombre" noSelection="['':'Seleccione Rol']" id="rol_lab" class="form-control" name="rol_lab.id" from="${proyecto.fisw.RolLab.list()}" optionKey="id" required="" value="${usuarioInstance?.rol_lab?.id}"/>
	</div>
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'usuarioTitulo', 'error')} required">
	<div class="form-group">
		<label for="rol_lab">
			<g:message code="usuario.rol_lab.label" default="Carrera" />
			<span class="required-indicator">*</span>
		</label>
		<g:select optionValue="nombre" noSelection="['':'Seleccione Carrera']" id="titulo" class="form-control" name="titulo.nombre" from="${proyecto.fisw.Titulo.list()}" optionKey="nombre" required="" value="${(tituloInstance == null)? "" : tituloInstance?.nombre}"></g:select>
	</div>
</div>
%{--
<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'usuarioTitulo', 'error')} required">
	<div class="form-group">
		<label for="rol_lab">
			<g:message code="usuario.rol_lab.label" default="Universidad" />
			<span class="required-indicator">*</span>
		</label>
		<g:select optionValue="nombre" noSelection="['':'Seleccione Universidad']" id="institucion" class="form-control" name="institucion.nombre" from="${proyecto.fisw.Institucion.list()}" optionKey="nombre" required="" value="${(institucionInstance == null)? "" : institucionInstance?.nombre}"></g:select>
	</div>
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'titulo', 'error')} required">
	<div class="form-group">
		<label for="titulo">
			<g:message code="usuario.username.label" default="Carrera" />
			<span class="required-indicator">*</span>
		</label>
		<g:field type="text" placeholder="Carrera" name="usuarioInstance.usuarioTitulo.titulo.nombre" class="form-control" required="" value="${usuarioInstance?.usuarioTitulo?.titulo?.nombre}"/>
		<g:field type="text" placeholder="Universidad" name="usuarioInstance.usuarioTitulo.titulo.institucion.nombre" class="form-control" required="" value="${usuarioInstance?.usuarioTitulo?.titulo?.institucion?.nombre}"/>
		<g:field type="text" placeholder="País" name="usuarioInstance.usuarioTitulo.titulo.institucion.pais.nombre" class="form-control" required="" value="${usuarioInstance?.usuarioTitulo?.titulo?.institucion?.pais?.nombre}"/>
	</div>
</div>--}%