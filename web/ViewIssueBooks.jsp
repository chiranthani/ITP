<%-- 
    Document   : issueEdit
    Created on : Aug 22, 2018, 6:21:43 PM
    Author     : Rashmini Perera
--%>
<%@page import="util.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="TableStyleSheet.css">  
        <link rel="stylesheet" type="text/css" href="sidenav.css"> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
        </head>
        <body>

        <jsp:include page="/WEB-INF/views/librarynavi.jsp"></jsp:include>

        <%@ page import="java.sql.*" %>
        <style>
            .customers {
                font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
                border-collapse: collapse;
                width: 80%;

            }

            .customers td, .customers th {
                border: 1px solid #ddd;
                padding: 8px;


            }

            .customers tr:nth-child(even){background-color: #f2f2f2;}

            .customers tr:hover {background-color: #ddd;}

            .customers th {
                padding-top: 12px;
                padding-bottom: 12px;
                text-align: left;
                background-color: #008ae6;
                color: white;
                width:120px;
            }
        </style>


        <%

            Connection con = null;
            Statement statement = null;
            ResultSet resultSet = null;
        %> 
        <div class="content">

            <div class="sidenav"  style="float:left;">
                <ul>      
                    <a href="AddIssueResources.jsp">Add Is</a>
                    <a href="ViewIssueBooks.jsp">View </a>
                    <a href="issueEdit.jsp">Add Return Details</a>
                   
                </ul>
            </div>
        </div>
        <h1> <center>View Issued Book Details </center> </h1>

        <table class="customers" >
            <tr>
                <th> Sid </th>
                <th> ISBN_num </th> 
                <th> issueDate </th>
                <th> expiryDate </th>
                <th> returnDate </th>        
            </tr>

            <%
                try {
                    con = DBConnection.createConnection();
                    statement = con.createStatement();
                    String sql = "Select * from issueresource";
                    ResultSet rs = statement.executeQuery(sql);

                    while (rs.next()) {

            %>

            <tr>

                <td><%=rs.getString("sid")%>  </td>
                <td> <%=rs.getString("ISBN_num")%></td>
                <td> <%= rs.getString("issueDate")%></td>
                <td> <%= rs.getString("expiryDate")%></td>
                <td> <%= rs.getString("returnDate")%></td>
            </tr>

            <%
                    }
                    con.close();
                } catch (Exception e) {
                    System.out.println("error");

                }
            %>
        </table

    </body>
</html>

