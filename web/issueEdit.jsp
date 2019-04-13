<%-- 
    Document   : issueEdit
    Created on : Aug 22, 2018, 6:21:43 PM
    Author     : Rashmini Perera
--%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="util.DBConnection" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="TableStyleSheet.css">  
        <link rel="stylesheet" type="text/css" href="sidenav.css"> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
            <title></title>
        </head>
        <body>
        <jsp:include page="/WEB-INF/views/librarynavi.jsp"></jsp:include>

        <%@ page import="java.sql.*" %>
        <%
            Date dnow = new Date();
            SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd");

            Connection con = null;
            Statement statement = null;
            ResultSet resultSet = null;
        %>
        <div class="content">

            <div class="sidenav"  style="float:left;">
                <ul>      
                    <a href="AddIssueResources.jsp">Add Issue </a>
                    <a href="ViewIssueBooks.jsp">View Issued Details</a>
                    <a href="issueEdit.jsp">Add Return Details</a>

                </ul>
            </div>
        </div>
        <h1> <center> Add Return Books Details </center> </h1>

        <form name="form" action="Search" method="post">
            <table>

                <tr></tr>
                <tr></tr>
                <tr>
                    <td>Enter Book Number: </td>
                    <td><input type="text" name="id" required></td>
                    <td>Student ID</td>
                    <td><input type="text" name="sid" required></td>
                    <td><input type="submit" value="Find"/> </td>
                </tr>
            </table>
        </form>
        <%
            try {
                con = DBConnection.createConnection();
                statement = con.createStatement();
                String sql = "SELECT * FROM issueresource i,libraryresources r where (r.Availability = 0) AND ( i.ISBN_num='" + request.getAttribute("id") + "') AND (i.sid = '" + request.getAttribute("sid") + "')";

                resultSet = statement.executeQuery(sql);
                while (resultSet.next()) {
        %>
        <br><br>
        <form action="issueUpdate" method="POST"> 
            <table align="center" cellpadding="5">
                <tr><td>Student ID:</td>
                    <td><input type="text" name="Sid" value="<%=resultSet.getString("i.sid")%>"></td>
                </tr>  

                <tr>
                    <td>Book Number:</td>
                    <td><input type="text" name="ISBN_num" value="<%=resultSet.getString("i.ISBN_num")%>"></td>
                </tr>
                <tr>
                    <td>Issue Date:</td>
                    <td><input type="text" name="issueDate" value="<%=resultSet.getString("i.issueDate")%>"></td>
                </tr>
                <tr>
                    <td>Expiry Date:</td>
                    <td><input type="text" name="expiryDate" value="<%=resultSet.getString("i.expiryDate")%>"></td>
                </tr>

                <tr>
                    <td>Return Date :</td>
                    <td><input type="text" name="returnDate" value="<%=ft.format(dnow)%>" readonly></td>
                </tr>
                <tr>
                    <td> </td>
                    <td><input type="submit" value="Submit"> </td>
                </tr>




                <%
                        }

                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
            </table>

        </form>



    </body>
</html>

