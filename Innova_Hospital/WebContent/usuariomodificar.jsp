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
													</tr>
												</thead>
												<tbody>
												<c:forEach var="n" items="${lista}">
													<tr>
														<td>$.{n.id_acceso}</td>
														<td>${n.nombre}</td>
														<td>${n.apellido}</td>
														<td>${n.puesto}</td>
														<td style="text-align: center"><a
													class="mb-1 btn btn-sm btn-info"
													data-book-id="${n.id_acceso}" data-book-id2="${n.nombre}"
													data-book-id3="${n.apellido}" data-book-id4="${n.puesto}">
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
	</jsp:attribute>

</mt:plantilla>