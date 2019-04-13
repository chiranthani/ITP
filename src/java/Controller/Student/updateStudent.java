/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.Student;

import Model.Student;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
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
@WebServlet(name = "updateStudent", urlPatterns = {"/updateStudent"})
public class updateStudent extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         response.setContentType("text/html");
        
        Student s = new Student();
        
        String user = request.getParameter("user");
        String fullname = request.getParameter("fullName");
        String address = request.getParameter("address");
        String contactNum = request.getParameter("contactNumber");
        String email = request.getParameter("email");
        String userName = request.getParameter("userName");
        String pname = request.getParameter("pname");
        String wpaddress = request.getParameter("wpaddress");
        int pcontactno = Integer.parseInt(request.getParameter("pcontactno"));
        
        s.setFullName(fullname);
        s.setAddress(address);
        s.setContactNo(contactNum);
        s.setEmail(email);
        s.setUsername(userName);
        s.setPname(pname);
        s.setWplace(wpaddress);
        s.setPtelphone(pcontactno);
        
        IStudentService studentService = new IStudentServiceImp();
        studentService.updateStudent(user, s);
        
        		
		
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/studentView.jsp");
	dispatcher.forward(request, response);
		
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
