<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<mt:plantilla tittle="PacienteModificar">
	<jsp:attribute name="content">
	
    	 	<div class="content-wrapper">
          		<div class=content>						 
                  <!-- Top Statistics -->
                  	<div class="row">
								<div class="col-lg-12">
									<div class="card card-default">
										<div class="card-header card-header-border-bottom">
											<h2>Modificar Paciente</h2>
										</div>
										<div class="card-body">
											<p class="mb-5">Lista de Pacientes
											</p>
											<div>${mensaje}</div>
											<table id="table_id" class="table">
												<thead>
													<tr>
														<th scope="col">Id</th>
														<th scope="col">Nombres</th>
														<th scope="col">Apellidos</th>
														<th scope="col">Dpi</th>
														<th scope="col">Fecha Nacimiento</th>
														<th scope="col">Telefono</th>
														<th scope="col">No. Expediente
														
											
											<th>
											
											<th scope="col"></th>
														<th scope="col"></th>
													</tr>
												</thead>
												<tbody>
												<c:forEach var="n" items="${lista}">
													<tr>
														<td>${n.id_paciente}</td>
														<td>${n.nombres}</td>
														<td>${n.apellidos}</td>
														<td>${n.dpi}</td>
														<td>${n.fecha_nacimiento}</td>
														<td>${n.telefono}</td>
														<td>${n.no_expediente}</td>
														<td style="text-align: center"><a
													href="#Actualizar_Modal" data-toggle="modal"
													class="mb-1 btn btn-sm btn-info"
													data-book-id="${n.id_paciente}"
													data-book-id2="${n.nombres}" data-book-id3="${n.apellidos}"
													data-book-id4="${n.dpi}"
													data-book-id5="${n.fecha_nacimiento}"
													data-book-id6="${n.telefono}"
													data-book-id6="${n.no_expediente}">
                                                		<span
														class="mdi mdi-update"> Actualizar</span>
												</a></td>
                                                		
                                                		<td
													style="text-align: center"><a href="#Eliminar_Modal"
													class="mb-1 btn btn-sm btn-danger" data-toggle="modal"
													data-book-id="${n.id_paciente}">
                                                		<span
														class="mdi mdi-delete"> Eliminar</span>
												</a></td>
													</tr>
												</c:forEach>
												</tbody>
											</table>
										</div>
									</div>
								</div>
						</div>
					<br />	
				</div>
			</div>
			
			<!-- MODAL PARA Actualizar -->
					 	<div class="modal fade" id="Actualizar_Modal" tabindex="-1"	role="dialog" aria-labelledby="exampleModalFormTitle" aria-hidden="true">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalFormTitle">Actualizar Usuario</h5>
										<button type="button" class="close" data-dismiss="modal" aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">
										<form action="Paciente" method="POST" class="form-horizontal">
                                    			<input type="hidden" name="accion" value="ACT" />  
										<div class="form-group">
										<label for="InputNombres">Nombres</label>
										<div class="input-group">
										<div class="input-group-prepend">
											<span class="input-group-text"><i class="mdi mdi-account"></i></span>
									</div>
										<input type="text" class="form-control" id="InputNombres" name="nombres" value="${usuario.nombres}" placeholder="Nombres del Paciente">
									</div>
									</div>
									<div class="form-group">
									    <label for="InputApellidos">Apellidos</label>
				                    <div class="input-group">
					                <div class="input-group-prepend">
						                <span class="input-group-text"><i class="mdi mdi-account"></i></span>
					                </div>
                       				    <input type="text" class="form-control" id="InputApellidos"	name="apellidos" value="${usuario.apellidos}" placeholder="Apellidos del Paciente">
                     				</div>
			                        </div>
			                        <div class="form-group">
				                        <label for="InputDpi">Numero de Dpi</label>
				                    <div class="input-group">
					                <div class="input-group-prepend">
						                <span class="input-group-text"><i class="mdi mdi-account-card-details"></i></span>
  					                </div>
                        				<input type="text" class="form-control" id="InputDpi" name="dpi" value="${usuario.dpi}" placeholder="Numero del cliente">
				                    </div>
			                        </div>
			                        <div class="form-group">
				                        <label for="InputFecha_Nacimiento">Fecha de Nacimiento</label>
				                    <div class="input-group">
					                <div class="input-group-prepend">
						                <span class="input-group-text"><i class="mdi mdi-calendar"></i></span>
					                </div>
				             			<input type="text" class="form-control" id="InputFecha_Nacimiento" name="fecha_nacimiento" value="${usuario.fecha_nacimiento}" placeholder="Fecha de Nacimiento del paciente">
				                    </div>
			                        </div>
			                        <div class="form-group">
				                        <label for="InputSexo">Sexo del paciente</label>
				                    <div class="input-group">
					                <div class="input-group-prepend">
						                <span class="input-group-text"><i class="mdi mdi-account-arrow-right-outline"></i></span>
					                </div>
				                		<input type="text" class="form-control" id="InputSexo" name="sexo" value="${usuario.sexo}" placeholder="Sexo del paciente">
     				                </div>
			                        </div>
			                        <div class="form-group">
				                        <label for="InputAlergias">Alergias del paciente</label>
				                    <div class="input-group">
					                <div class="input-group-prepend">
						                <span class="input-group-text"><i class="mdi mdi-account-card-details"></i></span>
					                </div>
				        				<input type="text" class="form-control" id="InputAlergias" name="alergias" value="${usuario.alergias}"	placeholder="Alergias del paciente">
				        			</div>
			                        </div>		  	   
			                        <div class="form-group">
				                        <label for="InputAntecedentesPersonales">Antecedentes Personales</label>
				                    <div class="input-group">
					                <div class="input-group-prepend">
						                <span class="input-group-text"><i class="mdi mdi-account-card-details"></i></span>
       					            </div>
				                        <input type="text" class="form-control"	id="InputAntecedentesPersonales" name="antecedentes_personales"	value="${usuario.antecedentes_personales}" placeholder="Antecedentes Medicos del paciente">
				                    </div>
			                        </div>
			                        <div class="form-group">
				                        <label for="InputAntecedentesFamiliares">Antecedentes Familiares</label>
				                    <div class="input-group">
					                <div class="input-group-prepend">
						                <span class="input-group-text"><i class="mdi mdi-account-card-details"></i></span>
     					            </div>
				                        <input type="text" class="form-control"	id="InputAntecedentesFamiliares" name="antecedentes_familiares"	value="${usuario.antecedentes_familiares}" placeholder="Antecedentes Medicos Familiares del paciente">
				                    </div>
			                        </div>
			                        <div class="form-group">
				                        <label for="InputAnotacionesImportantes">Anotaciones Importantes</label>
				                    <div class="input-group">
					                <div class="input-group-prepend">
						                <span class="input-group-text"><i class="mdi mdi-playlist-edit"></i></span>
					                </div>
				                        <input type="text" class="form-control"	id="InputAnotacionesImportantes" name="anotaciones_importantes" value="${usuario.anotaciones_importantes}"	placeholder="Antecedentes Medicos Familiares del paciente">
				                    </div>
			                        </div>
			                        <div class="form-group">
				                        <label for="InputPadre">Nombre del Padre</label>
				                    <div class="input-group">
					                <div class="input-group-prepend">
						                <span class="input-group-text"><i class="mdi mdi-dark mdi-account"></i></span>
					                </div>
				                        <input type="text" class="form-control" id="InputPadre" name="padre" value="${usuario.padre}" placeholder="Nombre del padre del paciente">
				                    </div>
			                        </div>
			                        <div class="form-group">
				                        <label for="InputMadre">Nombre de la Madre</label>
				                    <div class="input-group">
					                <div class="input-group-prepend">
						                <span class="input-group-text"><i class="mdi mdi-dark mdi-inactive mdi-account"></i></span>
					                </div>
				                        <input type="text" class="form-control" id="InputMadre" name="madre" value="${usuario.madre}" placeholder="Nombre de la madre del paciente">
				                    </div>
			                        </div>
			                        <div class="form-group">
				                        <label for="InputEncargado">Nombre del encargado del paciente</label>
				                    <div class="input-group">
					                <div class="input-group-prepend">
						                <span class="input-group-text"><i class="mdi mdi-dark mdi-account"></i></span>
					                </div>
 				                        <input type="text" class="form-control" id="InputEncargado" name="encargado" value="${usuario.encargado}" placeholder="Nombre del encargado del paciente">
				                    </div>
			                        </div>
			                        <div class="form-group">
				                        <label for="InputDireccion">Direccion del paciente</label>
				                    <div class="input-group">
					                <div class="input-group-prepend">
						                <span class="input-group-text"><i class="mdi mdi-office-building"></i></span>
					                </div>
 				                        <input type="text" class="form-control" id="InputDireccion"	name="direccion" value="${usuario.direccion}" placeholder="Dirreccion del paciente">
				                    </div>
			                        </div>
			                        <div class="form-group">
				                        <label for="InputDpiEncargado">Numero de DPI del encargado</label>
				                    <div class="input-group">
					                <div class="input-group-prepend">
						                <span class="input-group-text"><i class="mdi mdi-account-card-details"></i></span>
					                </div>
				                        <input type="text" class="form-control" id="InputDpiEncargado" name="dpi_encargado" value="${usuario.dpi_encargado}" placeholder="Numero de DPI del encargado">
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
											<button type="submit" class="btn btn-primary">Actualizar</button>
											<button type="button" class="btn btn-danger btn-pill"
								data-dismiss="modal">Cancelar</button>
										</form>
									</div>
								</div>
							</div>
						</div>

	</jsp:attribute>
	<jsp:attribute name="content_js">
