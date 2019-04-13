<%-- 
    Document   : EmpoyeeFinalUpdate
    Created on : Aug 25, 2018, 4:18:09 PM
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

    <% 
            int eid = Integer.parseInt(request.getParameter("id"));
            String fn = request.getParameter("name");
            String id = request.getParameter("nic");
            String ed = request.getParameter("add");
            String ms = request.getParameter("state");
            String ema = request.getParameter("mail");
            String mb = request.getParameter("mob");
            String ho = request.getParameter("hm");
            
            String et = request.getParameter("type");
            String eq = request.getParameter("qua");
            String ep = request.getParameter("ex");
            
            Statement st = con.createStatement();
            String query = "UPDATE employee SET FullName ='"+fn+"', NIC ='"+id+"', Address='"+ed+"', MaStatus ='"+ms+"', Email ='"+ema+"', Mobile ='"+mb+"', Home ='"+ho+"', EmpType ='"+et+"', EduQulification='"+eq+"', Experience='"+ep+"'"+ " WHERE  userID ='"+eid+"'";
            
            int result = st.executeUpdate(query);
            
            if(result >0 )
                response.sendRedirect("EmpoyeeUpdateTable.jsp");
            
            else
            out.println("ERROR");
        %>

    </body>
</html>

