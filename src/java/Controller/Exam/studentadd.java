/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.Exam;

import Model.examstudentcls;
import service.Studentaddservice;
import service.studentinterface;
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
@WebServlet(name = "studentadd", urlPatterns = {"/studentadd"})
public class studentadd extends HttpServlet {

   
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      //obtaining parmeters
         String examCodec = request.getParameter("examCode");
         String[] attending = request.getParameterValues("attending");
      

        //creating object of model exam class where attributes are get and set 
        examstudentcls exm = new examstudentcls();

        //using that object above variables are set  
         exm.setExamCode(examCodec);
         exm.setStudents(attending);
 
        //service provider interface object is created
        studentinterface examinter = new Studentaddservice();
        //addExam method is called
        examinter.addStudent(exm);

        request.setAttribute("alertMsg", "Data added successfully");

        request.getRequestDispatcher("/ExamStudents.jsp").forward(request, response);

    }

  
}
