/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.Employee;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author jahrin
 */
public class EmployeeServlet extends HttpServlet {

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
            out.println("<title>Servlet EmployeeServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EmployeeServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");

            String Fname = request.getParameter("name");
            String ID = request.getParameter("nic");
            String Add = request.getParameter("add");
            String gender = request.getParameter("Gender");

            String bdate = request.getParameter("birth");
            Date d = Date.valueOf(bdate);

            String mStatus = request.getParameter("state");
            String email = request.getParameter("mail");
            String mobo = request.getParameter("mob");
            String hm = request.getParameter("home");

            String djoin = request.getParameter("join");
            Date j = Date.valueOf(djoin);
            String etype = request.getParameter("type");
            String quli = request.getParameter("qua");
            String Wexp = request.getParameter("exp");
            String subject = request.getParameter("subject");

            Employee emp1 = new Employee(Fname, ID, Add, gender, bdate, mStatus, email, mobo, hm, djoin, etype, quli, Wexp, subject);

            try {
               
                if (emp1.isInserted() && (etype.equalsIgnoreCase("Manager") || etype.equalsIgnoreCase("Lecturer") )) {
                    int id = emp1.getID(ID);
                    request.setAttribute("id", id);
                    request.setAttribute("etype", etype);

                    request.getRequestDispatcher("/EmployeeAccount.jsp").forward(request, response);

                } else if (emp1.isInserted() && etype.equalsIgnoreCase("Non-Academic")) {

                    request.getRequestDispatcher("/EmpoyeeUpdateTable.jsp").forward(request, response);

                } else {
                    out.print("ERROR");
                }
            } catch (ClassNotFoundException | SQLException e) {
                out.print(e);
            }
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
