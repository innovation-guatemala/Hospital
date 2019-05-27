package com.innovation.modelo;

import java.util.Date;

public class Caso {

	private int id_caso;
	private int id_forma_pago;
	private int id_empresa;
	private Date fecha;
	private int id_paciente;
	private String descripcion;
	private int id_seguro;
	private String doc_seguro;
	private boolean concluido;
	private Date fecha_concluido;
	
	public int getId_caso() {
		return id_caso;
	}
	public void setId_caso(int id_caso) {
		this.id_caso = id_caso;
	}
	public Date getFecha() {
		return fecha;
	}
	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}
	public int getId_paciente() {
		return id_paciente;
	}
	public void setId_paciente(int id_paciente) {
		this.id_paciente = id_paciente;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public int getId_seguro() {
		return id_seguro;
	}
	public void setId_seguro(int id_seguro) {
		this.id_seguro = id_seguro;
	}
	public String getDoc_seguro() {
		return doc_seguro;
	}
	public void setDoc_seguro(String doc_seguro) {
		this.doc_seguro = doc_seguro;
	}
	public boolean isConcluido() {
		return concluido;
	}
	public void setConcluido(boolean concluido) {
		this.concluido = concluido;
	}
	public Date getFecha_concluido() {
		return fecha_concluido;
	}
	public void setFecha_concluido(Date fecha_concluido) {
		this.fecha_concluido = fecha_concluido;
	}
	public int getId_forma_pago() {
		return id_forma_pago;
	}
	public void setId_forma_pago(int id_forma_pago) {
		this.id_forma_pago = id_forma_pago;
	}
	public int getId_empresa() {
		return id_empresa;
	}
	public void setId_empresa(int id_empresa) {
		this.id_empresa = id_empresa;
	}
	
}
