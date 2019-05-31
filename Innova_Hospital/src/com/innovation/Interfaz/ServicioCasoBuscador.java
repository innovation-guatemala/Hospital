package com.innovation.Interfaz;

import java.util.List;

import com.innovation.modelo.CasoBuscador;


public interface ServicioCasoBuscador {

	public List<CasoBuscador> mostra();
	
	public void Insertar(CasoBuscador usuario);
	
	public CasoBuscador Buscar(int id);
	
	public void Actualizar(CasoBuscador usuario);
	
	public void Eliminar(int id);
	
	public String GetMensaje();
	
	public int Validar(String usuario, String pass);

	
}
