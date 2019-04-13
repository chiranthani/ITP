/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.Salary;

import Model.Salary;
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
 * @author Ganeesha
 */
@WebServlet(name = "AddBonusSalaryServlet", urlPatterns = {"/AddBonusSalaryServlet"})
public class AddBonusSalaryServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String empType = request.getParameter("empType");
        int y = Integer.parseInt(request.getParameter("year"));
        String month = request.getParameter("month");
        String advance = request.getParameter("advance");
        double amount = Double.parseDouble(request.getParameter("amount"));

        Salary s11 = new Salary();

        s11.setFestival(amount);

        ISalary iSalary1 = new ISalaryImp();

        String a = iSalary1.addBonusSalary(y, empType, month, advance, s11);

        if (a.equals("Successfully Added!")) {
            
            request.setAttribute("su", a);
            request.getRequestDispatcher("/AddBonusSalary.jsp").forward(request, response);
        } else {
            
            request.setAttribute("er", a);
            request.getRequestDispatcher("/AddBonusSalary.jsp").forward(request, response);
        }
    }
}
