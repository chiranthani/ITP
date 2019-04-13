<%-- 
    Document   : libraryEdit
    Created on : Aug 11, 2018, 1:37:55 PM
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

        <%

            Connection con = null;
            Statement statement = null;
            
        %>       





        <jsp:include page="/WEB-INF/views/librarynavi.jsp"></jsp:include>


            <div class="content">

                <div class="sidenav"  style="float:left;">
                    <ul>      
                        <a href="Addbooks.jsp">Add Books</a>
                        <a href="libraryBooksView.jsp">View All Books</a>
                        <a href="libraryEdit.jsp">Edit & Update</a>
                        <a href="libraryDelete.jsp">Delete</a>
                         <form action="LibraryReport" method="post">
                        <input type="submit" value="Report">
                    </form>
                    </ul>
                </div>
            </div>

        <h2  style="color:black;background-color:yellow"> View Library resources </h2>
            <br><br>
        <%@ page import="java.sql.*" %>
        
<table class="customers" >
            <tr>
                <th> ISBN_num   </th>
                <th> name       </th> 
                <th> author Name </th>
                <th> price      </th>
                <th> editon     </th>
                <th> subject    </th>
                <th>Availability</th>
            </tr>

            <%
                try {

                    con = DBConnection.createConnection();
                    statement = con.createStatement();

                    String sql = "Select * from libraryResources";
                    ResultSet rs = statement.executeQuery(sql);

                    while (rs.next()) {

            %>

            <tr>

                <td><%=rs.getString("ISBN_num")%>      </td>
                <td> <%=rs.getString("name")%>          </td>
                <td> <%= rs.getString("authorName")%>   </td>
                <td> <%= rs.getString("price")%>        </td>
                <td> <%=rs.getString("edition")%>       </td>
                <td> <%=rs.getString("subject")%>       </td>
                <td> <%=rs.getString("Availability")%>       </td>
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
