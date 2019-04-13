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
@WebServlet(name = "addIssueResource", urlPatterns = {"/addIssueResource"})
public class addIssueResource extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String Sid = request.getParameter("Sid");
        String ISBN_num = request.getParameter("ISBN_num");
        String issueDate = request.getParameter("issueDate");
        String expiryDate = request.getParameter("expiryDate");
        int available=0;
        issueClass ic = new issueClass();

        ic.setSid(Sid);
        ic.setISBN_num(ISBN_num);
        ic.setissueDate(issueDate);
        ic.setexpiryDate(expiryDate);

        issueinterface issue1 = new issueAdd();
        issue1.addissue(ic);
        issue1.updateAvailability(available, ISBN_num);
        
        request.getRequestDispatcher("/AddIssueResources.jsp").forward(request, response);

    }
}
