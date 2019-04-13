/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.Exam;

import Model.examcls;
import service.Examaddservice;
import service.examiinterface;
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
@WebServlet(name = "examupdate", urlPatterns = {"/examupdate"})
public class examupdate extends HttpServlet {

   
   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         examcls exm1 = new examcls();
        
        String examcode = request.getParameter("examCode");
        String batch = request.getParameter("batch");
        String examType = request.getParameter("examType");
        String examDate = request.getParameter("examDate");
        String examTime = request.getParameter("examTime");
        String duration = request.getParameter("duration");
        String subjectCode = request.getParameter("subjectCode");
        
        exm1.setExamCode(examcode);
        exm1.setBatch(batch);
        exm1.setExamType(examType);
        exm1.setExamDate(examDate);
        exm1.setExamTime(examTime);
        exm1.setDuration(duration);
        exm1.setSubjectCode(subjectCode);

        examiinterface examup = new Examaddservice();

        examup.updateExam(examcode, exm1);

        
        request.setAttribute("alertMsg", "Data updated successfully");
          
        request.getRequestDispatcher("/examupdate.jsp").forward(request, response);
    }

   
}
