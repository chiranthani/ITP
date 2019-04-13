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
import service.subjectService;
import service.subjectinterface;

/**
 *
 * @author jahrin
 */
@WebServlet(name = "subjectdelete", urlPatterns = {"/subjectdelete"})
public class subjectdelete extends HttpServlet {

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String subCode = request.getParameter("code");
         
            subjectinterface   subject3 = new subjectService();
            subject3.deletesubject(subCode);
            
            request.getRequestDispatcher("/deletesubject.jsp").forward(request, response);
           
     
    }
        
        
    }

   


