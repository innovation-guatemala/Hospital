<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<mt:plantilla tittle="UsuarioModificar">
	<jsp:attribute name="content">
	
    	 	<div class="content-wrapper">
          		<div class="content">						 
                  <!-- Top Statistics -->
                  	<div class="row">
								<div class="col-lg-6">
									<div class="card card-default">
										<div class="card-header card-header-border-bottom">
											<h2>Departamento</h2>
										</div>
										<div class="card-body">
											<p class="mb-5">Lista de Usuario
											</p>
											<table id="table_id" class="table">
												<tbody>
												<c:forEach var="n" items="${listaUsuario}">
													<tr>
														<td>${n.nombre}</td>
														<td style="text-align: center"><a
													class="mb-1 btn btn-sm btn-info"
													data-toggle="modal" data-book-id="${n.id_acceso}"
													data-book-id2="${n.nombre}">
                                                		<span
														class="mdi mdi-update"> Actualizar</span>
												</a></td>
                                                		
                                                		<td
													style="text-align: center"><a class="mb-1 btn btn-sm btn-danger" data-toggle="modal"
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
	
	
	</jsp:attribute>

</mt:plantilla>