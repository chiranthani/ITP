/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package study;

import Config.DBConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Nirash
 */
public class ActivateAccount extends HttpServlet {

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
//        try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//           
//        }

//
//        String email = request.getParameter("key1");
//        String hash = request.getParameter("key2");
//
//        Connection con = DBConnection.getConnection();
//
//        try {
//            
//            
//            PreparedStatement pst = con.prepareStatement("SELECT email,isActive From student WHERE email=?");
//            pst.setString(1, email);
//            System.out.println(pst);
//            ResultSet rss = pst.executeQuery();
//            
//            if (rss.next()) {
//                PreparedStatement pst1 = con.prepareStatement("UPDATE student SET isActive='1' WHERE email=? and isActive='0'");
//                pst1.setString(1, email);
//                //pst1.setString(2, hash);
//                int i = pst1.executeUpdate();
//                if (i >= 1) {
//                    response.sendRedirect("login.jsp");
//                } else {
//                    response.sendRedirect("index.jsp");
//                }
//
//            }
//
//        } catch (Exception e) {
//            System.out.println("Something Wrong In ::ActivateAccountServelet" + e);
//            e.printStackTrace();
//        }
//performOperation();
//    }
        // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
        /**
         * Handles the HTTP <code>GET</code> method.
         *
         * @param request servlet request
         * @param response servlet response
         * @throws ServletException if a servlet-specific error occurs
         * @throws IOException if an I/O error occurs
         */
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //   processRequest(request, response);

        Connection con = DBConnection.getConnection();

        String email = request.getParameter("key1");
        String hash = request.getParameter("key2");

        try {

            PreparedStatement pst = con.prepareStatement("SELECT email,isActive From student WHERE email=?");
            pst.setString(1, email);
            System.out.println(pst);
            ResultSet rss = pst.executeQuery();

            if (rss.next()) {
                PreparedStatement pst1 = con.prepareStatement("UPDATE student SET isActive='1' WHERE email=? and isActive='0'");
                pst1.setString(1, email);                //pst1.setString(2, hash);
                int i = pst1.executeUpdate();
                if (i >= 1) {
                    response.sendRedirect("login.jsp");
                } else {
                    response.sendRedirect("index.jsp");
                }
            }
        } catch (Exception e) {
            System.out.println("Something Wrong In ::ActivateAccountServelet" + e);
            e.printStackTrace();
        }
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

//    public void performOperation() {
//      
//        String email = "nirashdperera@gmail.com";
//       // String hash = request.getParameter("key2");
//
//        Connection con = DBConnection.getConnection();
//        
//        
//        
//        try {
//            
//            
//            PreparedStatement pst = con.prepareStatement("SELECT email,isActive From student WHERE email=?");
//            pst.setString(1, email);
//            System.out.println(pst);
//            ResultSet rss = pst.executeQuery();
//            
//            System.out.println("resultset: "+rss);
//            if (rss.next()) {
//                PreparedStatement pst1 = con.prepareStatement("UPDATE student SET isActive='1' WHERE email=? and isActive='0'");
//                pst1.setString(1, email);
//                System.out.println(pst1);
//                //pst1.setString(2, hash);
//                int i = pst1.executeUpdate();
//                System.out.println(i);
//                if (i >= 1) {
//                    System.out.println("Heloo world");
//                } else {
//                    System.out.println("Error !!!!!!!!");
//                }
//
//            }
//con.close();
//        } catch (Exception e) {
//            System.out.println("Something Wrong In ::ActivateAccountServelet" + e);
//            e.printStackTrace();
//        } 


}
