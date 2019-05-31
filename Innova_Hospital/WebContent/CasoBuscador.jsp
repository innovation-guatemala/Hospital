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
														<td style="text-align: center"><a href="#Actualizar_Modal"
													class="mb-1 btn btn-sm btn-info"
													data-book-id="${n.id}" data-book-id2="${n.descripcion}"
													data-book-id3="${n.documento}" data-book-id4="${n.usuario}">
                                                		<span
														class="mdi mdi-update"> Descargar PDF</span>
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

</mt:plantilla>