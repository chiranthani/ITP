///*
// * To change this license header, choose License Headers in Project Properties.
// * To change this template file, choose Tools | Templates
// * and open the template in the editor.
// */
//package study;
//
//import java.io.IOException;
//import java.io.PrintWriter;
//import java.nio.charset.StandardCharsets;
//import java.security.MessageDigest;
//import java.util.Random;
//import javax.servlet.ServletException;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import org.apache.commons.codec.digest.DigestUtils;
//
///**
// *
// * @author Nirash
// */
//public class RegisterServlet extends HttpServlet {
//
//    /**
//     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
//     * methods.
//     *
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
//    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        response.setContentType("text/html;charset=UTF-8");
//        try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            String fname = request.getParameter("fname");
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet test</title>");
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet test at " + fname + "</h1>");
//
//            String lname = request.getParameter("lname");
//            String email = request.getParameter("email");
//            String pword = request.getParameter("pword");
//
//            
//
////
////            String newPword = DigestUtils.md5Hex(pword);
////
////            String myHash;
////            Random random = new Random();
////            random.nextInt(999999);
////            myHash = DigestUtils.md5Hex("" + random);
//            RegisterBean rb = new RegisterBean();
//            rb.setFname(fname);
//            rb.setLname(lname);
//            rb.setEmail(email);
//            rb.setPword(pword);
//            rb.setMyhash(pword);
//            out.println("<h1>Servlet test at " + email + "</h1>");
//            //DAo
//          //  RegisterDAO regDao = new RegisterDAO();
//           // String str = regDao.RegisterUser(rb);
//            out.println("</body>");
//            out.println("</html>");
//
//           // if (str.equals("Success")) {
//                response.sendRedirect("verify.jsp");
//            } else {
//                response.sendRedirect("index.jsp");
//            }
//        }
//    }
//
//    private static String bytesToHex(byte[] hash) {
//        StringBuffer hexString = new StringBuffer();
//        for (int i = 0; i < hash.length; i++) {
//            String hex = Integer.toHexString(0xff & hash[i]);
//            if (hex.length() == 1) {
//                hexString.append('0');
//            }
//            hexString.append(hex);
//        }
//        return hexString.toString();
//    }
//
//    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
//    /**
//     * Handles the HTTP <code>GET</code> method.
//     *
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        processRequest(request, response);
//    }
//
//    /**
//     * Handles the HTTP <code>POST</code> method.
//     *
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        processRequest(request, response);
//    }
//
//    /**
//     * Returns a short description of the servlet.
//     *
//     * @return a String containing servlet description
//     */
//    @Override
//    public String getServletInfo() {
//        return "Short description";
//    }// </editor-fold>
//
//}
