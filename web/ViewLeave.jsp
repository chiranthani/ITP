<%-- 
    Document   : ViewLeave
    Created on : Sep 23, 2018, 12:19:39 AM
    Author     : Ganeesha
--%>

<%@page import="util.DBConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="St.css">
        <jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>

            <style>
                .button {
                    display: inline-block;
                    width:80px;
                    padding: 4px 7px;
                    font-size: 15px;
                    cursor: pointer;
                    text-align: center;	
                    text-decoration: none;
                    outline: none;
                    color: #fff;
                    background-color: #0099ff;
                    border: none;
                    border-radius: 10px;
                    box-shadow: 0 3px #666;
                }

                .button:hover {background-color: #00cccc}

                .button:active {
                    background-color: #3e8e41;
                    box-shadow: 0 5px #666;
                    transform: translateY(4px);
                }
                .button4 {border-radius: 12px;}



                body {
                    margin: 0;
                    font-family: Arial, Helvetica, sans-serif;
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
            <div class="topnav">
                <a href="lecturerDashboard.jsp">HOME</a>               
                <a href="">STUDENT RESULT</a>
                <a href="">COURSE</a>
                <a class="active" href="#">ATTENDANCE</a>               
                <a href="">TIME TABLE</a>
                <a href="">LIBRARY</a>
            </div>
            <article>
            <%
                Calendar now = Calendar.getInstance();
                Connection con = null;
                Statement statement = null;
                ResultSet resultSet = null;
            %>

            <aside class="h"  >
                <h1 style="background-color: lightblue; padding: 5px; display: block; font:Arial; font-size: 20px;"><b>Leave</b></h1><br>
                <aside class="j">  
                    <caption><b>Use Total Leaves </b></caption>
                    <table border="1" cellpadding="5" > 
                        <tr>
                            <td>Year </td>
                            <td>Medical Leave</td>
                            <td>Casual Leave </td>
                            <td>Annual Leave</td>
                        </tr>
                        <%
                            try {
                                con = DBConnection.createConnection();
                                statement = con.createStatement();
                                String sql = "SELECT * FROM total_leave  where (empID=" + session.getAttribute("id") + ") group by working_year";

                                resultSet = statement.executeQuery(sql);
                                while (resultSet.next()) {
                        %>


                        <tr>
                            <td><%=resultSet.getString("empID")%></td>
                            <td><%=resultSet.getString("medical")%></td>
                            <td><%=resultSet.getString("annual")%></td>
                            <td><%=resultSet.getString("casual")%></td>
                        </tr>



                        <%
                                }

                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        %>   
                    </table>

                    <br><br>
                </aside>
                <caption> <b>Search Available Leaves</b></caption>

                <form name="form" action="searchTotalLeaves" method="post">
                    <table >
                        <tr>

                        </tr>
                        <tr>
                            <td>Employee No</td>
                            <td><input type="text" name="empNo" required></td>
                            <td><input type="submit" value="Find"> </td>
                        </tr>
                    </table>
                </form>
                <br>
                <%
                    try {
                        con = DBConnection.createConnection();
                        statement = con.createStatement();
                        String sql = "SELECT * FROM  where  = '" + request.getAttribute("") + "'";

                        resultSet = statement.executeQuery(sql);
                        while (resultSet.next()) {
                %>
                <table cellpadding="8">
                    <tr>
                        <td>Employee No </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>Medical Leaves</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>Casual Leaves</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>Annual Leaves</td>
                        <td></td>
                    </tr>
                </table>
                <%
                        }

                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
            </aside>
            <br>
            <br>
        </article>        
        <jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
    </body>
</html>