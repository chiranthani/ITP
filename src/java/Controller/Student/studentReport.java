/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.Student;

import Controller.Salary.paysheetReportServlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.design.JRDesignQuery;
import net.sf.jasperreports.engine.design.JasperDesign;
import net.sf.jasperreports.engine.xml.JRXmlLoader;
import net.sf.jasperreports.view.JasperViewer;
import util.DBConnection;

/**
 *
 * @author jahrin
 */
@WebServlet(name = "studentReport", urlPatterns = {"/studentReport"})
public class studentReport extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet studentReport</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet studentReport at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");

            Connection con;
            Statement statement = null;

            con = DBConnection.createConnection();
            // statement = con.createStatement();
            String query = "select userID, fullname, gender, dob, address, regDate, email, contactNum, parentName, parentOC, p_WorkingPlace, courseCode, NIC, w_Telephone from student";

            String reportPath = "C:\\Users\\jahrin\\Documents\\NetBeansProjects\\IMS Progress V 6\\src\\java\\reports\\student.jrxml";
            // Map<String, Object> parameters = new HashMap<String, Object>();

////                //loading the design from the file path
            JasperDesign jasperDesign = JRXmlLoader.load(reportPath);
////                
////                //Designing the query for the report
            JRDesignQuery newQuery = new JRDesignQuery();
////                
////                //setting the query text
            newQuery.setText(query);
//////                
//////                //seeting the query for the report design
            jasperDesign.setQuery(newQuery);
//////                
//////                //compile the jasper report for the design
            JasperReport jasperReport = JasperCompileManager.compileReport(jasperDesign);
//////                
//////                //creating a JasperPrint object to fill the report
            JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, null, con);
            JasperViewer.viewReport(jasperPrint);
            //    JasperExportManager.exportReportToPdfFile(jasperPrint, "C://Users//jahrin//Documents//NetBeansProjects//Report11//web//report//report2.pdf");
//         

            request.getRequestDispatcher("/studentView.jsp").forward(request, response);

        } catch (JRException ex) {

        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
