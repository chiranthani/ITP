/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.Exam;

import service.Resultaddservice;
import service.resultinterface;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author jahrin
 */
@WebServlet(name = "resultdelete", urlPatterns = {"/resultdelete"})
public class resultdelete extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String resultID = request.getParameter("resultID");

        resultinterface resultinter2 = new Resultaddservice();
        resultinter2.deleteResult(resultID);
        request.getRequestDispatcher("/resultexam.jsp").forward(request, response);
    }

}
