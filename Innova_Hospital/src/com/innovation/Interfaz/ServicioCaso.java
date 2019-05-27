package com.innovation.Interfaz;

import java.util.List;

import com.innovation.modelo.Caso;


public interface ServicioCaso {

	public List<Caso> mostra();
	
	public void Insertar(Caso caso);
	
	public Caso Buscar(int id);
	
	public void Actualizar(Caso caso);
	
	public void Eliminar(int id);
	
	public String GetMensaje();
	
}
