package com.innovation.Controlador;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.innovation.Interfaz.ServicioCasoBuscador;
import com.innovation.daoModelo.CasoBuscadorDAO;
import com.innovation.modelo.CasoBuscador;

import com.itextpdf.text.*;

/**
 * Servlet implementation class ServletCaso
 */
@WebServlet("/CasoBuscador")
public class ServletCasoBuscador extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String accion = request.getParameter("accion");
		String direccion = null;
		
		ServicioCasoBuscador servicio = new CasoBuscadorDAO();
		
		switch (accion) {
		
		case "QRY":
			List<CasoBuscador> listausuario = servicio.mostra();
			if (listausuario != null) {
				request.setAttribute("lista", listausuario);
				System.out.println(" lista " + listausuario.get(1).getDescripcion());
			} else {
				String mensaje = servicio.GetMensaje();
			}
			direccion = "CasoBuscador.jsp";
			break;		
		
		}
		
		RequestDispatcher despachador = request.getRequestDispatcher(direccion);
		despachador.forward(request, response);
	}

}
