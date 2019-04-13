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
import service.Attendance;
import service.ISalary;
import service.ISalaryImp;

/**
 *
 * @author Ganeesha
 */
@WebServlet(name = "AddBasicSalaryServlet", urlPatterns = {"/AddBasicSalaryServlet"})
public class AddBasicSalaryServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int emp = Integer.parseInt(request.getParameter("empNo"));
        String month = request.getParameter("month");
        int y = Integer.parseInt(request.getParameter("year"));
        double basic = Double.parseDouble(request.getParameter("basic"));

        Salary salaryB = new Salary();

        salaryB.setEmpNo(emp);
        salaryB.setMonth(month);
        salaryB.setYear(y);
        salaryB.setBasic(basic);

        ISalary iSalary = new ISalaryImp();
        String added = iSalary.AddBasicSalary(salaryB);

        if (added.equals("Successfully Added!")) {
            
             
            request.setAttribute("suc", added);
            request.getRequestDispatcher("/BasicForNew.jsp").forward(request, response);
        } else {
            request.setAttribute("err", added);
            request.getRequestDispatcher("/BasicForNew.jsp").forward(request, response);
        }
    }
}
