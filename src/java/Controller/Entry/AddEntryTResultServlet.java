/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.Entry;

import Model.EntryTest;
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
 * @author jahrin
 */
@WebServlet(name = "AddEntryTResultServlet", urlPatterns = {"/AddEntryTResultServlet"})
public class AddEntryTResultServlet extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
         String nic = request.getParameter("nic");
        String result = request.getParameter("result");


        EntryTest et = new EntryTest();

        et.setResult(result);

        EntryTestImp eti = new EntryTestImp();
        String q = eti.addTestResult(et, nic);


        if (q.equals("Successfully Added!")) {

            request.setAttribute("s1", q);
            request.getRequestDispatcher("/AddEntryTestResult.jsp").forward(request, response);

        } else {
            request.setAttribute("e1", q);
            request.getRequestDispatcher("/AddEntryTestResult.jsp").forward(request, response);
        }

    }
}
        
    

    

