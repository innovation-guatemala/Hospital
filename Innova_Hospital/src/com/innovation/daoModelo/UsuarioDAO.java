package com.innovation.daoModelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

import com.innovation.DAO.Conexion;
import com.innovation.Interfaz.ServicioUsuario;
import com.innovation.modelo.Usuario;

public class UsuarioDAO implements ServicioUsuario {


	private final Conexion db = new Conexion();
	private String mensaje;
	
	public List<Usuario> mostra() {
		
		List<Usuario> lista = null;
		String sentencia = "select id_acceso,nombre,apellido,puesto,password from login";
		Connection cn = db.Conectar();
		if (cn != null) {
			try {
				PreparedStatement st = cn.prepareStatement(sentencia);
				ResultSet rs = st.executeQuery();
				lista = new LinkedList<Usuario>();
				while (rs.next()) {
					Usuario usuario = new Usuario();
					usuario.setId(rs.getInt(1));
					usuario.setNombre(rs.getString(2));
					usuario.setApellido(rs.getString(3));
					usuario.setPuesto(rs.getString(4));
					usuario.setPassword(rs.getString(5));
					lista.add(usuario);
					System.out.println("Al menos consulta : "+ usuario.getId() +" " + usuario.getNombre() +" "+ usuario.getApellido() + " " + usuario.getPuesto() + " " + usuario.getPassword());
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
	public void Insertar(Usuario usuario) {
		String sentencia = "Insert into login (nombre,apellido,puesto,password) values (?,?,?,?)";
		Connection cn = db.Conectar();
		if (cn != null) {
			try {
				PreparedStatement st = cn.prepareStatement(sentencia);
				st.setString(1, usuario.getNombre());
				st.setString(2, usuario.getApellido());
				st.setString(3, usuario.getPuesto());
				st.setString(4, usuario.getPassword());
				int exec = st.executeUpdate();
				if (exec == 0) {
					throw new SQLException();
				}
				st.close();
			} catch (SQLException e) {
				SetMensaje("Problema con insertar: " + e.getMessage());
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
		
	}

	@Override
	public Usuario Buscar(int id) {
		Usuario usuario = null;
		String sentencia = "select id_acceso, nombre,apellido,puesto from login where id_acceso =  ?";
		Connection cn = db.Conectar();
		if (cn != null ) {
			try {
				PreparedStatement st = cn.prepareStatement(sentencia);
				st.setInt(1, id);
				ResultSet rs = st.executeQuery();
				while (rs.next()) {
					usuario = new Usuario();
					usuario.setId(rs.getInt(1));
					usuario.setNombre(rs.getString(2));
					usuario.setApellido(rs.getString(3));
					usuario.setPuesto(rs.getString(4));
					usuario.setPassword(rs.getString(5));
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
		return usuario;
	}

	@Override
	public void Actualizar(Usuario usuario) {
		String sentencia = "update login set nombre =?,apellido=?,puesto=?,password=? where id_acceso =  ?";
		Connection cn = db.Conectar();
		if (cn != null ) {
			try {
				PreparedStatement st = cn.prepareStatement(sentencia);
				st.setString(1, usuario.getNombre());
				st.setString(2, usuario.getApellido());
				st.setString(3, usuario.getPuesto());
				st.setString(4, usuario.getPassword());
				st.setInt(5, usuario.getId());
				
				int exec = st.executeUpdate();
				if (exec == 0) {
					throw new SQLException();
				}
				st.close();
			} catch (SQLException e) {
				SetMensaje("Problema con Actualizar: " + e.getMessage());
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
		
	}

	@Override
	public void Eliminar(int id) {
		String sentencia = "delete from login where id_acceso = ?";
		Connection cn = db.Conectar();
		if (cn != null ) {
			try {
				PreparedStatement st = cn.prepareStatement(sentencia);
				st.setInt(1, id);
				
				int exec = st.executeUpdate();
				if (exec == 0) {
					throw new SQLException();
				}
				st.close();
			} catch (SQLException e) {
				SetMensaje("Problema con Eliminar: " + e.getMessage());
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
		
	}
	
	@Override
	public int Validar(String usuario, String pass) {
		int retorno = 0;
		Usuario validar = null;
		String sentencia = "select nombre, password from login where nombre = ? and password = ?;";
		Connection cn = db.Conectar();
		if (cn != null ) {
			try {
				PreparedStatement st = cn.prepareStatement(sentencia);
				st.setString(1, usuario);
				st.setString(2, pass);
				ResultSet rs = st.executeQuery();
				if(rs.absolute(1)) {
					retorno = 1;
					while (rs.next()) {
						validar = new Usuario();
						validar.setNombre(rs.getString(1));
						validar.setPassword(rs.getString(2));
					}
				}
				else {
					retorno = 0;
					SetMensaje("Usuario o Password es incorrecto");
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
		return retorno;
	}

	public String GetMensaje() {
		return mensaje;
	}
	
	public void SetMensaje (String msj) {
		this.mensaje = msj;
	}


}
