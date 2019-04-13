<%-- 
    Document   : libraryUpdate
    Created on : Aug 11, 2018, 2:26:08 PM
    Author     : Rashmini Perera
--%>

<%@page import="util.DBConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="formstyle.css">   
        <link rel="stylesheet" type="text/css" href="sidenav.css"> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
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
                        <a href="Addbooks.jsp">Add Books </a>
                        <a href="#">View All Books</a>
                        <a href="libraryEdit.jsp">Edit & Update</a>
                        <a href="libraryDelete.jsp">Delete</a>
                    </ul>
                </div>
            </div>

            <h2  style="color:black;background-color:yellow"> Update Library resources </h2>

        <%@ page import="java.sql.*" %>
        <%String id = request.getParameter("code");%>

        <%
            try {

                con = DBConnection.createConnection();
                statement = con.createStatement();

                String sql = "Select * from libraryResources where ISBN_num='" + id + "'";
                ResultSet resultSet = statement.executeQuery(sql);

                while (resultSet.next()) {

        %>

        <form method="post" action="libraryUpdate">


            <table>
                <tr>
                    <td>ISBN_num</td>
                    <td><input type="text" name="ISBN_num" value="<%=resultSet.getString("ISBN_num")%>"readonly ></td>
                    
                </tr>
                
                
                <tr>
                    <td>name</td>
                    <td><input type="text" name="name"  value="<%=resultSet.getString("name")%>"></td>
                </tr>
                <tr>
                    <td>authorName</td>
                    <td><input type="text" name="authorName" value="<%=resultSet.getString("authorName")%>"></td>
                </tr>
                <tr>
                    <td>price</td>
                    <td><input type="text" name="price" value="<%=resultSet.getString("price")%>"></td>
                </tr>
                <tr>
                    <td>edition</td>
                    <td><input type="text" name="edition" value="<%=resultSet.getString("edition")%>"></td>
                </tr>
                <tr>
                    <td>subject</td>
                    <td><input type="text" name="subject" value="<%=resultSet.getString("subject")%>"></td>
                </tr>
                
                <tr>
                    <td></td>
                    <td><input type="submit" value="Update"></td>
                </tr>
            </table>
       


    </form>           


    <%
            }
            con.close();
        } catch (Exception e) {

            e.printStackTrace();
        }
    %>

</body>
</html>
