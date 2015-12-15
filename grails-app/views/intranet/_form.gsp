<%@ page import="proyecto.fisw.Usuario" %>



<div class="fieldcontain ${hasErrors(bean: usuario, field: 'nombre', 'error')} required">
	<div class="form-group">
	<label for="nombres">
		<g:message code="usuario.nombre.label" default="Nombres" />
		<span class="required-indicator">*</span>
	</label>

	<g:field type="text"  name="nombres" class="form-control" required="" value="${usuario?.nombres}"/>
	</div>
</div>

<div class="fieldcontain ${hasErrors(bean: usuario, field: 'password', 'error')} required">
	<div class="form-group">
	<label for="password">
		<g:message code="usuario.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="password" name="password" class="form-control" required=""/>
	</div>
</div>

<div class="fieldcontain ${hasErrors(bean: usuario, field: 'username', 'error')} required">
	<div class="form-group">
	<label for="username">
		<g:message code="usuario.username.label" default="Correo" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="username" class="form-control" required="" value="${usuario?.username}"/>
	</div>
</div>


<div class="fieldcontain ${hasErrors(bean: usuario, field: 'area', 'error')} required">
	<div class="form-group">
	<label for="area">
		<g:message code="usuario.area.label" default="Area" />
		<span class="required-indicator">*</span>
	</label>
	<g:select optionValue="nombre"  id="area" class="form-control" name="area.id" from="${proyecto.fisw.Area.list()}" optionKey="id" required="" value="${usuario?.area?.nombre}" class="many-to-one"/>
	</div>
</div>


<div class="fieldcontain ${hasErrors(bean: usuario, field: 'rol_lab', 'error')} required">
	<div class="form-group">
	<label for="rol_lab">
		<g:message code="usuario.rol_lab.label" default="Rol en el Laboratorio" />
		<span class="required-indicator">*</span>
	</label>
	<g:select  optionValue="nombre" id="rol_lab" class="form-control" name="rol_lab.id" from="${proyecto.fisw.RolLab.list()}" optionKey="id" required="" value="${usuario?.rol_lab?.nombre}" class="many-to-one"/>
	</div>
</div>

