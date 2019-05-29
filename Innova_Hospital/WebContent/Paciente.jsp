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
														<th scope="col">No. Expediente</th>
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
														<td style="text-align: center"><a href="#ActPaci" data-toggle="modal" class="mb-1 btn btn-sm btn-info"
													data-book-id="${n.id_paciente}"
													data-book-id2="${n.nombres}" data-book-id3="${n.apellidos}"
													data-book-id4="${n.dpi}"
													data-book-id5="${n.fecha_nacimiento}"
													data-book-id6="${n.telefono}"
													data-book-id6="${n.no_expediente}">
                                                	<span class="mdi mdi-update"> Actualizar</span>
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
					 	<div class="modal fade" id="ActPaci" tabindex="-1" role="dialog" aria-labelledby="ModalPaciente" aria-hidden="true">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="ModalPaciente">Actualizar Usuario</h5>
										<button type="button" class="close" data-dismiss="modal" aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">
										<form action="Paciente" method="POST" class="form-horizontal">
                                    			<input type="hidden" name="accion" value="ACT" />  
										<div class="form-group">
												<label for="InputId">Id Paciente</label>
												<input type="text" class="form-control" id="id_paci" name="id_paci" value=""
												 readonly=""/>
												<label for="InputNombre">Nombres</label>
												<input type="text" class="form-control" id="nombres" name="nombres" value=""
												 placeholder="Modificar Nombres"/>
												 <label for="InputApellido">Apellidos</label>
												<input type="text" class="form-control" id="apellidos" name="apellidos" value=""
												 placeholder="Modificar Apellidos"/>
												 <label for="InputPuesto">DPI</label>
												<input type="text" class="form-control" id="dpi" name="dpi" value=""
												 placeholder="Modificar DPI"/>
												 <label for="InputPuesto">Fecha nacimiento</label>
												<input type="text" class="form-control" id="fec_nac" name="fec_nac" value=""
												 placeholder="Modificar Fecha nacimiento"/>
												 <label for="InputPuesto">alergias</label>
												<input type="text" class="form-control" id="alergias" name="alergias" value=""
												 placeholder="Modificar Fecha nacimiento"/>
												 <label for="InputPuesto">Antecedentes Personales</label>
												<input type="text" class="form-control" id="ant_per" name="ant_per" value=""
												 placeholder="Modificar Antecendentes Personales"/>
												 <label for="InputPuesto">Antecedentes Familiares</label>
												<input type="text" class="form-control" id="ant_fam" name="ant_fam" value=""
												 placeholder="Modificar Antecendetes Familiares"/>
												 <label for="InputPuesto">Anotaciones Importantes</label>
												<input type="text" class="form-control" id="ano_imp" name="ano_imp" value=""
												 placeholder="Modificar Anotaciones Importantes"/>
												 <label for="InputPuesto">Encargado</label>
												<input type="text" class="form-control" id="encargado" name="encargado" value=""
												 placeholder="Modificar Encargado"/>
												 <label for="InputPuesto">Direccion</label>
												<input type="text" class="form-control" id="dir" name="dir" value=""
												 placeholder="Modificar Direccion"/>
												 <label for="InputPuesto">DPI Encargado</label>
												<input type="text" class="form-control" id="dpi_enc" name="dpi_enc" value=""
												 placeholder="Modificar el DPI del Encargado"/>
												 <label for="InputPuesto">telefono</label>
												<input type="text" class="form-control" id="tel" name="tel" value=""
												 placeholder="Modificar Telefono"/>
												 <label for="InputPuesto">NIT</label>
												<input type="text" class="form-control" id="nit" name="nit" value=""
												 placeholder="Modificar NIT"/>
												 <label for="InputPuesto">Nombre Factura</label>
												<input type="text" class="form-control" id="nom_fac" name="nom_fac" value=""
												 placeholder="Modificar Nombre de la Factura"/>
											</div>
											<button type="submit" class="btn btn-primary">Actualizar</button>
											<button type="button" class="btn btn-danger btn-pill" data-dismiss="modal">Cancelar</button>
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


</script>
</jsp:attribute>
</mt:plantilla>