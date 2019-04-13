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
 * @author Ganeesha
 */
@WebServlet(name = "registerStudentStep3Servlet", urlPatterns = {"/registerStudentStep3Servlet"})
public class registerStudentStep3Servlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

       // response.setContentType("text/html");
        
        String id = request.getParameter("id");
        String uname = request.getParameter("uname");
        String uType = request.getParameter("uType");
        String password = request.getParameter("password");
        
        Student s = new Student();
        
        s.setUserId(id);
        s.setUsername(uname);
        s.setuType(uType);
        s.setPassword(password);
        
        
        IStudentService s1 = new IStudentServiceImp();
        s1.createAccount(s);
        
        request.getRequestDispatcher("/login.jsp").forward(request, response);
		
		
        
    }

}
