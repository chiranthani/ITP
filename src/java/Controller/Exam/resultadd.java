/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.Exam;

import Model.resultcls;
import service.Resultaddservice;
import service.resultinterface;
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
@WebServlet(name = "resultadd", urlPatterns = {"/resultadd"})
public class resultadd extends HttpServlet {

   
   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String studentID = request.getParameter("studentID");
        String subject = request.getParameter("Subject_name");
        String marks = request.getParameter("marks");
       
     
        resultcls exm = new resultcls();

        exm.setStudentID(studentID);
        exm.setSubject_name(subject);
        exm.setMarks(marks);
       
  

        resultinterface resultinter = new Resultaddservice();
        resultinter.addResult(exm);
        
     
        
        request.setAttribute("alertMsg", "Result added successfully");
        
        request.getRequestDispatcher("/ExamResult.jsp").forward(request, response);
    }

    

}
