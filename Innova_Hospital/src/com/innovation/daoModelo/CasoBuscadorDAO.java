package com.innovation.daoModelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

import com.innovation.DAO.Conexion;
import com.innovation.Interfaz.ServicioCasoBuscador;
import com.innovation.modelo.CasoBuscador;

public class CasoBuscadorDAO implements ServicioCasoBuscador {

	private final Conexion db = new Conexion();
	private String mensaje;
	
	public List<CasoBuscador> mostra() {
		
		List<CasoBuscador> lista = null;
		String sentencia = "select id_caso,descripcion,doc_seguro,usuario_creacion from caso";
		Connection cn = db.Conectar();
		if (cn != null) {
			try {
				PreparedStatement st = cn.prepareStatement(sentencia);
				ResultSet rs = st.executeQuery();
				lista = new LinkedList<CasoBuscador>();
				while (rs.next()) {
					CasoBuscador caso = new CasoBuscador();
					caso.setId(rs.getInt(1));
					caso.setDescripcion(rs.getString(2));
					caso.setDocumento(rs.getString(3));
					caso.setUsuario(rs.getString(4));				
					lista.add(caso);
				}
				st.close();
			} catch (SQLException e) {
				SetMensaje("Problema con mostrar: " + e.getMessage());
			} finally {
				try {
					cn.close();
				}catch (SQLException ex) {
					 SetMensaje(ex.getMessage());
				}
			}
		} else {
			SetMensaje("Error de conexion: " + db.GetMessage());
		}
		
		return lista;
	}

	
	@Override
	public CasoBuscador Buscar(int id) {
		CasoBuscador caso = null;
		String sentencia = " select id_caso,descripcion,doc_seguro,usuario_creacion from caso where id_caso =  ?";
		Connection cn = db.Conectar();
		if (cn != null ) {
			try {
				PreparedStatement st = cn.prepareStatement(sentencia);
				st.setInt(1, id);
				ResultSet rs = st.executeQuery();
				while (rs.next()) {
					caso.setId(rs.getInt(1));
					caso.setDescripcion(rs.getString(2));
					caso.setDocumento(rs.getString(3));
					caso.setUsuario(rs.getString(4));	
				}
				st.close();
			} catch (SQLException e) {
				SetMensaje("Problema con Consultar: " + e.getMessage());
			} finally {
				try {
					cn.close();
				}catch (SQLException ex) {
					 SetMensaje(ex.getMessage());
				}
			}
		} else {
			SetMensaje("Error de conexion: " + db.GetMessage());
		}
		return caso;
	}


	public String GetMensaje() {
		return mensaje;
	}
	
	public void SetMensaje (String msj) {
		this.mensaje = msj;
	}


	@Override
	public void Insertar(CasoBuscador usuario) {
		// TODO Auto-generated method stub
		
	}


	@Override
	public void Actualizar(CasoBuscador usuario) {
		// TODO Auto-generated method stub
		
	}


	@Override
	public void Eliminar(int id) {
		// TODO Auto-generated method stub
		
	}


	@Override
	public int Validar(String usuario, String pass) {
		// TODO Auto-generated method stub
		return 0;
	}


}
