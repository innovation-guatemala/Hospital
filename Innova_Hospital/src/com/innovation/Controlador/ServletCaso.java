package com.innovation.Controlador;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.innovation.Interfaz.ServicioCaso;
import com.innovation.daoModelo.CasoDAO;
import com.innovation.modelo.Caso;
import com.innovation.modelo.Paciente;

@WebServlet("/Caso")
public class ServletCaso extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String accion = request.getParameter("accion");
		String mensaje = null;
		String direccion = null;
		
		ServicioCaso servicio = new CasoDAO();
		
		switch (accion) {
		
		case "QRY":
			List<Caso> listacaso = servicio.mostra();
			if (listacaso != null) {
				request.setAttribute("lista", listacaso);
			} else {
				mensaje = servicio.GetMensaje();
			}
			direccion = "creacioncaso.jsp";
			break;
			
		case "INS":
			Caso usuario = new Caso();
			String id_forma_pago = request.getParameter("id_forma_pago");
			String id_empresa = request.getParameter("id_empresa");
			String fecha = request.getParameter("fecha");
			String id_paciente = request.getParameter("id_paciente");
			String descripcion = request.getParameter("descripcion");
			String id_seguro = request.getParameter("id_seguro");
			String doc_seguro = request.getParameter("doc_seguro");
			String concluido = request.getParameter("concluido");
			String fecha_concluido = request.getParameter("fecha_concluido");
			usuario.setId_forma_pago(Integer.parseInt(id_forma_pago));
			usuario.setId_empresa(Integer.parseInt(id_empresa));
			SimpleDateFormat format = new SimpleDateFormat("dd/mm/yyyy");
			try {
				
				String dat=fecha;
				long date=new SimpleDateFormat("dd/MM/yyyy").parse(dat,new ParsePosition(0)).getTime();
				java.sql.Date dbDate=new java.sql.Date(date);
				System.out.println(dbDate);
				usuario.setFecha(dbDate);
				
				String dat1=fecha_concluido;
				long date1=new SimpleDateFormat("dd/MM/yyyy").parse(dat,new ParsePosition(0)).getTime();
				java.sql.Date dbDate1=new java.sql.Date(date1);
				System.out.println(dbDate1);
				usuario.setFecha(dbDate1);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			usuario.setId_paciente(Integer.parseInt(id_paciente));
			usuario.setDescripcion(descripcion);
			usuario.setId_seguro(Integer.parseInt(id_seguro));
			usuario.setDoc_seguro(doc_seguro);
			/*usuario.setConcluido(concluido);*/
			servicio.Insertar(usuario);
			mensaje = servicio.GetMensaje();
			if (mensaje != null) {
				request.setAttribute("id_forma_pago",id_forma_pago);
				request.setAttribute("id_empresa",id_empresa);
				request.setAttribute("fecha", fecha);
				request.setAttribute("id_paciente", id_paciente);
				request.setAttribute("descripcion", descripcion);
				request.setAttribute("id_seguro", id_seguro);
				request.setAttribute("doc_seguro", doc_seguro);
				request.setAttribute("fecha_concluido", fecha_concluido);
				direccion ="Caso?accion=QRY";
			} else {
				direccion ="Caso?accion=QRY";
			}
			break;
			
		case "SPA":
			List<Paciente> listapaci = servicio.BuscarPaciente();
			if (listapaci != null) {
				request.setAttribute("listapaci", listapaci);
			} else {
				mensaje = servicio.GetMensaje();
			}
			direccion = "creacioncaso.jsp";
			break;
			
			
		case "UPD":
			 usuario = new Caso();
			 usuario.setId_caso(Integer.parseInt(request.getParameter("id_caso")));
			 usuario.setId_forma_pago(Integer.parseInt(request.getParameter("id_forma_pago")));
			 usuario.setId_empresa(Integer.parseInt(request.getParameter("id_empresa")));
				SimpleDateFormat format1 = new SimpleDateFormat("yyyyMMdd");
				try {
					Date parsed1 = (Date) format1.parse("fecha");
					usuario.setFecha(new java.sql.Date(parsed1.getTime()));
					Date parsed2 = (Date) format1.parse("fecha_concluido");
					usuario.setFecha_concluido(new java.sql.Date(parsed2.getTime()));
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			 usuario.setId_paciente(Integer.parseInt(request.getParameter("id_paciente")));
			 usuario.setDescripcion(request.getParameter("descripcion"));
			 usuario.setId_seguro(Integer.parseInt(request.getParameter("id_seguro")));
			 usuario.setDoc_seguro(request.getParameter("doc_seguro"));
			 servicio.Actualizar(usuario);
			 mensaje = servicio.GetMensaje();
				if (mensaje != null) {
					request.setAttribute("Usuario",usuario);
					direccion ="Caso?accion=QRY";
				} else {
					direccion ="Caso?accion=QRY";
				}
				break;
		
				
		case "DEL":
			int id_el = Integer.parseInt(request.getParameter("id_caso"));
			
			if (id_el != 0) {
				servicio.Eliminar(id_el);
				mensaje = servicio.GetMensaje();
				
			} else {
				mensaje = "No se obtuvo el valor a eliminar";
				direccion ="Caso?accion=QRY";
			}
			direccion ="Caso?accion=QRY";
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
