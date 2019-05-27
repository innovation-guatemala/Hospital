<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<mt:plantilla tittle="Caso">
	<jsp:attribute name="content">
	
	
<div
			class="invoice-wrapper rounded border bg-white py-5 px-3 px-md-4 px-lg-5">
	<div class="card card-default">
		<div class="card-header card-header-border-bottom">
			<h2>Formulario para creacion de Casos</h2>
		</div>
		<div class="card-body">
		<form action="Caso" method="POST" class="form-horizontal">
		<input type="hidden" name="accion" value="INS" />
			<div class="form-group">
				<label for="InputId_caso">Numero de caso</label>
				<div class="input-group">
					<div class="input-group-prepend">
						<span class="input-group-text">
							<i class="mdi mdi-account-card-details"></i>
						</span>
					</div>

				<input type="text" class="form-control" id="InputId_caso" name="id_caso"
									value="${usuario.id_caso}" placeholder="Numero del caso">
				</div>
			</div>
			<div class="form-group">
				<label for="InputFecha">Fecha</label>
				<div class="input-group">
					<div class="input-group-prepend">
						<span class="input-group-text">
							<i class="mdi mdi-calendar"></i>
						</span>
					</div>
				
				<input type="text" class="form-control" id="InputFecha"
									name="fecha" value="${usuario.fecha}"
									placeholder="Fecha de creacion de caso">
				</div>
			</div>
			<div class="form-group">
				<label for="exampleFormControlSelect12">Forma de Pago</label>								
				<select class="form-control" id="exampleFormControlSelect12">
				<option value =1>Centro Medico Sanarateco</option>
				<option value = 2>Cheque o Deposito</option>
				<option>Credito</option>
				<option>Tarjeta de Credito</option>
				</select>			
			</div>
			<div class="form-group">
				<label for="exampleFormControlSelect12">Empresa</label>								
				<select class="form-control" id="exampleFormControlSelect12">
				<option>Centro Medico Sanarateco</option>
				<option>Seinsa</option>
				</select>
			</div>		  	   
			<div class="form-group">
				<label for="exampleFormControlSelect12">Paciente</label>								
				<select class="form-control" id="exampleFormControlSelect12">
				<c:forEach var="n" items="${listapaci}">
				<option>${n.nombres}</option>
				</c:forEach>
				</select>			
			</div>
			<div class="form-group">
				<label for="InputDescripcion">Descripcion</label>
				<div class="input-group">
					<div class="input-group-prepend">
						<span class="input-group-text">
							<i class="mdi mdi-account-card-details"></i>
						</span>
					</div>
				
				<input type="text" class="form-control"
									id="InputDescripcion" name="descripcion"
									value="${usuario.descripcino}"
									placeholder="Descripcion del caso">
				</div>
			</div>
			<div class="form-group">
				<label for="exampleFormControlSelect12">Seguro</label>								
				<select class="form-control" id="exampleFormControlSelect12">
				<option>Centro Medico Sanarateco</option>
				<option>Seinsa</option>
				</select>
	     	</div>
			<div class="form-group">
				<label for="InputDoc_seguro">Doc Seguro</label>
				<div class="input-group">
					<div class="input-group-prepend">
						<span class="input-group-text">
							<i class="mdi mdi-dark mdi-account"></i>
						</span>
					</div>
				
				<input type="text" class="form-control" id="InputDoc_seguro" name="doc_seguro"
									value="${usuario.doc_seguro}"
									placeholder="Numero de documento del seguro">
				</div>
			</div>
			<div class="form-group">
				<label><input type="checkbox" id="concluido" value="first_checkbox"> Concluido</label><br>
			</div>
						<div class="form-group">
				<label for="InputFecha_concluido">Fecha Concluido</label>
				<div class="input-group">
					<div class="input-group-prepend">
						<span class="input-group-text">
							<i class="mdi mdi-calendar"></i>
						</span>
					</div>
				
				<input type="text" class="form-control" id="InputFecha_concluido"
									name="fecha_concluido" value="${usuario.fecha_concluido}"
									placeholder="Fecha de conclusion de caso">
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