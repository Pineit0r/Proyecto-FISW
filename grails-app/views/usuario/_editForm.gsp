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

<label>Estudios de Pregrado<span class="required-indicator">*</span></label>
<div class="well">
<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'usuarioTitulos', 'error')} required">
	<div class="form-group">
		<label for="rol_lab">
			<g:message code="usuario.rol_lab.label" default="Carrera" />
			<span class="required-indicator">*</span>
			<g:select optionValue="nombre" noSelection="['':'Seleccione Carrera']" id="titulo" class="form-control" name="pregrado.titulo.nombre" from="${proyecto.fisw.Titulo.findAllByTipo(false)}" optionKey="nombre" required="" value="${(tituloPregradoInstance == null)? "" : tituloPregradoInstance?.nombre}"/>
		</label>
		<label for="rol_lab">
			<g:message code="usuario.rol_lab.label" default="Universidad" />
			<span class="required-indicator">*</span>
			<g:select optionValue="nombre" noSelection="['':'Seleccione Universidad']" id="institucion" class="form-control" name="pregrado.institucion.nombre" from="${proyecto.fisw.Institucion.list()}" optionKey="nombre" required="" value="${(tituloPregradoInstance == null)? "" : tituloPregradoInstance?.institucion?.nombre}"/>
		</label>
		<label for="rol_lab">
			<g:message code="usuario.rol_lab.label" default="País" />
			<span class="required-indicator">*</span>
			<g:select optionValue="nombre" noSelection="['':'Seleccione País']" id="pais" class="form-control" name="pregrado.pais.nombre" from="${proyecto.fisw.Pais.list()}" optionKey="nombre" required="" value="${(tituloPregradoInstance == null)? "" : tituloPregradoInstance?.institucion?.pais?.nombre}"/>
		</label>

	</div>
</div>
</div>


<label>Estudios de Postgrado</label>
<div class="well">
	<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'usuarioTitulos', 'error')} required">
		<div class="form-group">
			<label for="rol_lab">
				<g:message code="usuario.rol_lab.label" default="Carrera" />
				<g:select optionValue="nombre" noSelection="['':'Seleccione Carrera']" id="titulo" class="form-control" name="postgrado.titulo.nombre" from="${proyecto.fisw.Titulo.findAllByTipo(true)}" optionKey="nombre" value="${(tituloPostgradoInstance == null)? "" : tituloPostgradoInstance?.nombre}"/>
			</label>
			<label for="rol_lab">
				<g:message code="usuario.rol_lab.label" default="Universidad" />
				<g:select optionValue="nombre" noSelection="['':'Seleccione Universidad']" id="institucion" class="form-control" name="postgrado.institucion.nombre" from="${proyecto.fisw.Institucion.list()}" optionKey="nombre" value="${(tituloPostgradoInstance == null)? "" : tituloPostgradoInstance?.institucion?.nombre}"/>
			</label>
			<label for="rol_lab">
				<g:message code="usuario.rol_lab.label" default="País" />
				<g:select optionValue="nombre" noSelection="['':'Seleccione País']" id="pais" class="form-control" name="postgrado.pais.nombre" from="${proyecto.fisw.Pais.list()}" optionKey="nombre" value="${(tituloPostgradoInstance == null)? "" : tituloPostgradoInstance?.institucion?.pais?.nombre}"/>
			</label>

		</div>
	</div>
</div>