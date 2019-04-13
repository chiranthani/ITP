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
@WebServlet(name = "libraryUpdate", urlPatterns = {"/libraryUpdate"})
public class libraryUpdate extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        libraryClass  crs1 =  new libraryClass ();
            
            
            
            String ISBN_num = request.getParameter("ISBN_num");           
            String name = request.getParameter("name");
            String authorName =  request.getParameter("authorName");
            float price  =  Float.parseFloat(request.getParameter("price"));
            float edition  =  Float.parseFloat(request.getParameter("edition"));
            String subject = request.getParameter("subject");
            
                                   
            crs1.setISBN_num(ISBN_num);
            crs1.setName(name);
            crs1.setAuthorName(authorName);
            crs1.setPrice(price);
            crs1.setEdition(edition);
            crs1.setSubject(subject);
            
            
                  libraryinterface libin = new libraryAdd();                    
            
                  libin. updateLibrary(ISBN_num,crs1);
                 
                 request.getRequestDispatcher("/libraryEdit.jsp").forward(request, response);
            
        
     
    }

}
