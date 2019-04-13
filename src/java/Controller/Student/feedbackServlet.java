/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.Student;

import Model.Student;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import service.IStudentService;
import service.IStudentServiceImp;

/**
 *
 * @author Fasrin
 */
@WebServlet(name = "feedbackServlet", urlPatterns = {"/feedbackServlet"})
public class feedbackServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
            response.setContentType("text/html");
        
            String id = request.getParameter("userID");
            String course = request.getParameter("course");
            String description = request.getParameter("description");		
            String date=request.getParameter("date");
            
            Student student = new Student();
            
            student.setUserId(id);
            student.setCourse(course);
            student.setFeedDescription(description);
            student.setRegDate(date);
            
            IStudentService iStudent = new IStudentServiceImp();
           
            iStudent.addFeedback(student);
            

            request.getRequestDispatcher("/profile.jsp").forward(request, response);

    }

}
