/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.Library;

import Model.issueClass;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import service.issueAdd;
import service.issueinterface;

/**
 *
 * @author jahrin
 */
@WebServlet(name = "issueUpdate", urlPatterns = {"/issueUpdate"})
public class issueUpdate extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String Sid = request.getParameter("Sid");
        String ISBN_num = request.getParameter("ISBN_num");
        String issueDate = request.getParameter("issueDate");
        String expiryDate = request.getParameter("expiryDate");
        String returnDate = request.getParameter("returnDate");
        int available = 1;

        issueinterface sub2 = new issueAdd();
        sub2.updateissue(Sid, returnDate, ISBN_num, issueDate);
        sub2.updateAvailability(available, ISBN_num);
        
        request.getRequestDispatcher("/issueEdit.jsp").forward(request, response);

    }

}
