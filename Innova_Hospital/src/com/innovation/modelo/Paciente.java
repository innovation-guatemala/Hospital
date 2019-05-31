package com.innovation.modelo;

import java.util.Date;

public class Paciente {

	private int id_paciente;
	private String nombres;
	private String apellidos;
	private String dpi;
	private Date fecha_nacimiento;
	private String sexo;
	private String alergias;
	private String antecedentes_personales;
	private String antecedentes_familiares;
	private String anotaciones_importantes;
	private String padre;
	private String madre;
	private String encargado;
	private String direccion;
	private String dpi_encargado;
	private String telefono;
	private String nit;
	private String nombre_factura;
	private String direccion_factura;
	private String ubicacion;
	private String no_expediente;
	
	public int getId_paciente() {
		return id_paciente;
	}
	public void setId_paciente(int id_paciente) {
		this.id_paciente = id_paciente;
	}
	public String getNombres() {
		return nombres;
	}
	public void setNombres(String nombres) {
		this.nombres = nombres;
	}
	public String getApellidos() {
		return apellidos;
	}
	public void setApellidos(String apellidos) {
		this.apellidos = apellidos;
	}
	public String getDpi() {
		return dpi;
	}
	public void setDpi(String dpi) {
		this.dpi = dpi;
	}
	public Date getFecha_nacimiento() {
		return fecha_nacimiento;
	}
	public void setFecha_nacimiento(Date fecha_nacimiento) {
		this.fecha_nacimiento = fecha_nacimiento;
	}
	public String getSexo() {
		return sexo;
	}
	public void setSexo(String sexo) {
		this.sexo = sexo;
	}
	public String getAlergias() {
		return alergias;
	}
	public void setAlergias(String alergias) {
		this.alergias = alergias;
	}
	public String getAntecedentes_personales() {
		return antecedentes_personales;
	}
	public void setAntecedentes_personales(String antecedentes_personales) {
		this.antecedentes_personales = antecedentes_personales;
	}
	public String getAntecedentes_familiares() {
		return antecedentes_familiares;
	}
	public void setAntecedentes_familiares(String antecedentes_familiares) {
		this.antecedentes_familiares = antecedentes_familiares;
	}
	public String getAnotaciones_importantes() {
		return anotaciones_importantes;
	}
	public void setAnotaciones_importantes(String anotaciones_importantes) {
		this.anotaciones_importantes = anotaciones_importantes;
	}
	public String getPadre() {
		return padre;
	}
	public void setPadre(String padre) {
		this.padre = padre;
	}
	public String getMadre() {
		return madre;
	}
	public void setMadre(String madre) {
		this.madre = madre;
	}
	public String getEncargado() {
		return encargado;
	}
	public void setEncargado(String encargado) {
		this.encargado = encargado;
	}
	public String getDireccion() {
		return direccion;
	}
	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}
	public String getDpi_encargado() {
		return dpi_encargado;
	}
	public void setDpi_encargado(String dpi_encargado) {
		this.dpi_encargado = dpi_encargado;
	}
	public String getTelefono() {
		return telefono;
	}
	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}
	public String getNit() {
		return nit;
	}
	public void setNit(String nit) {
		this.nit = nit;
	}
	public String getNombre_factura() {
		return nombre_factura;
	}
	public void setNombre_factura(String nombre_factura) {
		this.nombre_factura = nombre_factura;
	}
	public String getUbicacion() {
		return ubicacion;
	}
	public void setUbicacion(String ubicacion) {
		this.ubicacion = ubicacion;
	}

	public String getDireccion_factura() {
		return direccion_factura;
	}
	public void setDireccion_factura(String direccion_factura) {
		this.direccion_factura = direccion_factura;
	}
	
	public String getNo_expediente() {
		return no_expediente;
	}
	public void setNo_expediente(String no_expediente) {
		this.no_expediente = no_expediente;
	}
	
}
