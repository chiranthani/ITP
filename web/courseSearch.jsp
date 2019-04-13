<%-- 
    Document   : courseSearch
    Created on : Aug 6, 2018, 10:00:23 PM
    Author     : jahrin
--%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="util.DBConnection" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    </head>
    <body>
        <form action="coursesearch1" method="post">

            enter Course Code:
            <input type="text"  name="code">
            <input type="submit"  value="submit">



        </form>






    </body>
</html>
