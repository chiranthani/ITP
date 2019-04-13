/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.Library;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import service.libraryAdd;
import service.libraryinterface;

/**
 *
 * @author jahrin
 */
@WebServlet(name = "libraryDelete", urlPatterns = {"/libraryDelete"})
public class libraryDelete extends HttpServlet {

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
          String ISBN_num = request.getParameter("ISBN_num");
           
           libraryinterface libint2  = new libraryAdd();
           libint2.deleteLibrary(ISBN_num);
           request.getRequestDispatcher("/libraryBooksView.jsp").forward(request, response);
            
            

    }


}

  