<script src="Resources/assets/datatable/jquery.dataTables.min.js"
			type="text/javascript"></script>
<script src="Resources/assets/datatable/dataTables.jqueryui.min.js"
			type="text/javascript"></script>
        
	<script type="text/javascript">
		$('#Actualizar_Modal').on(
				'show.bs.modal',
				function(e) {
					var bookId = $(e.relatedTarget).data('book-id');
					var bookId2 = $(e.relatedTarget).data('book-id2');
					var bookId3 = $(e.relatedTarget).data('book-id3');
					var bookId4 = $(e.relatedTarget).data('book-id4');
					var bookId5 = $(e.relatedTarget).data('book-id5');
					var bookId5 = $(e.relatedTarget).data('book-id6');
					var bookId7 = $(e.relatedTarget).data('book-id7');
					$(e.currentTarget).find('input[name="id_paciente"]').val(
							bookId);
					$(e.currentTarget).find('input[name="nombres"]').val(
							bookId2);
					$(e.currentTarget).find('input[name="apellidos"]').val(
							bookId3);
					$(e.currentTarget).find('input[name="dpi"]').val(bookId4);
					$(e.currentTarget).find('input[name="fecha_nacimiento"]')
							.val(bookId5);
					$(e.currentTarget).find('input[name="telefono"]').val(
							bookId6);
					$(e.currentTarget).find('input[name="no_expediente"]').val(
							bookId7);

				});

		$(document)
				.ready(
						function() {
							$('#table_id')
									.dataTable(
											{
												"lengthMenu" : [ 7, 10, 25, 50,
														75, 100 ],
												"language" : {
													"lengthMenu" : 'Mostrar <select>'
															+ '<option value="7">7</option>'
															+ '<option value="10">10</option>'
															+ '<option value="25">25</option>'
															+ '<option value="50">50</option>'
															+ '<option value="75">75</option>'
															+ '<option value="100">100</option>'
															+ '<option value="-1">Todo</option>'
															+ '</select>',
													"search" : "Buscar:",
													"info" : "Mostrando pagina _PAGE_ de _PAGES_",
													"paginate" : {
														"previous" : "Atras",
														"next" : "Adelante"
													}
												}
											});
						});

		console.log("hello world");
	</script>
</jsp:attribute>
</mt:plantilla>