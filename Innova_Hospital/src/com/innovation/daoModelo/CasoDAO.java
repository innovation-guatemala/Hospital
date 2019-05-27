package com.innovation.daoModelo;

import java.sql.Connection;
import java.util.Date;
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
import com.innovation.Interfaz.ServicioCaso;
import com.innovation.modelo.Caso;
import com.innovation.modelo.Paciente;

public class CasoDAO implements ServicioCaso{
	private final Conexion db = new Conexion();
	private String mensaje;
	
	public List<Caso> mostra() {
		
		List<Caso> lista = null;
		String sentencia = "select id_caso,id_forma_pago,id_empresa,fecha,id_paciente,descripcion,id_seguro,doc_seguro,concluido,fecha_concluido from caso";
		Connection cn = db.Conectar();
		
		if (cn != null) {
			try {
				PreparedStatement st = cn.prepareStatement(sentencia);
				ResultSet rs = st.executeQuery();
				lista = new LinkedList<Caso>();
				while (rs.next()) {
					Caso caso = new Caso();
					caso.setId_caso(rs.getInt(1));
					caso.setId_forma_pago(rs.getInt(2));
					caso.setId_empresa(rs.getInt(3));
					caso.setFecha(rs.getDate(4));
					caso.setId_paciente(rs.getInt(5));
					caso.setDescripcion(rs.getString(6));
					caso.setId_seguro(rs.getInt(7));
					caso.setDoc_seguro(rs.getString(8));
					caso.setConcluido(rs.getBoolean(9));
					caso.setFecha_concluido(rs.getDate(10));
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

	public void Insertar(Caso caso) {
		String sentencia = "Insert into caso (id_forma_pago,id_empresa,fecha,id_paciente,descripcion,id_seguro,doc_seguro,concluido,fecha_concluido) values (?,?,?,?,?,?,?,?,?)";
		Connection cn = db.Conectar();
		if (cn != null) {
			try {
				PreparedStatement st = cn.prepareStatement(sentencia);
				st.setInt(1, caso.getId_forma_pago());
				st.setInt(2, caso.getId_empresa());
				st.setDate(3, (java.sql.Date) caso.getFecha());
				st.setInt(4, caso.getId_paciente());
				st.setString(5, caso.getDescripcion());
				st.setInt(6, caso.getId_seguro());
				st.setString(7, caso.getDoc_seguro());
				st.setBoolean(8, caso.isConcluido());
				st.setDate(9, (java.sql.Date) caso.getFecha_concluido());

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
				st.setDate(20, (java.sql.Date) dbDate);
				
				int exec = st.executeUpdate();
				if (exec == 0) {
					throw new SQLException();
				}
				st.close();
			} catch (SQLException e) {
				SetMensaje("Problema con insertar: " + e.getMessage());
				e.printStackTrace();
				System.out.println("no inserto caso SQL exception");
			}catch (Exception e) {
				SetMensaje("Problema con insertar: " + e.getMessage());
				System.out.println("no inserto caso exception general");
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

	public List<Paciente> BuscarPaciente() {
		List<Paciente> lista = null;
		String sentencia = "select id_paciente,nombres,apellidos,dpi from paciente";
		Connection cn = db.Conectar();
		if (cn != null ) {
			try {
				PreparedStatement st = cn.prepareStatement(sentencia);
				ResultSet rs = st.executeQuery();
				lista = new LinkedList<Paciente>();
				while (rs.next()) {
					Paciente paciente = new Paciente();
					paciente.setId_paciente(rs.getInt(1));
					paciente.setNombres(rs.getString(2));
					paciente.setApellidos(rs.getString(3));
					paciente.setDpi(rs.getString(4));
					lista.add(paciente);
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
		return lista;
	}


	public void Eliminar(int id) {
		String sentencia = "delete from caso where id_caso = ?";
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
	public void Actualizar(Caso caso) {
		// TODO Auto-generated method stub
		
	}

}
