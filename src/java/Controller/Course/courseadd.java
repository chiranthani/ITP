/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.Course;

import Model.coursecls;
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
@WebServlet(name = "courseadd", urlPatterns = {"/courseadd"})
public class courseadd extends HttpServlet {

   
       @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
            String fullname = request.getParameter("cname");
            String coursecode = request.getParameter("code");
            String date =  request.getParameter("stdate");
            String fee =  request.getParameter("fee");
            String duration =  request.getParameter("duration");
            String subject = request.getParameter("subjects");
            String description = request.getParameter("description");
            
                             
            coursecls  crs =  new coursecls ();
            
            crs.setCourseCode(coursecode);
            crs.setName(fullname);
            crs.setFee(fee);
            crs.setDuration(duration);
            crs.setSubject(subject);
            crs.setDate(date);
            crs.setDescription(description);
            
            courseinterface courseinter  = new Courseaddservice();
            courseinter.addCourse(crs);
             request.getRequestDispatcher("/CourseView.jsp").forward(request, response);
              
        
    }

}