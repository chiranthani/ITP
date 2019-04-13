/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.Attendance;

import Model.StuAttendance;
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
@WebServlet(name = "addStudentAttServlet", urlPatterns = {"/addStudentAttServlet"})
public class addStudentAttServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int sid = Integer.parseInt(request.getParameter("sid"));
        String date = request.getParameter("date");
        String subject = request.getParameter("sub");
        String status = request.getParameter("status");

        StuAttendance sa = new StuAttendance();

        sa.setSid(sid);
        sa.setDate(date);
        sa.setSubject(subject);
        sa.setStatus(status);

        Attendance s1 = new Attendance();
        s1.addStudentAttendance(sa);

        request.getRequestDispatcher("/AddStudentAtt.jsp").forward(request, response);

    }

}
