<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<mt:plantilla tittle="Paciente">
	<jsp:attribute name="content">
	
	
<div class="invoice-wrapper rounded border bg-white py-5 px-3 px-md-4 px-lg-5">
	<div class="card card-default">
		<div class="card-header card-header-border-bottom">
			<h2>Formulario para creacion de Pacientes</h2>
		</div>
		<div class="card-body">
		<form action="Paciente" method="POST" class="form-horizontal">
		<input type="hidden" name="accion" value="INS"/>
			<div class="form-group">
				<label for="InputNombres">Nombres</label>
				<input type="text" class="form-control" id="InputNombres"
								name="nombres" value="${usuario.nombres}"
								placeholder="Nombres del Paciente">
			</div>
			<div class="form-group">
				<label for="InputApellidos">Apellidos</label>
				<input type="text" class="form-control" id="InputApellidos"
								name="apellidos" value="${usuario.apellidos}"
								placeholder="Apellidos del Paciente">
			</div>
			<div class="form-group">
				<label for="InputDpi">Numero de Dpi</label>
				<input type="text" class="form-control" id="InputDpi"
								name="dpi" value="${usuario.dpi}"
								placeholder="Numero del cliente">
			</div>
			<div class="form-group">
				<label for="InputFecha_Nacimiento">Fecha de Nacimiento</label>
				<input type="text" class="form-control" id="InputFecha_Nacimiento"
								name="fecha_nacimiento" value="${usuario.fecha_nacimiento}"
								placeholder="Fecha de Nacimiento del paciente">
			</div>
			<div class="form-group">
				<label for="InputSexo">Sexo del paciente</label>
				<input type="text" class="form-control" id="InputSexo"
								name="sexo" value="${usuario.sexo}"
								placeholder="Sexo del paciente">
			</div>
			<div class="form-group">
				<label for="InputAlergias">Alergias del paciente</label>
				<input type="text" class="form-control" id="InputAlergias"
								name="alergias" value="${usuario.alergias}"
								placeholder="Alergias del paciente">
			</div>		  	   
			<div class="form-group">
				<label for="InputAntecedentesPersonales">Antecedentes Personales</label>
				<input type="text" class="form-control" id="InputAntecedentesPersonales"
								name="antecedentes_personales" value="${usuario.antecedentes_personales}"
								placeholder="Antecedentes Medicos del paciente">
			</div>
			<div class="form-group">
				<label for="InputAntecedentesFamiliares">Antecedentes Familiares</label>
				<input type="text" class="form-control" id="InputAntecedentesFamiliares"
								name="antecedentes_familiares" value="${usuario.antecedentes_familiares}"
								placeholder="Antecedentes Medicos Familiares del paciente">
			</div>
			<div class="form-group">
				<label for="InputAnotacionesImportantes">Anotaciones Importantes</label>
				<input type="text" class="form-control" id="InputAnotacionesImportantes"
								name="anotaciones_importantes" value="${usuario.anotaciones_importantes}"
								placeholder="Antecedentes Medicos Familiares del paciente">
			</div>
			<div class="form-group">
				<label for="InputPadre">Nombre del Padre</label>
				<input type="text" class="form-control" id="InputPadre"
								name="padre" value="${usuario.padre}"
								placeholder="Nombre del padre del paciente">
			</div>
			<div class="form-group">
				<label for="InputMadre">Nombre de la Madre</label>
				<input type="text" class="form-control" id="InputMadre"
								name="madre" value="${usuario.madre}"
								placeholder="Nombre de la madre del paciente">
			</div>
			<div class="form-group">
				<label for="InputEncargado">Nombre del encargado del paciente</label>
				<input type="text" class="form-control" id="InputEncargado"
								name="encargado" value="${usuario.encargado}"
								placeholder="Nombre del encargado del paciente">
			</div>
			<div class="form-group">
				<label for="InputDireccion">Direccion del paciente</label>
				<input type="text" class="form-control" id="InputDireccion"
								name="direccion" value="${usuario.direccion}"
								placeholder="Dirreccion del paciente">
			</div>
			<div class="form-group">
				<label for="InputDpiEncargado">Numero de DPI del encargado</label>
				<input type="text" class="form-control" id="InputDpiEncargado"
								name="dpi_encargado" value="${usuario.dpi_encargado}"
								placeholder="Numero de DPI del encargado">
			</div>	
			<div class="form-group">
				<label for="InputTelefono">Numero de telefono del paciente</label>
				<input type="text" class="form-control" id="InputTelefono"
								name="telefono" value="${usuario.telefono}"
								placeholder="Numero de telefono del encargado">
			</div>
			<div class="form-group">
				<label for="InputNit">Numero de nit del paciente</label>
				<input type="text" class="form-control" id="InputNit"
								name="nit" value="${usuario.nit}"
								placeholder="Numero de telefono del encargado">
			</div>
			<div class="form-group">
				<label for="InputNombreFactura">Nombre para la factura paciente</label>
				<input type="text" class="form-control" id="InputNombreFactura"
								name="nombre_factura" value="${usuario.nombre_factura}"
								placeholder="Nombre para la factura paciente">
			</div>									
			<div class="form-group">
				<label for="InputDireccionFactura">Direccion para la factura paciente</label>
				<input type="text" class="form-control" id="InputDireccionFactura"
								name="direccion_factura" value="${usuario.direccion_factura}"
								placeholder="Direccion para la factura paciente">
			</div>
			<div class="form-group">
				<label for="InputUbicacion">Ubicacion para la factura paciente</label>
				<input type="text" class="form-control" id="InputUbicacion"
								name="ubicacion" value="${usuario.ubicacion}"
								placeholder="Ubicacion para la factura paciente">
			</div>																																																									
				   <button type="submit" class="btn btn-primary">Crear</button>
				   <button type="button" class="btn btn-danger btn-pill">Cancelar</button>
		     </form>
		</div>
	</div>
</div>


	</jsp:attribute>

</mt:plantilla>