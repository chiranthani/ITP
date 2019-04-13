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
@WebServlet(name = "courseupdate", urlPatterns = {"/courseupdate"})
public class courseupdate extends HttpServlet {

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
            coursecls  crs1 =  new coursecls ();
            
            
            
            String coursecode = request.getParameter("code");
              
            String fullname = request.getParameter("cname");
     
            String date =  request.getParameter("stdate");
            String fee =  request.getParameter("fee");
            String duration =  request.getParameter("duration");
            String subject = request.getParameter("subjects");
            String description = request.getParameter("description");
                   
     
            crs1.setName(fullname);
            crs1.setFee(fee);
            crs1.setDuration(duration);
            crs1.setSubject(subject);
            crs1.setDate(date);
            crs1.setDescription(description);
            
            
            courseinterface courseup = new Courseaddservice();
            courseup. updateCourse(coursecode,crs1);
                 
            request.getRequestDispatcher("/CourseView.jsp").forward(request, response);
            
        
     
    }

    }

    

