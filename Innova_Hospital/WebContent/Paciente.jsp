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
														<td style="text-align: center">
														<input id="alergiasin" name="alergiasin" type="hidden" value="${n.alergias}">
														<a href="#ActPaci" onClick="copiarDatos()" data-toggle="modal" class="mb-1 btn btn-sm btn-info"
													data-book-id="${n.id_paciente}" data-book-id2="${n.nombres}" data-book-id3="${n.apellidos}"
													data-book-id4="${n.alergias}" data-book-id5="${n.antecedentes_personales}" data-book-id6="${n.antecedentes_familiares}"
													data-book-id7="${n.anotaciones_importantes}" data-book-id8="${n.encargado}" data-book-id9="${n.direccion}"
													data-book-id10="${n.dpi_encargado}" data-book-id11="${n.telefono}" data-book-id12="${n.nit}"
													data-book-id13="${n.nombre_factura}" data-book-id14="${n.direccion_factura}" 
													data-book-id15="${n.ubicacion}" data-book-id16="${n.no_expediente}">
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
                                    			<input type="hidden" name="accion" value="UPD" />  
										<div class="form-group">
												<label for="InputId">Id Paciente</label>
												<input type="text" class="form-control" id="id_paci" name="id_paci" value=""
												 readonly=""/><br>
												<label for="InputNombre">Nombres</label>
												<input type="text" class="form-control" id="nombres" name="nombres" value=""
												 placeholder="Modificar Nombres"/><br>
												 <label for="InputApellido">Apellidos</label>
												<input type="text" class="form-control" id="apellidos" name="apellidos" value=""
												 placeholder="Modificar Apellidos"/><br>
												 <label for="InputAlergia">alergias</label>
												<textarea class="form-control" id="alergias" name="alergias" rows="3" maxlength="100">
												</textarea><br>
												 <label for="InputAntPer">Antecedentes Personales</label>
												<input type="text" class="form-control" id="ant_per" name="ant_per" value=""
												 placeholder="Modificar Antecendentes Personales"/><br>
												 <label for="InputAntPer">Antecedentes Familiares</label>
												<input type="text" class="form-control" id="ant_fam" name="ant_fam" value=""
												 placeholder="Modificar Antecendetes Familiares"/><br>
												 <label for="InputAnotaciones">Anotaciones Importantes</label>
												<input type="text" class="form-control" id="ano_imp" name="ano_imp" value=""
												 placeholder="Modificar Anotaciones Importantes"/><br>
												 <label for="InputEncargado">Encargado</label>
												<input type="text" class="form-control" id="encargado" name="encargado" value=""
												 placeholder="Modificar Encargado"/><br>
												 <label for="InputDir">Direccion</label>
												<input type="text" class="form-control" id="dir" name="dir" value=""
												 placeholder="Modificar Direccion"/><br>
												 <label for="InputDPIEnc">DPI Encargado</label>
												<input type="text" class="form-control" id="dpi_enc" name="dpi_enc" value=""
												 placeholder="Modificar el DPI del Encargado"/><br>
												 <label for="InputTelefono">telefono</label>
												<input type="text" class="form-control" id="tel" name="tel" value=""
												 placeholder="Modificar Telefono"/><br>
												 <label for="InputNIT">NIT</label>
												<input type="text" class="form-control" id="nit" name="nit" value=""
												 placeholder="Modificar NIT"/><br>
												 <label for="InputNomFac">Nombre Factura</label>
												<input type="text" class="form-control" id="nom_fac" name="nom_fac" value=""
												 placeholder="Modificar Nombre de la Factura"/><br>
												 <label for="InputDirFact">Direccion Factura</label>
												<input type="text" class="form-control" id="dir_fac" name="dir_fac" value=""
												 placeholder="Modificar Direccion de la Factura"/><br>
												 <label for="InputUbicacion">Ubicacion</label>
												<input type="text" class="form-control" id="ubi" name="ubi" value=""
												 placeholder="Modificar Ubicacion"/><br>
												 <label for="InputExpediente">No. Expediente</label>
												<input type="text" class="form-control" id="no_ex" name="no_ex" value=""
												 placeholder="Modificar el numero de expediente"/>
											</div>
											<button type="submit" class="btn btn-primary">Actualizar</button>
											<button type="button" class="btn btn-danger btn-pill" data-dismiss="modal">Cancelar</button>
										</form>
									</div>
								</div>
							</div>
						</div>
						
						<!-- MODAL PARA Eliminar -->
					 	<div class="modal fade" id="Eliminar_Modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">Eliminar</h5>
										<button type="button" class="close" data-dismiss="modal" aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<form action="Paciente" method="POST"  class="form-horizontal">
                                     <input type="hidden" name="accion" value="DEL"/>
									<div class="modal-body">  
										Esta seguro de eliminar al Paciente?
										<input type="hidden" class="form-control" id="id_paci" name="id_paci" value=""/>
									</div>
									<div class="modal-footer">
										<button type="submit" class="btn btn-danger btn-pill" >Eliminar</button>
										<button type="button" class="btn btn-primary btn-pill" data-dismiss="modal">Cancelar</button>
									</div>
									</form>
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

