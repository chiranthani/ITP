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
 * @author Fasrin
 */
@WebServlet(name = "registerStudentStep2Servlet", urlPatterns = {"/registerStudentStep2Servlet"})
public class registerStudentStep2Servlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

            String pname = request.getParameter("pname");
            int pcontactno = Integer.parseInt(request.getParameter("pcontactno"));
            String nic = request.getParameter("nic");
            String occupation = request.getParameter("occupation");
            String wpaddress = request.getParameter("wpaddress");

            Student stu = new Student();

            stu.setPname(pname);
            stu.setPtelphone(pcontactno);
            stu.setPoccupation(occupation);
            stu.setWplace(wpaddress);

            IStudentService ss = new IStudentServiceImp();
            int a = ss.getID(nic);
            ss.secondStep(stu, a);

            request.setAttribute("id", a);

            request.getRequestDispatcher("/registerStep3.jsp").forward(request, response);

    }

}
