<%-- 
    Document   : CourseView
    Created on : Aug 6, 2018, 9:37:55 PM
    Author     : rushaid
--%>

<%@page import="util.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="TableStyle.css"> 
        <link rel="stylesheet" type="text/css" href="formstyle1.css"> 
        <link rel="stylesheet" type="text/css" href="sidenavExam.css">        
        <link rel="stylesheet" type="text/css" href="formstyleExam.css">        
        <link rel="stylesheet" type="text/css" href="st1.css">         
        <link rel="stylesheet" type="text/css" href="formExam.css">       
        <link rel="stylesheet" type="text/css" href="formExam.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <script>
            function check() {
                if (confirm("Are you sure to Delete the row?")) {
                    //do something
                    document.getElementById("resultform").action = "./resultdelete";
                    document.getElementById("resultform").method = "POST";
                    document.getElementById("resultform").submit();
                } else {
                    //do something
                }
            }
        </script>
        <style>
            .topnav {
                overflow: hidden;
                background-color: #2196F3;
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
                background-color: #2196F3;
                color: black;
            }

            .topnav a.active {
                background-color: gray;
                color: white;
            }

        </style>
        <%

            Connection con = null;
            Statement statement = null;
            ResultSet resultSet = null;

        %>

        <!--header section-->
        <jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>

        </head>
        <body>
            
            <!--navigation tab on top-->
            <jsp:include page="/WEB-INF/views/stuNAV.jsp"></jsp:include>


            <div class="content">

                <div class="wrapper" style="height: 500px; width: 1075px; padding-left: 16px; padding-right: 16px; border-left-width: 16px;">

                    <h2 style="color:black;background:linear-gradient(yellow, greenyellow);height:40px; width: 100%;height: 55px;">Results</h2>

                <%@ page import="java.sql.*" %>

                <table id="customers">
                    <tr>

                        <th> Student ID</th>
                        <th> Subject Name</th>
                        <th> Marks</th> 
                        <!--                    <th colspan="2"> Action</th>-->
                    </tr>

                    <%
                        try {

                            con = DBConnection.createConnection();
                            statement = con.createStatement();
                            
                            String sql = "Select * from `result`";
                            ResultSet rs = statement.executeQuery(sql);

                            while (rs.next()) {

                    %>
                    <tr>

                        <td><%=rs.getString("studentID")%>  </td>
                        <td> <%= rs.getString("Subject_name")%></td>
                        <td> <%=rs.getString("marks")%></td>


<!--                    <td><a href="resultupdate.jsp?studentID=<%=rs.getString("studentID")%>">Update</a></td>

                <form  action="resultdelete"  method="post" id="resultform">
                    <td>      
                        <input type="hidden" name="studentID"  hidden value="<%=rs.getString("studentID")%>">
                        <input type="submit"  value="Delete" onclick="check()">
                    </td>
                </form>-->

                    </tr>
                    <%
                            }
                            con.close();
                        } catch (Exception e) {
                            System.out.println("error");
                        }
                    %>
                </table
            </div>
        </div>
    </div>


</body>
</html>
