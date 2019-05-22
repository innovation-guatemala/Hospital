package com.innovation.Interfaz;

import java.util.List;

import com.innovation.modelo.Paciente;


public interface ServicioPaciente {

	public List<Paciente> mostra();
	
	public void Insertar(Paciente usuario);
	
	public Paciente Buscar(int id);
	
	public void Actualizar(Paciente usuario);
	
	public void Eliminar(int id);
	
	public String GetMensaje();
	
}
