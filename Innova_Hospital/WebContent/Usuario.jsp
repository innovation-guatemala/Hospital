<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<mt:plantilla tittle="UsuarioModificar">
	<jsp:attribute name="content">
	
    	 	<div class="content-wrapper">
          		<div class=content>						 
                  <!-- Top Statistics -->
                  	<div class="row">
								<div class="col-lg-12">
									<div class="card card-default">
										<div class="card-header card-header-border-bottom">
											<h2>Modificar Usuarios</h2>
										</div>
										<div class="card-body">
											<p class="mb-5">Lista de Usuarios
											</p>
											<div>${mensaje}</div>
											<table id="table_id" class="table">
												<thead>
													<tr>
														<th scope="col">Id</th>
														<th scope="col">Nombre</th>
														<th scope="col">Apellido</th>
														<th scope="col">Puesto</th>
														<th scope="col"></th>
														<th scope="col"></th>
													</tr>
												</thead>
												<tbody>
												<c:forEach var="n" items="${lista}">
													<tr>
														<td>${n.id}</td>
														<td>${n.nombre}</td>
														<td>${n.apellido}</td>
														<td>${n.puesto}</td>
														<td style="text-align: center"><a href="#Actualizar_Modal" data-toggle="modal"
													class="mb-1 btn btn-sm btn-info"
													data-book-id="${n.id}" data-book-id2="${n.nombre}"
													data-book-id3="${n.apellido}" data-book-id4="${n.puesto}" data-book-id5="${n.password}">
                                                		<span class="mdi mdi-update"> Actualizar</span>
												</a></td>
                                                		
                                                		<td
													style="text-align: center"><a href="#Eliminar_Modal" class="mb-1 btn btn-sm btn-danger" 
                                               			data-toggle="modal" data-book-id="${n.id}" >
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
                                    			<input type="hidden" name="accion" value="ACT"/>  
											<div class="form-group">
												<label for="InputId">Id Usuario</label>
												<input type="text" class="form-control" id="id_usu" name="id_usu" value=""
												 readonly=""/>
												<label for="InputNombre">Nombre</label>
												<input type="text" class="form-control" id="nombre" name="nombre" value=""
												 placeholder="Modificar Nombre"/>
												 <label for="InputApellido">Apellido</label>
												<input type="text" class="form-control" id="apellido" name="apellido" value=""
												 placeholder="Modificar Apellido"/>
												 <label for="InputPuesto">Puesto</label>
												<input type="text" class="form-control" id="puesto" name="puesto" value=""
												 placeholder="Modificar Puesto"/>
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
<script src="Resources/assets/datatable/jquery.dataTables.min.js" type="text/javascript"></script>
<script src="Resources/assets/datatable/dataTables.jqueryui.min.js" type="text/javascript"></script>
        
	<script type="text/javascript">
$('#Actualizar_Modal').on('show.bs.modal', function(e) {
    var bookId = $(e.relatedTarget).data('book-id');
    var bookId2 = $(e.relatedTarget).data('book-id2');
    var bookId3 = $(e.relatedTarget).data('book-id3');
    var bookId4 = $(e.relatedTarget).data('book-id4');
    var bookId5 = $(e.relatedTarget).data('book-id5');
    $(e.currentTarget).find('input[name="id_usu"]').val(bookId);
    $(e.currentTarget).find('input[name="nombre"]').val(bookId2);
    $(e.currentTarget).find('input[name="apellido"]').val(bookId3);
    $(e.currentTarget).find('input[name="puesto"]').val(bookId4);
    $(e.currentTarget).find('input[name="password"]').val(bookId5);
    
});


$(document).ready(function () {
    $('#table_id').dataTable({
        "lengthMenu": [7, 10, 25, 50, 75, 100],
        "language": {
            "lengthMenu": 'Mostrar <select>' +
                    '<option value="7">7</option>' +
                    '<option value="10">10</option>' +
                    '<option value="25">25</option>' +
                    '<option value="50">50</option>' +
                    '<option value="75">75</option>' +
                    '<option value="100">100</option>' +
                    '<option value="-1">Todo</option>' +
                    '</select>',
            "search": "Buscar:",
            "info": "Mostrando pagina _PAGE_ de _PAGES_",
            "paginate": {
                "previous": "Atras",
                "next": "Adelante"
            }
        }
    });
});

console.log("hello world");
</script>
</jsp:attribute>	
</mt:plantilla>