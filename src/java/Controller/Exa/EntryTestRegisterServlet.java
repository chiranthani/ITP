/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.Exa;

import CommonMethods.CommonMethods;
import Config.DBConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

/**
 *
 * @author Nirash
 */
public class EntryTestRegisterServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
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
        //processRequest(request, response);

        Connection con = DBConnection.getConnection();

        String maths = request.getParameter("maths");
        String english = request.getParameter("english");
        String science = request.getParameter("science");
        if ((maths.equals("C") || maths.equals("B") || maths.equals("A")) && (english.equals("C") || english.equals("B") || english.equals("A")) && (science.equals("C") || science.equals("B") || science.equals("A"))) {

            //Insert to database.
            try {

                PreparedStatement pst1 = con.prepareStatement("INSERT INTO student ( fullname ,gender ,dob ,address ,regDate ,email ,contactNum ,parentName ,parentOC ,p_WorkingPlace ,courseCode ,NIC ,w_Telephone, olYear, username, password ) VALUES ( ?,?,NULL,?,NOW(),?,NULL,?,?,?,?,?,?,?,?,? );", Statement.RETURN_GENERATED_KEYS);
                pst1.setString(1, request.getParameter("fname"));
                pst1.setString(2, "");
                //pst1.setString(3, "");
                pst1.setString(3, request.getParameter("address"));
                pst1.setString(4, request.getParameter("email"));
                pst1.setString(5, "");
                pst1.setString(6, "");
                //pst1.setString(7, "");
                pst1.setString(7, "");
                pst1.setString(8, request.getParameter("Course"));
                pst1.setString(9, "");
                pst1.setString(10, "");
                pst1.setString(11, request.getParameter("olNo"));
                pst1.setString(12, request.getParameter("username"));

                CommonMethods cm = new CommonMethods();
                String shaString = cm.ConvertToSHA256(request.getParameter("password"));

                pst1.setString(13, shaString);

                int i = pst1.executeUpdate();

                int userID = 0;

                ResultSet rs = pst1.getGeneratedKeys();

                if (rs.next()) {
                    userID = rs.getInt(1);
                }

                String msg = "Welcome To The Entry test";
                if (i == 1) {
                    //Send to exam
                    HttpSession ses = request.getSession();
                    ses.setAttribute("userID", userID);
                    ses.setAttribute("email", request.getParameter("email"));
                    response.sendRedirect("index.html?msg=" + msg);

                }
                con.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            }

        } else {
//Not eligible
//response.sendRedirect("resultsnotEnough.jsp");
        }
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
