package com.innovation.Controlador;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.innovation.Interfaz.ServicioUsuario;
import com.innovation.daoModelo.UsuarioDAO;
import com.innovation.modelo.Usuario;


@WebServlet("/Departamento")
public class ServletUsuario extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String accion = request.getParameter("accion");
		String mensaje = null;
		String direccion = null;
		
		ServicioUsuario servicio = new UsuarioDAO();
		
		switch (accion) {
		
		case "QRY":
			List<Usuario> lista = servicio.mostra();
			if (lista != null) {
				request.setAttribute("lista", lista);
			} else {
				mensaje = servicio.GetMensaje();
			}
			direccion = "DepartamentoLista.jsp";
			break;
			
		case "INS":
			Usuario usuario = new Usuario();
			String nombre = request.getParameter("nombre");
			String apellido = request.getParameter("apellido");
			String puesto = request.getParameter("puesto");
			String password = request.getParameter("password");
			usuario.setNombre(nombre);
			usuario.setApellido(apellido);
			usuario.setPuesto(puesto);
			usuario.setPassword(password);
			servicio.Insertar(usuario);
			mensaje = servicio.GetMensaje();
			if (mensaje != null) {
				request.setAttribute("nombre",nombre);
				request.setAttribute("apellido",apellido);
				request.setAttribute("puesto",puesto);
				request.setAttribute("password",password);
				direccion ="Usuario?accion=QRY";
			} else {
				direccion ="Usuario?accion=QRY";
			}
			break;
			
		case "FND":
			usuario = null;
			int id_depto = Integer.parseInt(request.getParameter("id"));
			if (id_depto != 0) {
				usuario = servicio.Buscar(id_depto);
				
				if(usuario != null) {
					request.setAttribute("usuario", usuario);
				}else {
					mensaje = servicio.GetMensaje();
					direccion ="Usuario?accion=QRY";
				}
			} else {
                mensaje = "No se ha recibido el ID de Departamento.";
                direccion = "Departamento?accion=QRY";
            }
			break;
			
			
		case "UPD":
			 usuario = new Usuario();
			 usuario.setId(Integer.parseInt(request.getParameter("id_depto")));
			 usuario.setNombre(request.getParameter("nombre"));
			 usuario.setApellido(request.getParameter("apellido"));
			 usuario.setPuesto(request.getParameter("puesto"));
			 usuario.setPassword(request.getParameter("password"));
			 servicio.Actualizar(usuario);
			 mensaje = servicio.GetMensaje();
				if (mensaje != null) {
					request.setAttribute("usuario",usuario);
					direccion ="Usuario?accion=QRY";
				} else {
					direccion ="Usuario?accion=QRY";
				}
				break;
		
				
		case "DEL":
			int id_el = Integer.parseInt(request.getParameter("id"));
			
			if (id_el != 0) {
				servicio.Eliminar(id_el);
				mensaje = servicio.GetMensaje();
				
			} else {
				mensaje = "No se obtuvo el valor a eliminar";
				direccion ="Departamento?accion=QRY";
			}
			direccion ="Departamento?accion=QRY";
			break;
			
		default:
			mensaje = "No se reconoce la accion";
		
		}
		
		if (mensaje != null) {
			String msg = "<div class=\"col-md-5 col-md-offset-3\" style=\"text-align: center\">";
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