/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.Student;

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
@WebServlet(name = "deleteProfileServlet", urlPatterns = {"/deleteProfileServlet"})
public class deleteProfileServlet extends HttpServlet {

    public deleteProfileServlet() {
        super();
        
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
		String userID = request.getParameter("userID");			
		
		IStudentService iStudentService = new IStudentServiceImp();
		iStudentService.deleteStudent(userID);

                
		request.getRequestDispatcher("/studentView.jsp").forward(request, response);
		
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
