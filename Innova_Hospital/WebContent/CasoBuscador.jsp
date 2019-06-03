<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<mt:plantilla tittle="BusquedaCasos">
	<jsp:attribute name="content">

			
			<div class="content-wrapper">
          		<div class=content>						 
                  <!-- Top Statistics -->
                  	<div class="row">
								<div class="col-lg-12">
									<div class="card card-default">
										<div class="card-header card-header-border-bottom">
											<h2>Busqueda de Casos</h2>
										</div>
										<div class="card-body">
											<p class="mb-5">Lista de Casos
											</p>
											<div>${mensaje}</div>
											<table id="table_id" class="table">
												<thead>
													<tr>
														<th scope="col">Id Caso</th>
														<th scope="col">Descripcion</th>
														<th scope="col">Documento seguro</th>
														<th scope="col">Usuario</th>
														<th scope="col"></th>
														<th scope="col"></th>
													</tr>
												</thead>
												<tbody>
												<c:forEach var="n" items="${lista}">
													<tr>
														<td>${n.id}</td>
														<td>${n.descripcion}</td>
														<td>${n.documento}</td>
														<td>${n.usuario}</td>
														<td style="text-align: center">
														<input id="casoidtest" type="hidden" value="${n.documento}" >
														<button type="submit" id="botonpdf" onclick="location.href='Pdf'" class="btn btn-primary">Descargar PDF</button>
														</td>
                                                		
                                                		<td
													style="text-align: center"></td>
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
					 	<div class="modal fade" id="Actualizar_Modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalFormTitle" aria-hidden="true">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalFormTitle">Actualizar Usuario</h5>
										<button type="button" class="close" data-dismiss="modal" aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">
										<form action="Usuario" method="POST"  class="form-horizontal">
                                    			<input type="hidden" name="accion" value="UPD"/>  
											<div class="form-group">
												<label for="InputNombre">Id Usuario</label>
												<input type="text" class="form-control" id="id" name="id" value=""
												 readonly=""/>
												<label for="InputNombre">Nombre</label>
												<input type="text" class="form-control" id="nombre" name="nombre" value=""
												 placeholder="Modificar el nombre del Usuario"/>
												 <label for="InputApellido">Apellido</label>
												<input type="text" class="form-control" id="apellido" name="apellido" value=""
												 placeholder="Modificar el nombre del Usuario"/>
												 <label for="InputPuesto">Puesto</label>
												<input type="text" class="form-control" id="puesto" name="puesto" value=""
												 placeholder="Modificar el nombre del Usuario"/>
												 <label for="InputPassword">Password</label>
												 <input type="password" class="form-control" id="password" name="password" value=""
								                 placeholder="Password del Usuario">
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
	$(document).ready(function(){
		
		var casoId = document.getElementById("casoidtest").value;
		alert('Mi primer alert ' + casoId);
		console.log("prueba" + casoId);
	});
	}
	
function imprimirPdf(){
	$(document).ready(function(){
		
		alert('Impresion de PDF');
		console.log("Imprimir pdf");
	});
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