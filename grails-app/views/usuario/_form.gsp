<%@ page import="proyecto.fisw.Usuario" %>



<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'nombres', 'error')} required">
	<div class="form-group">
	<label for="nombres">
		<g:message code="usuario.nombres.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>

	<g:field type="text"  name="nombres" class="form-control" required="" value="${usuarioInstance?.nombres}"/>
	</div>
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'apellidos', 'error')} required">
	<div class="form-group">
		<label for="apellidos">
			<g:message code="usuario.apellidos.label" default="Apellidos" />
			<span class="required-indicator">*</span>
		</label>

		<g:field type="text"  name="apellidos" class="form-control" required="" value="${usuarioInstance?.apellidos}"/>
	</div>
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'username', 'error')} required">
	<div class="form-group">
		<label for="username">
			<g:message code="usuario.username.label" default="Correo" />
			<span class="required-indicator">*</span>
		</label>
		<g:field type="email" name="username" class="form-control" required="" value="${usuarioInstance?.username}"/>
	</div>
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'password', 'error')} required">
	<div class="form-group">
	<label for="password">
		<g:message code="usuario.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="password" name="password" class="form-control" required="" value="${usuarioInstance?.password}"/>
	</div>
</div>


<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'area', 'error')} required">
	<div class="form-group">
	<label for="area">
		<g:message code="usuario.area.label" default="Area" />
		<span class="required-indicator">*</span>
	</label>
	<g:select optionValue="nombre"  id="area" class="form-control" name="area.id" from="${proyecto.fisw.Area.list()}" optionKey="id" required="" value="${usuarioInstance.nombres}" class="many-to-one"/>
	</div>
</div>


<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'rol_lab', 'error')} required">
	<div class="form-group">
	<label for="rol_lab">
		<g:message code="usuario.rol_lab.label" default="Rol en el Laboratorio" />
		<span class="required-indicator">*</span>
	</label>
	<g:select  optionValue="nombre" id="rol_lab" class="form-control" name="rol_lab.id" from="${proyecto.fisw.RolLab.list()}" optionKey="id" required="" value="${usuarioInstance?.rol_lab?.nombre}" class="many-to-one"/>
	</div>
</div>

