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
import service.issueAdd;
import service.issueinterface;

/**
 *
 * @author jahrin
 */
@WebServlet(name = "issueDelete", urlPatterns = {"/issueDelete"})
public class issueDelete extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
          String Sid = request.getParameter("Sid");
         
                     issueinterface   sub3 = new issueAdd();
                    sub3.deleteissue(Sid);
            
              request.getRequestDispatcher("/result.jsp").forward(request, response);
           
     
    }
    }

    
