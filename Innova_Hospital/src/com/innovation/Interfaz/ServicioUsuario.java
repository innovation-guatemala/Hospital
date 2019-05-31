package com.innovation.Interfaz;

import java.util.List;

import com.innovation.modelo.Usuario;;


public interface ServicioUsuario {

	public List<Usuario> mostra();
	
	public void Insertar(Usuario usuario);
	
	public void Actualizar(Usuario usuario);
	
	public void Eliminar(int id);
	
	public String GetMensaje();
	
	public int Validar(String usuario, String pass);
	
}
