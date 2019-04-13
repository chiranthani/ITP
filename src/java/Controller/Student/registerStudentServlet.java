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
@WebServlet(name = "registerStudentServlet", urlPatterns = {"/registerStudentServlet"})
public class registerStudentServlet extends HttpServlet {

 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
     
        
               
                String fullName = request.getParameter("fname");
		String address = request.getParameter("address");
		String gender = request.getParameter("gender");
		String dob = request.getParameter("dob");
		String contactno = request.getParameter("contactno");		
		String email = request.getParameter("email");		
		String nic = request.getParameter("nic");		
                String date=request.getParameter("date");	
		String Course = request.getParameter("Course");
		
		Student student = new Student();
		
		student.setFullName(fullName);
		student.setAddress(address);
		student.setGender(gender);
		student.setDob(dob);
		student.setContactNo(contactno);               
		student.setEmail(email);		
		student.setNic(nic);
                student.setRegDate(date);
                student.setCourse(Course);
	
		
		IStudentService s = new IStudentServiceImp();
		s.registerStudent(student);
		
                request.setAttribute("nic", nic);
		//request.setAttribute("b1", b1);
		request.getRequestDispatcher("/registerStep2.jsp").forward(request, response);
		
		
    

        
    }
    }

   