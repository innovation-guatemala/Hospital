<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<mt:plantilla tittle="Paciente">
	<jsp:attribute name="content">
	
	
<div
			class="invoice-wrapper rounded border bg-white py-5 px-3 px-md-4 px-lg-5">
	<div class="card card-default">
		<div class="card-header card-header-border-bottom">
			<h2>Formulario para creacion de Pacientes</h2>
		</div>
		<div>${mensaje}</div>
		<div class="card-body">
		<form action="Paciente" method="POST" class="form-horizontal">
		<input type="hidden" name="accion" value="INS" />
			<div class="form-group">
				<label for="InputNombres">Nombres</label>
				<div class="input-group">
					<div class="input-group-prepend">
						<span class="input-group-text">
							<i class="mdi mdi-account"></i>
						</span>
					</div>

				<input type="text" class="form-control" id="InputNombres"
								name="nombres" value="${usuario.nombres}"
								placeholder="Nombres del Paciente">
				</div>
			</div>
			<div class="form-group">
				<label for="InputApellidos">Apellidos</label>
				<div class="input-group">
					<div class="input-group-prepend">
						<span class="input-group-text">
							<i class="mdi mdi-account"></i>
						</span>
					</div>

				<input type="text" class="form-control" id="InputApellidos"
									name="apellidos" value="${usuario.apellidos}"
									placeholder="Apellidos del Paciente">
				</div>
			</div>
			<div class="form-group">
				<label for="InputDpi">Numero de Dpi</label>
				<div class="input-group">
					<div class="input-group-prepend">
						<span class="input-group-text">
							<i class="mdi mdi-account-card-details"></i>
						</span>
					</div>

				<input type="text" class="form-control" id="InputDpi" name="dpi"
									value="${usuario.dpi}" placeholder="Numero del cliente">
				</div>
			</div>
			<div class="form-group">
				<label for="InputFecha_Nacimiento">Fecha de Nacimiento</label>
				<div class="input-group">
					<div class="input-group-prepend">
						<span class="input-group-text">
							<i class="mdi mdi-calendar"></i>
						</span>
					</div>
				
				<input type="text" class="form-control" id="InputFecha_Nacimiento"
									name="fecha_nacimiento" value="${usuario.fecha_nacimiento}"
									placeholder="Fecha de Nacimiento del paciente">
				</div>
			</div>
			<div class="form-group">
				<label for="InputId_empresa">Sexo Del Paciente</label>								
				<select class="form-control" id="InputId_empresa" name="id_empresa">
				<option value="M">Masculino</option>
				<option value="F">Femenino</option>
				</select>
			</div>	
			<div class="form-group">
				<label for="InputAlergias">Alergias del paciente</label>
				<div class="input-group">
					<div class="input-group-prepend">
						<span class="input-group-text">
							<i class="mdi mdi-account-card-details"></i>
						</span>
					</div>
				
				<input type="text" class="form-control" id="InputAlergias"
									name="alergias" value="${usuario.alergias}"
									placeholder="Alergias del paciente">
				</div>
			</div>		  	   
			<div class="form-group">
				<label for="InputAntecedentesPersonales">Antecedentes Personales</label>
				<div class="input-group">
					<div class="input-group-prepend">
						<span class="input-group-text">
							<i class="mdi mdi-account-card-details"></i>
						</span>
					</div>
				
				<input type="text" class="form-control"
									id="InputAntecedentesPersonales" name="antecedentes_personales"
									value="${usuario.antecedentes_personales}"
									placeholder="Antecedentes Medicos del paciente">
				</div>
			</div>
			<div class="form-group">
				<label for="InputAntecedentesFamiliares">Antecedentes Familiares</label>
				<div class="input-group">
					<div class="input-group-prepend">
						<span class="input-group-text">
							<i class="mdi mdi-account-card-details"></i>
						</span>
					</div>
				
				<input type="text" class="form-control"
									id="InputAntecedentesFamiliares" name="antecedentes_familiares"
									value="${usuario.antecedentes_familiares}"
									placeholder="Antecedentes Medicos Familiares del paciente">
				</div>
			</div>
			<div class="form-group">
				<label for="InputAnotacionesImportantes">Anotaciones Importantes</label>
				<div class="input-group">
					<div class="input-group-prepend">
						<span class="input-group-text">
							<i class="mdi mdi-playlist-edit"></i>
						</span>
					</div>
				
				<input type="text" class="form-control"
									id="InputAnotacionesImportantes" name="anotaciones_importantes"
									value="${usuario.anotaciones_importantes}"
									placeholder="Antecedentes Medicos Familiares del paciente">
				</div>
			</div>
			<div class="form-group">
				<label for="InputPadre">Nombre del Padre</label>
				<div class="input-group">
					<div class="input-group-prepend">
						<span class="input-group-text">
							<i class="mdi mdi-dark mdi-account"></i>
						</span>
					</div>
				
				<input type="text" class="form-control" id="InputPadre" name="padre"
									value="${usuario.padre}"
									placeholder="Nombre del padre del paciente">
				</div>
			</div>
			<div class="form-group">
				<label for="InputMadre">Nombre de la Madre</label>
				<div class="input-group">
					<div class="input-group-prepend">
						<span class="input-group-text">
							<i class="mdi mdi-dark mdi-inactive mdi-account"></i>
						</span>
					</div>
				
				<input type="text" class="form-control" id="InputMadre" name="madre"
									value="${usuario.madre}"
									placeholder="Nombre de la madre del paciente">
				</div>
			</div>
			<div class="form-group">
				<label for="InputEncargado">Nombre del encargado del paciente</label>
				<div class="input-group">
					<div class="input-group-prepend">
						<span class="input-group-text">
							<i class="mdi mdi-dark mdi-account"></i>
						</span>
					</div>
				
				<input type="text" class="form-control" id="InputEncargado"
									name="encargado" value="${usuario.encargado}"
									placeholder="Nombre del encargado del paciente">
				</div>
			</div>
			<div class="form-group">
				<label for="InputDireccion">Direccion del paciente</label>
				<div class="input-group">
					<div class="input-group-prepend">
						<span class="input-group-text">
							<i class="mdi mdi-office-building"></i>
						</span>
					</div>
				
				<input type="text" class="form-control" id="InputDireccion"
									name="direccion" value="${usuario.direccion}"
									placeholder="Dirreccion del paciente">
				</div>
			</div>
			<div class="form-group">
				<label for="InputDpiEncargado">Numero de DPI del encargado</label>
				<div class="input-group">
					<div class="input-group-prepend">
						<span class="input-group-text">
							<i class="mdi mdi-account-card-details"></i>
						</span>
					</div>
				
				<input type="text" class="form-control" id="InputDpiEncargado"
									name="dpi_encargado" value="${usuario.dpi_encargado}"
									placeholder="Numero de DPI del encargado">
				</div>
			</div>	
			<div class="form-group">
				<label for="InputTelefono">Numero de telefono del paciente</label>
				<div class="input-group">
					<div class="input-group-prepend">
						<span class="input-group-text">
							<i class="mdi mdi-phone"></i>
						</span>
					</div>
				
				<input type="text" class="form-control" id="InputTelefono"
									name="telefono" value="${usuario.telefono}"
									placeholder="Numero de telefono del encargado">
				</div>
			</div>
			<div class="form-group">
				<label for="InputNit">Numero de nit del paciente</label>
				<div class="input-group">
					<div class="input-group-prepend">
						<span class="input-group-text">
							<i class="mdi mdi-card-text"></i>
						</span>
					</div>
				
				<input type="text" class="form-control" id="InputNit" name="nit"
									value="${usuario.nit}"
									placeholder="Numero de telefono del encargado">
				</div>
			</div>
			<div class="form-group">
				<label for="InputNombreFactura">Nombre para la factura paciente</label>
				<div class="input-group">
					<div class="input-group-prepend">
						<span class="input-group-text">
							<i class="mdi mdi-file-document-box-outline"></i>
						</span>
					</div>
				
				<input type="text" class="form-control" id="InputNombreFactura"
									name="nombre_factura" value="${usuario.nombre_factura}"
									placeholder="Nombre para la factura paciente">
				</div>
			</div>									
			<div class="form-group">
				<label for="InputDireccionFactura">Direccion para la factura paciente</label>
				<div class="input-group">
					<div class="input-group-prepend">
						<span class="input-group-text">
							<i class="mdi mdi-office-building"></i>
						</span>
					</div>
				
				<input type="text" class="form-control" id="InputDireccionFactura"
									name="direccion_factura" value="${usuario.direccion_factura}"
									placeholder="Direccion para la factura paciente">
				</div>
			</div>
			<div class="form-group">
				<label for="InputUbicacion">Ubicacion para la factura paciente</label>
				<div class="input-group">
					<div class="input-group-prepend">
						<span class="input-group-text">
							<i class="mdi mdi-google-maps"></i>
						</span>
					</div>
				
				<input type="text" class="form-control" id="InputUbicacion"
									name="ubicacion" value="${usuario.ubicacion}"
									placeholder="Ubicacion para la factura paciente">
				</div>
			</div>
			<div class="form-group">
				<label for="InputUbicacion">Numero de Expediente</label>
				<div class="input-group">
					<div class="input-group-prepend">
						<span class="input-group-text">
							<i class="mdi mdi-file"></i>
						</span>
					</div>
				
				<input type="text" class="form-control" id="No_expediente"
									name="No_expediente" value="${usuario.no_expediente}"
									placeholder="No. Expediente del paciente">
				</div>
			</div>																																																										
				   <button type="submit" class="btn btn-primary">Crear</button>
				   <button type="button" class="btn btn-danger btn-pill">Cancelar</button>
		     
					</form>
		</div>
	</div>
</div>


	</jsp:attribute>

</mt:plantilla>