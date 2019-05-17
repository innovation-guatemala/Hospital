<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags" %>
<mt:plantilla tittle="Usuario">
	<jsp:attribute name="content">
	
	
<div class="invoice-wrapper rounded border bg-white py-5 px-3 px-md-4 px-lg-5">
	<div class="card card-default">
		<div class="card-header card-header-border-bottom">
			<h2>Formulario para creacion de Usuario</h2>
		</div>
		<div class="card-body">
		<form>
			<div class="form-group">
				<label for="InputNombre">Nombre</label>
				<input type="text" class="form-control" id="InputNombre" name="nombre" value="${usuario.nombre}"
				placeholder="Nombre del Usuario">
			</div>
			<div class="form-group">
				<label for="InputApellido">Apellido</label>
				<input type="text" class="form-control" id="InputApellido" name="apellido" value="${usuario.apellido}"
				placeholder="Apellido del Usuario">
			</div>
			<div class="form-group">
				<label for="InputPuesto">Puesto</label>
				<input type="text" class="form-control" id="InputPuesto" name="puesto" value="${usuario.puesto}"
				placeholder="Puesto del Usuario">
			</div>
			<div class="form-group">
				<label for="InputPassword">Password</label>
				<input type="password" class="form-control" id="InputPassword" name="password" value="${usuario.password}"
				placeholder="Password del Usuario">
			</div>
			
			<div class="form-footer pt-4 pt-5 mt-4 border-top">
				<button type="submit" class="btn btn-primary btn-default">Crear</button>
				<button type="submit" class="btn btn-secondary btn-default">Cancel</button>
			</div>
		</form>
		</div>
	</div>
</div>


	</jsp:attribute>

</mt:plantilla>