<%-- 
    Document   : DBConfig
    Created on : Sep 10, 2018, 11:29:01 AM
    Author     : jahrin
--%>

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% Class.forName("com.mysql.jdbc.Driver"); %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <%
            
            String url = "jdbc:mysql://localhost:3306/ims";
            String User = "root";
            String pass = "mjahrin#1srth";

            Connection con = DriverManager.getConnection(url, User, pass);
            
            if (con != null)
                out.print("Connected");
            else
                out.println("Error");
        %>
    </body>
</html>
