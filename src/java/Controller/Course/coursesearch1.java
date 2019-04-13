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

/**
 *
 * @author jahrin
 */
@WebServlet(name = "coursesearch1", urlPatterns = {"/coursesearch1"})
public class coursesearch1 extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        String coursecode = request.getParameter("code");

        Courseaddservice ss = new Courseaddservice();
        String a = ss.Check(coursecode);
        
        if (a.equalsIgnoreCase("non")) {

            String m = "No result found for the course code You have Entered";
            request.setAttribute("m", m);
            request.getRequestDispatcher("/coursesearch1.jsp").forward(request, response);
        }
        else{
        request.setAttribute("code", a);

        request.getRequestDispatcher("/coursesearch1.jsp").forward(request, response);
        }
    }

}
