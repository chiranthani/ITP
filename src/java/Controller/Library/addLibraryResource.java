/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.Library;

import Model.libraryClass;
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
@WebServlet(name = "addLibraryResource", urlPatterns = {"/addLibraryResource"})
public class addLibraryResource extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        
                String name  = request.getParameter("name");
                String ISBN_num   = request.getParameter("ISBN_num");
                String authorName  =  request.getParameter("authorName");
                float price  =  Float.parseFloat(request.getParameter("price"));
                float edition  =  Float.parseFloat(request.getParameter("edition"));
                String subject   = request.getParameter("subject");
                int available =1;
                
                
            libraryClass  libRes =  new libraryClass ();
            
            libRes.setISBN_num(ISBN_num);
            libRes.setName(name);
            libRes.setAuthorName(authorName);
            libRes.setPrice(price);
            libRes.setEdition(edition);
            libRes.setSubject(subject);
            

            libraryinterface libint  = new libraryAdd();
                libint.addLibrary(libRes,available);
                request.getRequestDispatcher("/libraryBooksView.jsp").forward(request, response);
              
    }

 }
        
 
