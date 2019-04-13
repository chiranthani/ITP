<%-- 
    Document   : libraryDelete
    Created on : Aug 11, 2018, 4:02:12 PM
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

        </head>
        <body>
        <%@ page import="java.sql.*" %> 

        <jsp:include page="/WEB-INF/views/librarynavi.jsp"></jsp:include>
        <%

            Connection con = null;
            Statement statement = null;

        %>       

        <div class="content">

            <div class="sidenav"  style="float:left;">
                <ul>      
                    <a href="Addbooks.jsp">Add Books</a>
                    <a href="libraryBooksView.jsp">View All Books</a>
                    <a href="libraryEdit.jsp">Edit & Update</a>
                    <a href="libraryDelete.jsp">Delete</a>
                </ul>
            </div>
        </div>
        <h2  style="color:black;background-color:yellow"> Delete  Library resources </h2>
        <table class="customers" >

            <tr>

                <th> ISBN_num  </th>
                <th> name       </th>
                <th> authorName </th>
                <th> price      </th>
                <th> edition    </th>  
                <th> subject    </th> 
                <th>Availability</th>
                <th> Action     </th> 

            </tr>

            <%                try {
                    con = DBConnection.createConnection();
                    statement = con.createStatement();

                    String sql = "Select * from libraryresources";
                    ResultSet rs = statement.executeQuery(sql);

                    while (rs.next()) {
            %>

            <tr>

                <td><%=rs.getString("ISBN_num")%>  </td>
                <td> <%=rs.getString("name")%></td>
                <td> <%= rs.getString("authorName")%></td>
                <td> <%= rs.getString("price")%></td>
                <td> <%=rs.getString("edition")%></td>
                <td> <%=rs.getString("subject")%></td> 
                <td> <%=rs.getString("Availability")%></td>
            <form  action="libraryDelete"  method="post">
                <td>
                    <input type="hidden" name="ISBN_num"  hidden value="<%=rs.getString("ISBN_num")%>">
                    <input type="submit"   value="Delete" >
                </td>
            </form>

        </tr>

        <%
                }
                con.close();
            } catch (Exception e) {
                System.out.println("error");

            }
        %>
    </table>

</body>
</html>
