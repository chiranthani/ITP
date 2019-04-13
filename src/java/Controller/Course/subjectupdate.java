/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.Course;

import Model.subjectcls;
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
@WebServlet(name = "subjectupdate", urlPatterns = {"/subjectupdate"})
public class subjectupdate extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
            String subcode  = request.getParameter("scode");
            String subname  = request.getParameter("sname");
            String coursecode  =  request.getParameter("ccode");
        
            subjectcls  sub1  = new subjectcls();
            
            sub1.setSubjectCode(subcode);
            sub1.setSubjectName(subname);
            sub1.setCoursecode(coursecode);
        
        
            subjectinterface   subject2 = new subjectService();
            subject2.updatesubject(subcode,sub1);
            
              request.getRequestDispatcher("/subjectedit.jsp").forward(request, response);

    }


    }

   
