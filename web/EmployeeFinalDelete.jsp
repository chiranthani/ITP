<%-- 
    Document   : EmployeeFinalDelete
    Created on : Aug 25, 2018, 4:16:43 PM
    Author     : Hiruni Dep
--%>

<%@include file="DBConfig.jsp" %>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
        <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>IMS</title>
       <link rel="stylesheet" type="text/css" href="Style.css">
    </head>
    
    <body>
        
        <% String userID = request.getParameter("eid");
           Statement st = con.createStatement();
           
           String query = "delete from employee where userID = " +userID;
           
           int result = st.executeUpdate(query);
           
           if (result > 0)
              response.sendRedirect("EmployeeDeleteTable.jsp");
           else
              out.println("ERROR"); 
        %>
        
    </body>
</html>

