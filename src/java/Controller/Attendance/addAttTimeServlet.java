/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.Attendance;

import Model.EmpAttendance;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import service.Attendance;

/**
 *
 * @author jahrin
 */
@WebServlet(name = "addAttTimeServlet", urlPatterns = {"/addAttTimeServlet"})
public class addAttTimeServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int emp = Integer.parseInt(request.getParameter("empNo"));
        int year = Integer.parseInt(request.getParameter("year"));
        String month = request.getParameter("month");
        int date = Integer.parseInt(request.getParameter("date"));
        String Atime = request.getParameter("Atime");

        EmpAttendance ea = new EmpAttendance();

        ea.setEmpNo(emp);
        ea.setYear(year);
        ea.setMonth(month);
        ea.setDate(date);
        ea.setAtime(Atime);

        Attendance a = new Attendance();
        a.addEmployeeAtt(ea);

        request.getRequestDispatcher("/AddEmployeeAtt.jsp").forward(request, response);

    }

}
