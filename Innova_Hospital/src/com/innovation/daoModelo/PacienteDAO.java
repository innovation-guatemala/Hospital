package com.innovation.daoModelo;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.LinkedList;
import java.util.List;

import com.innovation.DAO.Conexion;
import com.innovation.Interfaz.ServicioPaciente;
import com.innovation.modelo.Paciente;

public class PacienteDAO implements ServicioPaciente {

	private final Conexion db = new Conexion();
	private String mensaje;
	
	public List<Paciente> mostra() {
		
		List<Paciente> lista = null;
		String sentencia = "select id_paciente,nombres,apellidos,dpi,fecha_nacimiento,sexo,alergias,antecedentes_personales,antecedentes_familiares,anotaciones_importantes,padre,madre,encargado,direccion,dpi_encargado,telefono,nit,nombre_factura,direccion_factura,ubicacion from paciente";
		Connection cn = db.Conectar();
		
		if (cn != null) {
			try {
				PreparedStatement st = cn.prepareStatement(sentencia);
				ResultSet rs = st.executeQuery();
				lista = new LinkedList<Paciente>();
				while (rs.next()) {
					Paciente usuario = new Paciente();
					usuario.setId_paciente(rs.getInt(1));
					usuario.setNombres(rs.getString(2));
					usuario.setApellidos(rs.getString(3));
					usuario.setDpi(rs.getString(4));
					usuario.setFecha_nacimiento(rs.getDate(5));
					usuario.setSexo(rs.getString(6));
					usuario.setAlergias(rs.getString(7));
					usuario.setAntecedentes_personales(rs.getString(8));
					usuario.setAntecedentes_familiares(rs.getString(9));
					usuario.setAnotaciones_importantes(rs.getString(10));
					usuario.setPadre(rs.getString(11));
					usuario.setMadre(rs.getString(12));
					usuario.setEncargado(rs.getString(13));
					usuario.setDireccion(rs.getString(14));
					usuario.setDpi_encargado(rs.getString(15));
					usuario.setTelefono(rs.getString(16));
					usuario.setNit(rs.getString(17));
					usuario.setNombre_factura(rs.getString(18));
					usuario.setDireccion_factura(rs.getString(19));
					usuario.setUbicacion(rs.getString(20));
					lista.add(usuario);
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

	public void Insertar(Paciente paciente) {
		String sentencia = "Insert into paciente (nombres,apellidos,dpi,fecha_nacimiento,sexo,alergias,antecedentes_personales,antecedentes_familiares,anotaciones_importantes,padre,madre,encargado,direccion,dpi_encargado,telefono,nit,nombre_factura,direccion_factura,ubicacion,fecha_creacion) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		Connection cn = db.Conectar();
		if (cn != null) {
			try {
				PreparedStatement st = cn.prepareStatement(sentencia);
				st.setString(1, paciente.getNombres());
				st.setString(2, paciente.getApellidos());
				st.setString(3, paciente.getDpi());
				st.setDate(4,  (Date) paciente.getFecha_nacimiento());
				st.setString(5, paciente.getSexo());
				st.setString(6, paciente.getAlergias());
				st.setString(7, paciente.getAntecedentes_personales());
				st.setString(8, paciente.getAntecedentes_familiares());
				st.setString(9, paciente.getAnotaciones_importantes());
				st.setString(10, paciente.getPadre());
				st.setString(11, paciente.getMadre());
				st.setString(12, paciente.getEncargado());
				st.setString(13, paciente.getDireccion());
				st.setString(14, paciente.getDpi_encargado());
				st.setString(15, paciente.getTelefono());
				st.setString(16, paciente.getNit());
				st.setString(17, paciente.getNombre_factura());
				st.setString(18, paciente.getDireccion_factura());
				st.setString(19, paciente.getUbicacion());

				//calendario para fecha creacion
				Calendar fecha = new GregorianCalendar();
		        int anio = fecha.get(Calendar.YEAR);
		        int mes = fecha.get(Calendar.MONTH);
		        int dia = fecha.get(Calendar.DAY_OF_MONTH);
		        int hora = fecha.get(Calendar.HOUR_OF_DAY);
		        int minuto = fecha.get(Calendar.MINUTE);
		        int segundo = fecha.get(Calendar.SECOND);
		        
		        String fechaCreacion = String.valueOf(dia) +"/" + String.valueOf(mes+1) + "/"+ String.valueOf(anio);
		        System.out.println("fecha creacion " + fechaCreacion);
		        long date=new SimpleDateFormat("dd/MM/yyyy").parse(fechaCreacion,new ParsePosition(0)).getTime();
		        System.out.println("test fechaCreacion " + date);
				java.sql.Date dbDate=new java.sql.Date(date);
				System.out.println("fecha creacion " + dbDate);
				st.setDate(20, (Date) dbDate);
				
				int exec = st.executeUpdate();
				if (exec == 0) {
					throw new SQLException();
				}
				st.close();
			} catch (SQLException e) {
				SetMensaje("Problema con insertar: " + e.getMessage());
				e.printStackTrace();
				System.out.println("no inserto paciente SQL exception");
			}catch (Exception e) {
				SetMensaje("Problema con insertar: " + e.getMessage());
				System.out.println("no inserto paciente exception general");
				e.printStackTrace();
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

	public Paciente Buscar(int id) {
		Paciente paciente = null;
		String sentencia = "select id_paciente,nombres,apellidos,dpi,fecha_nacimiento,sexo,alergias,antecedentes_personales,antecedentes_familiares,anotaciones_importantes,padre,madre,encargado,direccion,dpi_encargado,telefono,nit,nombre_factura,direccion_factura,ubicacion from paciente where id_paciente =  ?";
		Connection cn = db.Conectar();
		if (cn != null ) {
			try {
				PreparedStatement st = cn.prepareStatement(sentencia);
				st.setInt(1, id);
				ResultSet rs = st.executeQuery();
				while (rs.next()) {
					paciente = new Paciente();
					paciente.setId_paciente(rs.getInt(1));
					st.setString(1, paciente.getNombres());
					st.setString(2, paciente.getApellidos());
					st.setString(3, paciente.getDpi());
					st.setDate(4, (Date) paciente.getFecha_nacimiento());
					st.setString(5, paciente.getSexo());
					st.setString(6, paciente.getAlergias());
					st.setString(7, paciente.getAntecedentes_personales());
					st.setString(8, paciente.getAntecedentes_familiares());
					st.setString(9, paciente.getAnotaciones_importantes());
					st.setString(10, paciente.getPadre());
					st.setString(11, paciente.getMadre());
					st.setString(12, paciente.getEncargado());
					st.setString(13, paciente.getDireccion());
					st.setString(14, paciente.getDpi_encargado());
					st.setString(15, paciente.getTelefono());
					st.setString(16, paciente.getNit());
					st.setString(17, paciente.getNombre_factura());
					st.setString(18, paciente.getDireccion_factura());
					st.setString(19, paciente.getUbicacion());
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
		return paciente;
	}


	public void Eliminar(int id) {
		String sentencia = "delete from paciente where id_paciente = ?";
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
	
	public String GetMensaje() {
		return mensaje;
	}
	
	public void SetMensaje (String msj) {
		this.mensaje = msj;
	}

	@Override
	public void Actualizar(Paciente usuario) {
		// TODO Auto-generated method stub
		
	}

	
}
