<%@ page import="proyecto.fisw.PublicacionLibro" %>


<label for="titulo">
	Titulo del Libro
</label>
<g:field type="text" placeholder="Titulo del Libro" name="titulo" class="form-control top"/>

<label for="autores">
	Autores
</label>
<g:field type="text" placeholder="Autores" name="autores" class="form-control top"/>


<label for="anho">
	Año
</label>
<g:field type="text" placeholder="Año" name="anho" class="form-control top"/>


<label for="ISBN">
	ISBN
</label>
<g:field type="text" placeholder="ISBN" name="ISBN" class="form-control top"/>


<label for="editorial">
	Editorial
</label>
<g:field type="text" placeholder="Editorial" name="editorial" class="form-control top"/>

<br>
<div class="fieldcontain ${hasErrors(bean: publicacionLibroInstance, field: 'poster', 'error')} ">
	<label>PDF</label>
	<div align="center">
		<input type="file" name="file" />
	</div>
</div>
<input name="tipo" value="publicacionLibro" hidden>
<input name="usuario.id" value="1" hidden>
<br>
