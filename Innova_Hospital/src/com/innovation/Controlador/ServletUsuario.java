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

/**
 * Servlet implementation class ServletUsuario
 */
@WebServlet("/Usuario")
public class ServletUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String accion = request.getParameter("accion");
		String mensaje = null;
		String msjCreado = null;
		String direccion = null;
		
		ServicioUsuario servicio = new UsuarioDAO();
		
		switch (accion) {
		
		case "QRY":
			List<Usuario> listausuario = servicio.mostra();
			if (listausuario != null) {
				request.setAttribute("lista", listausuario);
			} else {
				mensaje = servicio.GetMensaje();
			}
			direccion = "Usuario.jsp";
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
				direccion ="UsuarioCrear.jsp";
			} else {
				direccion ="UsuarioCrear.jsp";
				msjCreado = "Usuario Creado exitosamente!!!";
			}
			break;
			
			
		case "ACT":
			 Usuario usuarioact = new Usuario();
			 usuarioact.setId(Integer.parseInt(request.getParameter("id_usu")));
			 usuarioact.setNombre(request.getParameter("nombre"));
			 usuarioact.setApellido(request.getParameter("apellido"));
			 usuarioact.setPuesto(request.getParameter("puesto"));
			 usuarioact.setPassword(request.getParameter("password"));
			 servicio.Actualizar(usuarioact);
			 mensaje = servicio.GetMensaje();
			 if (mensaje != null) {
					request.setAttribute("Usuario",usuarioact);
					direccion ="Usuario?accion=QRY";
				} else {
					direccion ="Usuario?accion=QRY";
					msjCreado = "Usuario Modificado exitosamente!!!";
				}
			break;
		
				
		case "DEL":
			int id_el = Integer.parseInt(request.getParameter("id_usu"));
			
			if (id_el != 0) {
				servicio.Eliminar(id_el);
				mensaje = servicio.GetMensaje();
				msjCreado = "Usuario Eliminado exitosamente!!!";
				
			} else {
				direccion ="Usuario?accion=QRY";
			}
			direccion ="Usuario?accion=QRY";
			break;
			
			
		case "VLD":
			String user = request.getParameter("nombre");
			String pass = request.getParameter("password");
			int validacion = servicio.Validar(user, pass);
			if (validacion != 0) {
				direccion = "index.jsp";
		
			} else {
                mensaje = "Credenciales incorrectas.";
                direccion = "login.jsp";
            }
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
		
		if (msjCreado != null) {
			String msg = "<div class=\"col-lg-6\">";
			msg += "<label for=\"success\"></label>";
			msg += "<div class=\"alert alert-success\" role=\"alert\">";
			msg += msjCreado;
			msg += "</div></div>";
			request.setAttribute("mensaje", msg);
		}
		
		RequestDispatcher despachador = request.getRequestDispatcher(direccion);
		despachador.forward(request, response);
	}

}
