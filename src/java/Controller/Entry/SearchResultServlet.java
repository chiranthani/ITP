/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.Entry;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import service.EntryTestImp;

/**
 *
 * @author Ganeesha
 */
@WebServlet(name = "SearchResultServlet", urlPatterns = {"/SearchResultServlet"})
public class SearchResultServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String nic = request.getParameter("cnic");

        EntryTestImp n = new EntryTestImp();

        if (n.checkRegister(nic)) {

            String msg2 = "You have already registered..!";
            request.setAttribute("msg2", msg2);
            request.getRequestDispatcher("/EntryTestResult.jsp").forward(request, response);

        } else {
            String a = n.searchEntryTestResult(nic);
            if (a.equalsIgnoreCase("Fail")) {

                String msg = "You are not qualified for the Course";
                request.setAttribute("msg", msg);
                request.getRequestDispatcher("/EntryTestResult.jsp").forward(request, response);

            } else if (a.equalsIgnoreCase("non")) {

                String msg1 = "The NIC you have entered is mismatch";
                request.setAttribute("msg1", msg1);
                request.getRequestDispatcher("/EntryTestResult.jsp").forward(request, response);

            } else if (a.equalsIgnoreCase("Pass")) {
                request.setAttribute("nic", nic);
                request.getRequestDispatcher("/EntryTestResult.jsp").forward(request, response);

            }
        }
    }

}
