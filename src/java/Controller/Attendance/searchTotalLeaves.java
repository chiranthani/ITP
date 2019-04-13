/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.Attendance;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author jahrin
 */
@WebServlet(name = "searchTotalLeaves", urlPatterns = {"/searchTotalLeaves"})
public class searchTotalLeaves extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int emp = Integer.parseInt(request.getParameter("empNo"));
        
        request.setAttribute("emp",emp);
        
         request.getRequestDispatcher("/AddLeave.jsp").forward(request, response);


    }

}