$('#ActPaci').on('show.bs.modal', function(e) {
    var bookId = $(e.relatedTarget).data('book-id');
    var bookId2 = $(e.relatedTarget).data('book-id2');
    var bookId3 = $(e.relatedTarget).data('book-id3');
    //var bookId4 = $(e.relatedTarget).data('book-id4');
    var bookId5 = $(e.relatedTarget).data('book-id5');
    var bookId6 = $(e.relatedTarget).data('book-id6');
    var bookId7 = $(e.relatedTarget).data('book-id7');
    var bookId8 = $(e.relatedTarget).data('book-id8');
    var bookId9 = $(e.relatedTarget).data('book-id9');
    var bookId10 = $(e.relatedTarget).data('book-id10');
    var bookId11 = $(e.relatedTarget).data('book-id11');
    var bookId12 = $(e.relatedTarget).data('book-id12');
    var bookId13 = $(e.relatedTarget).data('book-id13');
    var bookId14 = $(e.relatedTarget).data('book-id14');
    var bookId15 = $(e.relatedTarget).data('book-id15');
    var bookId16 = $(e.relatedTarget).data('book-id16');
    $(e.currentTarget).find('input[name="id_paci"]').val(bookId);
    $(e.currentTarget).find('input[name="nombres"]').val(bookId2);
    $(e.currentTarget).find('input[name="apellidos"]').val(bookId3);
    //$(e.currentTarget).find('input[name="alergias"]').val(bookId4);
    $(e.currentTarget).find('input[name="ant_per"]').val(bookId5);
    $(e.currentTarget).find('input[name="ant_fam"]').val(bookId6);
    $(e.currentTarget).find('input[name="ano_imp"]').val(bookId7);
    $(e.currentTarget).find('input[name="encargado"]').val(bookId8);
    $(e.currentTarget).find('input[name="dir"]').val(bookId9);
    $(e.currentTarget).find('input[name="dpi_enc"]').val(bookId10);
    $(e.currentTarget).find('input[name="tel"]').val(bookId11);
    $(e.currentTarget).find('input[name="nit"]').val(bookId12);
    $(e.currentTarget).find('input[name="nom_fac"]').val(bookId13);
    $(e.currentTarget).find('input[name="dir_fac"]').val(bookId14);
    $(e.currentTarget).find('input[name="ubi"]').val(bookId15);
    $(e.currentTarget).find('input[name="no_ex"]').val(bookId16);
    
});

function copiarDatos(){

	  var bookId4 = document.getElementById("alergiasin").value;
	  
	  document.getElementById("alergias").innerHTML = bookId4;

	}
	
$('#Eliminar_Modal').on('show.bs.modal', function(e) {
    var bookId = $(e.relatedTarget).data('book-id');
    $(e.currentTarget).find('input[name="id_paci"]').val(bookId);
});


$(document).ready(function() {
	$('#table_id').dataTable( {
		"lengthMenu" : [ 7, 10, 25, 50, 75, 100 ],
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