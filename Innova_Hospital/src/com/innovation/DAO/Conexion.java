package com.innovation.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class Conexion {

	private String mensaje;
	
	public Connection Conectar() {
		
		Connection cn = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/InnovDBHospital", "root", "root");
			System.out.println("valor de cn: " + cn.getClientInfo().toString());
		} 
		catch (SQLException | ClassNotFoundException ex) {
        SetMensaje(ex.getMessage());
		}

		return cn;
	}
	
	public String GetMessage() {
        return mensaje;
    }

    public void SetMensaje(String message) {
        this.mensaje = message;
    }
}
