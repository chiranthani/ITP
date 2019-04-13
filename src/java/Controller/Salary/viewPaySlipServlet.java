/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
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
//import service.ISalary;
//import service.ISalaryImp;

/**
 *
 * @author jahrin
 */
@WebServlet(name = "viewPaySlipServlet", urlPatterns = {"/viewPaySlipServlet"})
public class viewPaySlipServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int empNo = Integer.parseInt(request.getParameter("empNo"));
        int year = Integer.parseInt(request.getParameter("year"));
        String month = request.getParameter("month");

        //  ISalary n = new ISalaryImp();
        //   li = n.searchPaysheet(year, month);
        //  request.setAttribute("list", li);
        
        request.setAttribute("empNo", empNo);
        request.setAttribute("year", year);
        request.setAttribute("month", month);

        request.getRequestDispatcher("/PaySlip.jsp").forward(request, response);

    }

}
