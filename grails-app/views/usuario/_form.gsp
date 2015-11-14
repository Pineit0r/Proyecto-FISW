<%@ page import="proyecto.fisw.Usuario" %>



<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="usuario.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required="" value="${usuarioInstance?.nombre}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="usuario.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="password" required="" value="${usuarioInstance?.password}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'username', 'error')} required">
	<label for="username">
		<g:message code="usuario.username.label" default="Correo" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="username" required="" value="${usuarioInstance?.username}"/>

</div>

%{--<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'correo', 'error')} required">
	<label for="correo">
		<g:message code="usuario.correo.label" default="Correo" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="correo" required="" value="${usuarioInstance?.correo}"/>

</div>--}%

%{--
<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'accountExpired', 'error')} ">
	<label for="accountExpired">
		<g:message code="usuario.accountExpired.label" default="Account Expired" />
		
	</label>
	<g:checkBox name="accountExpired" value="${usuarioInstance?.accountExpired}" />

</div>
--}%

%{--<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'accountLocked', 'error')} ">
	<label for="accountLocked">
		<g:message code="usuario.accountLocked.label" default="Account Locked" />
		
	</label>
	<g:checkBox name="accountLocked" value="${usuarioInstance?.accountLocked}" />

</div>--}%

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'area', 'error')} required">
	<label for="area">
		<g:message code="usuario.area.label" default="Area" />
		<span class="required-indicator">*</span>
	</label>
	<g:select optionValue="nombre" id="area" name="area.id" from="${proyecto.fisw.Area.list()}" optionKey="id" required="" value="${usuarioInstance.nombre}" class="many-to-one"/>

</div>

%{--<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'enabled', 'error')} ">
	<label for="enabled">
		<g:message code="usuario.enabled.label" default="Enabled" />
		
	</label>
	<g:checkBox name="enabled" value="${usuarioInstance?.enabled}" />

</div>--}%

%{--<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'passwordExpired', 'error')} ">
	<label for="passwordExpired">
		<g:message code="usuario.passwordExpired.label" default="Password Expired" />
		
	</label>
	<g:checkBox name="passwordExpired" value="${usuarioInstance?.passwordExpired}" />

</div>--}%

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'rol_lab', 'error')} required">
	<label for="rol_lab">
		<g:message code="usuario.rol_lab.label" default="Rol en el Laboratorio" />
		<span class="required-indicator">*</span>
	</label>
	<g:select optionValue="nombre" id="rol_lab" name="rol_lab.id" from="${proyecto.fisw.Rol_Lab.list()}" optionKey="id" required="" value="${usuarioInstance?.rol_lab?.nombre}" class="many-to-one"/>

</div>

