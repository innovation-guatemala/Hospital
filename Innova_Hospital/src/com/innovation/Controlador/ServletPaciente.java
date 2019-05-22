package com.innovation.Controlador;

import java.io.IOException;
import java.sql.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.innovation.Interfaz.ServicioPaciente;
import com.innovation.daoModelo.PacienteDAO;
import com.innovation.modelo.Paciente;

/**
 * Servlet implementation class ServletPaciente
 */
@WebServlet("/Paciente")
public class ServletPaciente extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String accion = request.getParameter("accion");
		String mensaje = null;
		String direccion = null;
		
		ServicioPaciente servicio = new PacienteDAO();
		
		switch (accion) {
		
		case "QRY":
			List<Paciente> listapaciente = servicio.mostra();
			if (listapaciente != null) {
				request.setAttribute("lista", listapaciente);
			} else {
				mensaje = servicio.GetMensaje();
			}
			direccion = "paciente.jsp";
			break;
			
		case "INS":
			Paciente usuario = new Paciente();
			String nombre = request.getParameter("nombres");
			String apellido = request.getParameter("apellidos");
			String dpi = request.getParameter("dpi");
			String fecha_nacimiento = request.getParameter("fecha_nacimiento");
			String sexo = request.getParameter("sexo");
			String alergias = request.getParameter("alergias");
			String antecedentes_personales = request.getParameter("antecedentes_personales");
			String antecedentes_familiares = request.getParameter("antecedentes_familiares");
			String anotaciones_importantes = request.getParameter("anotaciones_importantes");
			String padre = request.getParameter("padre");
			String madre = request.getParameter("madre");
			String encargado = request.getParameter("encargado");
			String direccion1 = request.getParameter("direccion");
			String dpi_encargado = request.getParameter("dpi_encargado");
			String telefono = request.getParameter("telefono");
			String nit = request.getParameter("nit");
			String nombre_factura = request.getParameter("nombre_factura");
			String direccion_factura = request.getParameter("direccion_factura");
			String ubicacion = request.getParameter("ubicacion");
			String fecha_creacion = request.getParameter("fecha_creacion");			
			String usuario_creacion = request.getParameter("usuario_creacion");
			String fecha_modificacion = request.getParameter("fecha_modificacion");
			String usuario_modificacion = request.getParameter("usuario_modificacion");
			usuario.setNombres(nombre);
			usuario.setApellidos(apellido);
			
			servicio.Insertar(usuario);
			mensaje = servicio.GetMensaje();
			if (mensaje != null) {
				request.setAttribute("nombres",nombre);
				request.setAttribute("apellidos",apellido);
				request.setAttribute("dpi", dpi);
				request.setAttribute("fecha_nacimiento", fecha_nacimiento);
				request.setAttribute("sexo", sexo);
				request.setAttribute("alergias", alergias);
				request.setAttribute("antecedentes_personales", antecedentes_personales);
				request.setAttribute("antecedentes_familiares", antecedentes_familiares);
				request.setAttribute("anotaciones_importantes", anotaciones_importantes);
				request.setAttribute("padre", padre);
				request.setAttribute("madre", madre);
				request.setAttribute("encargado", encargado);
				request.setAttribute("direccion", direccion1);
				request.setAttribute("dpi_encargado", dpi_encargado);
				request.setAttribute("telefono", telefono);
				request.setAttribute("nit", nit);
				request.setAttribute("nombre_factura", nombre_factura);
				request.setAttribute("direccion_factura", direccion_factura);
				request.setAttribute("ubicacion", ubicacion);
				request.setAttribute("fecha_creacion", fecha_creacion);
				request.setAttribute("usuario_creacion", usuario_creacion);
				request.setAttribute("fecha_modificacion", fecha_modificacion);
				request.setAttribute("usuario_modificacion", usuario_modificacion);
				direccion ="Paciente?accion=QRY";
			} else {
				direccion ="Paciente?accion=QRY";
			}
			break;
			
		case "FND":
			usuario = null;
			int id_paciente = Integer.parseInt(request.getParameter("id_paciente"));
			if (id_paciente != 0) {
				usuario = servicio.Buscar(id_paciente);
				
				if(usuario != null) {
					request.setAttribute("Paciente", usuario);
				}else {
					mensaje = servicio.GetMensaje();
					direccion ="Paciente?accion=QRY";
				}
			} else {
                mensaje = "No se ha recibido el ID de Usuario.";
                direccion = "Paciente?accion=QRY";
            }
			break;
			
			
		case "UPD":
			 usuario = new Paciente();
			 DateFormat formatter;
			 formatter = new SimpleDateFormat("dd-MMM-yy");
			 usuario.setId_paciente(Integer.parseInt(request.getParameter("id_paciente")));
			 usuario.setNombres(request.getParameter("nombres"));
			 usuario.setApellidos(request.getParameter("apellidos"));
			 usuario.setDpi(request.getParameter("dpi"));
			 try {
				usuario.setFecha_nacimiento((Date) formatter.parse(request.getParameter("fecha_nacimiento")));
				usuario.setFecha_creacion((Date) formatter.parse(request.getParameter("fecha_creacion")));
				usuario.setFecha_modificacion((Date) formatter.parse(request.getParameter("fecha_modificacion")));
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			 usuario.setSexo(request.getParameter("sexo"));
			 usuario.setAlergias(request.getParameter("alergias"));
			 usuario.setAntecedentes_personales(request.getParameter("antecedentes_personales"));
			 usuario.setAntecedentes_familiares(request.getParameter("antecendentes_familiares"));
			 usuario.setAnotaciones_importantes(request.getParameter("anotaciones_importantes"));
			 usuario.setPadre(request.getParameter("padre"));
			 usuario.setMadre(request.getParameter("madre"));
			 usuario.setEncargado(request.getParameter("encargado"));
			 usuario.setDireccion(request.getParameter("direccion"));
			 usuario.setDpi_encargado(request.getParameter("dpi_encargado"));
			 usuario.setTelefono(request.getParameter("telefono"));
			 usuario.setNit(request.getParameter("nit"));
			 usuario.setNombre_factura(request.getParameter("nombre_factura"));
			 usuario.setDireccion_factura(request.getParameter("direccion_factura"));
			 usuario.setUbicacion(request.getParameter("ubicacion"));
			 usuario.setUsuario_creacion(request.getParameter("usuario_creacion"));
			 usuario.setUsuario_modificacion(request.getParameter("usuario_creacion"));
			 servicio.Actualizar(usuario);
			 mensaje = servicio.GetMensaje();
				if (mensaje != null) {
					request.setAttribute("Usuario",usuario);
					direccion ="Paciente?accion=QRY";
				} else {
					direccion ="Paciente?accion=QRY";
				}
				break;
		
				
		case "DEL":
			int id_el = Integer.parseInt(request.getParameter("id_acceso"));
			
			if (id_el != 0) {
				servicio.Eliminar(id_el);
				mensaje = servicio.GetMensaje();
				
			} else {
				mensaje = "No se obtuvo el valor a eliminar";
				direccion ="Paciente?accion=QRY";
			}
			direccion ="Paciente?accion=QRY";
			break;
			
		default:
			mensaje = "No se reconoce la accion";
		
		}
		
		if (mensaje != null) {
			String msg = "<div class=\"col-md-5 col-md-offset-3\" style=\"width: 200px; height: 100px;\">";
			msg += "<div class=\"alert alert-danger\">";
			msg += "<button class=\"close\" data-dismiss=\"alert\"><span>&times;</span></button>";
			msg += "<strong>Alerta!!</strong><br/>";
			msg += mensaje;
			msg += "</div></div>";
			request.setAttribute("mensaje", msg);
		}
		
		RequestDispatcher despachador = request.getRequestDispatcher(direccion);
		despachador.forward(request, response);
		
	}


}
