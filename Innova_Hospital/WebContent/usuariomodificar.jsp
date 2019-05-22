<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<mt:plantilla tittle="Usuario">
	<jsp:attribute name="content">
	
    	 	<div class="content-wrapper">
          		<div class=content>						 
                  <!-- Top Statistics -->
                  	<div class="row">
								<div class="col-lg-6">
									<div class="card card-default">
										<div class="card-header card-header-border-bottom">
											<h2>Modificar Usuarios</h2>
										</div>
										<div class="card-body">
											<p class="mb-5">Lista de Usuarios
											</p>
											<table id="table_id" class="table">
												<thead>
													<tr>
														<th scope="col">Id</th>
														<th scope="col">Nombre</th>
														<th scope="col">Apellido</th>
														<th scope="col">Puesto</th>
														<th scope="col">Password</th>
													</tr>
												</thead>
												<tbody>
												<c:forEach var="n" items="${lista}">
													<tr>
														<td>${n.id_acceso}</td>
														<td>${n.nombre}</td>
														<td>${n.apellido}</td>
														<td>${n.puesto}</td>
														<td>${n.password}</td>
														<td style="text-align: center"><a href="#Actualizar_Modal"
													class="mb-1 btn btn-sm btn-info"
													data-book-id="${n.id_acceso}" data-book-id2="${n.nombre}"
													data-book-id3="${n.apellido}" data-book-id4="${n.puesto}" data-book-id5="${n.password}">
                                                		<span
														class="mdi mdi-update"> Actualizar</span>
												</a></td>
                                                		
                                                		<td
													style="text-align: center"><a
													class="mb-1 btn btn-sm btn-danger" data-toggle="modal"
													data-book-id="${n.id_acceso}">
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
                                    			<input type="hidden" name="accion" value="UPD"/>  
											<div class="form-group">
												<label for="InputNombre">Id Usuario</label>
												<input type="text" class="form-control" id="id_acceso" name="id_acceso" value=""
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