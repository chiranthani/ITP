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
import service.LeaveCount;

/**
 *
 * @author jahrin
 */
@WebServlet(name = "addLeaveServlet", urlPatterns = {"/addLeaveServlet"})
public class addLeaveServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int emp = Integer.parseInt(request.getParameter("empNo"));
        String date = request.getParameter("date");
        String leaveType = request.getParameter("leaveType");
        float noOfDay = Float.parseFloat(request.getParameter("noOfDay"));

        EmpAttendance ea1 = new EmpAttendance();

        ea1.setEmpNo(emp);
        ea1.setDate2(date);
        ea1.setLType(leaveType);
        ea1.setDays(noOfDay);

        Attendance a1 = new Attendance();
        a1.addEmpLeave(ea1);

        LeaveCount c = new LeaveCount();

        int count = c.checkWorkingMonth(emp) + 12;

        int y = count / 12;
        if (c.checkCurrentYear(emp, y)) {

            if (leaveType.equalsIgnoreCase("Medical")) {

                float m = c.calMedicalLeave(emp, noOfDay, y);
                a1.addTotal(emp, m, leaveType, y);

            } else if (leaveType.equalsIgnoreCase("Annual")) {

                float a = c.calAnnualLeave(emp, noOfDay, y);
                a1.addTotal(emp, a, leaveType, y);

            } else if (leaveType.equalsIgnoreCase("Casual")) {

                float ca = c.calCasualLeave(emp, noOfDay, y);
                a1.addTotal(emp, ca, leaveType, y);
            }

        } else {
            a1.insert(emp, y);
            if (leaveType.equalsIgnoreCase("Medical")) {

                float m = c.calMedicalLeave(emp, noOfDay, y);
                a1.addTotal(emp, m, leaveType, y);

            } else if (leaveType.equalsIgnoreCase("Annual")) {

                float a = c.calAnnualLeave(emp, noOfDay, y);
                a1.addTotal(emp, a, leaveType, y);

            } else if (leaveType.equalsIgnoreCase("Casual")) {

                float ca = c.calCasualLeave(emp, noOfDay, y);
                a1.addTotal(emp, ca, leaveType, y);
            }
        }
        request.getRequestDispatcher("/AddLeave.jsp").forward(request, response);
    }
}
