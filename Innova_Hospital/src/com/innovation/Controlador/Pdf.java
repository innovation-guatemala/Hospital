package com.innovation.Controlador;

import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.concurrent.Phaser;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

/**
 * Servlet implementation class Pdf
 */
@WebServlet(urlPatterns = {"/Pdf"})
public class Pdf extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Pdf() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    		throws ServletException, java.io.IOException {
    		processRequest(request, response);
    		}

    		protected void doPost(HttpServletRequest request, HttpServletResponse response)
    		throws ServletException, java.io.IOException {
    		processRequest(request, response);
    		}
    
    
	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("application/pdf");
		OutputStream out = response.getOutputStream();
		
		try {
			Document documento = new Document();
			PdfWriter.getInstance(documento, out);
			
			documento.open();
			
			Paragraph par1 = new Paragraph();
			Font fontitulo = new Font(Font.FontFamily.HELVETICA,16,Font.BOLD,BaseColor.BLUE);
			par1.add(new Phrase("Detalle de Caso",fontitulo));
			par1.setAlignment(Element.ALIGN_CENTER);
			par1.add(new Phrase(Chunk.NEWLINE));
			par1.add(new Phrase(Chunk.NEWLINE));
			documento.add(par1);
			
			Paragraph par2 = new Paragraph();
			Font fontitulo2 = new Font(Font.FontFamily.TIMES_ROMAN,12,Font.NORMAL,BaseColor.BLACK);
			par2.add(new Phrase("Este apartado del documento tiene como fin imprimir el texto " + 
			"necesario para obtener el detalle de los casos relacionados a los pacientes tratados",fontitulo2));
			par2.setAlignment(Element.ALIGN_JUSTIFIED);
			par2.add(new Phrase(Chunk.NEWLINE));
			par2.add(new Phrase(Chunk.NEWLINE));
			documento.add(par2);
			
			PdfPTable tabla = new PdfPTable(2);
			/*for (int i = 0; i < 15; i++)
			{
				tabla.addCell("celda " + i);
			}*/
			
			//f1
			PdfPCell celda1 = new PdfPCell(new Paragraph("Fecha 03 de Junio de 2019",FontFactory.getFont("Arial",10,Font.NORMAL,BaseColor.BLACK)));
			PdfPCell celda2 = new PdfPCell(new Paragraph("Pagina 1 de 1",FontFactory.getFont("Arial",10,Font.NORMAL,BaseColor.BLACK)));
			tabla.addCell(celda1);
			tabla.addCell(celda2);
			//f2
			PdfPCell celda3 = new PdfPCell(new Paragraph("SEINSA OT 3443",FontFactory.getFont("Arial",12,Font.NORMAL,BaseColor.BLACK)));
			PdfPCell celda4 = new PdfPCell(new Paragraph("Caso 29301",FontFactory.getFont("Arial",10,Font.NORMAL,BaseColor.BLACK)));
			tabla.addCell(celda3);
			tabla.addCell(celda4);
			//f3
			PdfPCell celda5 = new PdfPCell(new Paragraph("Paciente:",FontFactory.getFont("Arial",12,Font.BOLD,BaseColor.BLACK)));
			PdfPCell celda6 = new PdfPCell(new Paragraph("Juan Perez",FontFactory.getFont("Arial",10,Font.NORMAL,BaseColor.BLACK)));
			tabla.addCell(celda5);
			tabla.addCell(celda6);
			//f4
			PdfPCell celda7 = new PdfPCell(new Paragraph("Area:",FontFactory.getFont("Arial",12,Font.BOLD,BaseColor.BLACK)));
			PdfPCell celda8 = new PdfPCell(new Paragraph("Rayos X",FontFactory.getFont("Arial",10,Font.NORMAL,BaseColor.BLACK)));
			tabla.addCell(celda7);
			tabla.addCell(celda8);
			//f5
			PdfPCell celda9 = new PdfPCell(new Paragraph("Sexo: ",FontFactory.getFont("Arial",12,Font.BOLD,BaseColor.BLACK)));
			PdfPCell celda10 = new PdfPCell(new Paragraph("Masculino",FontFactory.getFont("Arial",10,Font.NORMAL,BaseColor.BLACK)));
			tabla.addCell(celda9);
			tabla.addCell(celda10);
			//f6
			PdfPCell celda11 = new PdfPCell(new Paragraph("Teléfono:",FontFactory.getFont("Arial",12,Font.BOLD,BaseColor.BLACK)));
			PdfPCell celda12 = new PdfPCell(new Paragraph("31309923",FontFactory.getFont("Arial",10,Font.NORMAL,BaseColor.BLACK)));
			tabla.addCell(celda11);
			tabla.addCell(celda12);
			//f7
			PdfPCell celda13 = new PdfPCell(new Paragraph("Encargado:",FontFactory.getFont("Arial",12,Font.BOLD,BaseColor.BLACK)));
			PdfPCell celda14 = new PdfPCell(new Paragraph("RX cms",FontFactory.getFont("Arial",10,Font.NORMAL,BaseColor.BLACK)));
			tabla.addCell(celda13);
			tabla.addCell(celda14);
			//f8
			PdfPCell celda15 = new PdfPCell(new Paragraph("Refirió:",FontFactory.getFont("Arial",12,Font.BOLD,BaseColor.BLACK)));
			PdfPCell celda16 = new PdfPCell(new Paragraph("30 Dr. Fredy Palencia",FontFactory.getFont("Arial",10,Font.NORMAL,BaseColor.BLACK)));
			tabla.addCell(celda15);
			tabla.addCell(celda16);
			//f9
			PdfPCell celda17 = new PdfPCell(new Paragraph("Servicios a prestar:",FontFactory.getFont("Arial",12,Font.BOLD,BaseColor.BLACK)));
			PdfPCell celda18 = new PdfPCell(new Paragraph("2112 Radiografía de mano oblicua",FontFactory.getFont("Arial",10,Font.NORMAL,BaseColor.BLACK)));
			tabla.addCell(celda17);
			tabla.addCell(celda18);
			documento.add(tabla);
			
			documento.close();
			
		} catch (Exception e) {
			e.getMessage();
		}finally {
			out.close();
		}
		
		
		//String direccion ="Pdf.jsp";
		//RequestDispatcher despachador = request.getRequestDispatcher(direccion);
		//despachador.forward(request, response);
		
	}


}
