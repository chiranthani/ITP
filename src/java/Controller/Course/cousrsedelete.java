/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.Course;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import service.Courseaddservice;
import service.courseinterface;

/**
 *
 * @author jahrin
 */
@WebServlet(name = "cousrsedelete", urlPatterns = {"/cousrsedelete"})
public class cousrsedelete extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
            String coursecode = request.getParameter("code");
           
            courseinterface courseinter2  = new Courseaddservice();
            courseinter2.deleteCourse(coursecode);
            request.getRequestDispatcher("/delete.jsp").forward(request, response);            
            

    }

    }

    

