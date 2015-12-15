<%@ page import="proyecto.fisw.Usuario" %>


<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'nombres', 'error')} required">
	<div class="form-group">
	<label for="nombres" class="sr-only">
		<g:message code="usuario.nombres.label" default="Nombre" />
	</label>

	<g:field type="text"  name="nombres" class="form-control" autofocus=""  placeholder="Nombre" required="" value="${usuarioInstance?.nombres}"/>
	</div>
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'apellidos', 'error')} required">
	<div class="form-group">
		<label for="apellidos" class="sr-only">
			<g:message code="usuario.apellidos.label" default="Apellidos" />
		</label>

		<g:field type="text"  name="apellidos" class="form-control" placeholder="Apellido" required="" value="${usuarioInstance?.apellidos}"/>
	</div>
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'username', 'error')} required">
	<div class="form-group">
		<label for="username" class="sr-only">
			<g:message code="usuario.username.label" default="Correo" />

		</label>

		<g:field type="email" name="username" class="form-control" placeholder="Correo" required="" value="${usuarioInstance?.username}"/>
	</div>
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'password', 'error')} required">
	<div class="form-group">
	<label for="password" class="sr-only">
		<g:message code="usuario.password.label" default="Password" />

	</label>

	<g:field type="password" name="password" class="form-control" placeholder="Contraseña" required="" value="${usuarioInstance?.password}"/>
	</div>
</div>


<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'area', 'error')} required">
	<div class="form-group">
	<label for="area" class="sr-only">
		<g:message code="usuario.area.label" default="Area" />

	</label>

	<g:select optionValue="nombre" noSelection="['':'Seleccione Área']"  id="area" style="color: black;" name="area.id" from="${proyecto.fisw.Area.list()}" optionKey="id" required="" value="${usuarioInstance.nombres}" class="many-to-one form-control"/>
	</div>
</div>


<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'rol_lab', 'error')} required">
	<div class="form-group">
	<label for="rol_lab" class="sr-only">
		<g:message code="usuario.rol_lab.label" default="Rol en el Laboratorio" />

	</label>

	<g:select  optionValue="nombre" noSelection="['':'Seleccione Rol']"  id="rol_lab" style="color: black;" name="rol_lab.id" from="${proyecto.fisw.RolLab.list()}" optionKey="id" required="" value="${usuarioInstance?.rol_lab?.nombre}" class="many-to-one form-control"/>

	</div>
</div>


