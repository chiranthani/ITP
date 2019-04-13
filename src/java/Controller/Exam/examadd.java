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
@WebServlet(name = "examadd", urlPatterns = {"/examadd"})
public class examadd extends HttpServlet {

   

  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       //obtaining parmeters
        String examCodec = request.getParameter("examCode");
        String batchc = request.getParameter("batch");
        String examTypec = request.getParameter("examType");
        String examDatec = request.getParameter("examDate");
        String examTimec = request.getParameter("examTime");
        String durationc = request.getParameter("duration");
        String subjectCodec = request.getParameter("subjectCode");

        //creating object of model exam class where attributes are get and set 
        examcls exm = new examcls();

        //using that object above variables are set  
        exm.setExamCode(examCodec);
        exm.setBatch(batchc);
        exm.setExamType(examTypec);
        exm.setExamDate(examDatec);
        exm.setExamTime(examTimec);
        exm.setDuration(durationc);
        exm.setSubjectCode(subjectCodec);

        //service provider interface object is created
        examiinterface examinter = new Examaddservice();
        //addExam method is called
        examinter.addExam(exm);

        request.setAttribute("alertMsg", "Data added successfully");

        request.getRequestDispatcher("/Exam.jsp").forward(request, response);
    }
}
