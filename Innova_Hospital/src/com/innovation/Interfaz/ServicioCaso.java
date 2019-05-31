package com.innovation.Interfaz;

import java.util.List;

import com.innovation.modelo.Caso;
import com.innovation.modelo.Paciente;

public interface ServicioCaso {

	public List<Caso> mostra();
	
	public void Insertar(Caso caso);
	
	public List<Caso> BuscarCaso();
	
	public List<Paciente> BuscarPaciente();
	
	public void Actualizar(Caso caso);
	
	public void Eliminar(int id);
	
	public String GetMensaje();
	
}
