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
@WebServlet(name = "resultupdate", urlPatterns = {"/resultupdate"})
public class resultupdate extends HttpServlet {

  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        resultcls result1 = new resultcls();

        String studentID = request.getParameter("studentID");
        String subject_name = request.getParameter("subject_name");
        String marks = request.getParameter("marks");

        result1.setStudentID(studentID);
        result1.setSubject_name(subject_name);
        result1.setMarks(marks);

        resultinterface examup = new Resultaddservice();

        examup.updateResult(studentID, result1);
        
        
          request.setAttribute("alertMsg", "Data updated successfully");

        request.getRequestDispatcher("/resultupdate.jsp").forward(request, response);


    }

   
}
