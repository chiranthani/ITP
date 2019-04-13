/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.Salary;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import service.ISalary;
import service.ISalaryImp;

/**
 *
 * @author IT17135580
 */
@WebServlet(name = "DeleteSalaryServlet", urlPatterns = {"/DeleteSalaryServlet"})
public class DeleteSalaryServlet extends HttpServlet {

  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
         
        int EID = Integer.parseInt( request.getParameter("EID"));
        String month = request.getParameter("month");
        int year = Integer.parseInt( request.getParameter("year"));
        
        ISalary is = new ISalaryImp();
        String deleted = is.deleteSalary(EID, year, month);
        
        if(deleted.equals("Successfully deleted!")){
        
         request.setAttribute("sucMsg1", deleted);                           
         request.getRequestDispatcher("/AddSalary.jsp").forward(request, response);
       // processRequest(request, response);
        }
        else{
             
         request.setAttribute("errMsg1", deleted);                           
         request.getRequestDispatcher("/AddSalary.jsp").forward(request, response);
        }
        
    }
}
  