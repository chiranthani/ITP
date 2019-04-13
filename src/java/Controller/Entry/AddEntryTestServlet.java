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
@WebServlet(name = "AddEntryTestServlet", urlPatterns = {"/AddEntryTestServlet"})
public class AddEntryTestServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String nic = request.getParameter("nic");
        int no = Integer.parseInt(request.getParameter("no"));
        int olNo = Integer.parseInt(request.getParameter("olNo"));
        int index = Integer.parseInt(request.getParameter("index"));
        String maths = request.getParameter("maths");
        String english = request.getParameter("english");
        String language = request.getParameter("language");

        EntryTest et = new EntryTest();

        et.setName(name);
        et.setAddress(address);
        et.setNic(nic);
        et.setNo(no);
        et.setOlNo(olNo);
        et.setIndex(index);
        et.setMaths(maths);
        et.setEnglish(english);
        et.setLanguage(language);

        request.setAttribute("nic", nic);

        EntryTestImp q = new EntryTestImp();
        String aa = q.addDetails(et);

        if (aa.equals("You are selected for the Entry Test")) {
            
            String msg1 = "";
            request.setAttribute("msg1", msg1);
            request.setAttribute("s", aa);

            request.getRequestDispatcher("/viewVenue.jsp").forward(request, response);

        } else {
            
            String msg2 = "12";
            
            request.setAttribute("msg2", msg2);

            request.setAttribute("e", aa);

            request.getRequestDispatcher("/viewVenue.jsp").forward(request, response);
        }

    }
}
