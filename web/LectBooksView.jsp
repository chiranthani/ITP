<%-- 
    Document   : BooksView
    Created on : Sep 23, 2018, 4:59:57 PM
    Author     : jahrin
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="util.DBConnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
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
                
                                .topnav {
                    overflow: hidden;
                    background-color: black;
                }

                .topnav a {
                    float: left;
                    display: block;
                    color: white;
                    text-align: center;
                    padding: 14px 16px;
                    text-decoration: none;
                    font-size: 17px;
                }

                .topnav a:hover {
                    background-color: #ddd;
                    color: black;
                }

                .topnav a.active {
                    background-color: #2196F3;
                    color: white;
                }
                
            </style>

        </head>
        <body>
        <jsp:include page="/WEB-INF/views/LectNAV.jsp"></jsp:include>

            <br><br>

        <%

            Connection con = null;
            Statement statement = null;

        %>    
        
       
        
        <h2>Available Books </h2>
        <table class="customers" aling="center">
            <tr>
                <th> ISBN_num   </th>
                <th> name       </th> 
                <th> author Name </th>
                <th> price      </th>
                <th> editon     </th>
                <th> subject    </th>

            </tr>

            <%                try {

                    con = DBConnection.createConnection();
                    statement = con.createStatement();

                    String s = "SELECT * FROM libraryResources where Availability = 1 ";

                    ResultSet rs = statement.executeQuery(s);

                    while (rs.next()) {

            %>

            <tr>

                <td><%=rs.getString("ISBN_num")%>      </td>
                <td> <%=rs.getString("name")%>          </td>
                <td> <%= rs.getString("authorName")%>   </td>
                <td> <%= rs.getString("price")%>        </td>
                <td> <%=rs.getString("edition")%>       </td>
                <td> <%=rs.getString("subject")%>       </td>

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



