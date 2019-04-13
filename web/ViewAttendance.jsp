<%-- 
    Document   : ViewAttendance
    Created on : Sep 22, 2018, 10:47:32 PM
    Author     : Ganeesha
--%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Locale"%>
<%@page import="util.DBConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
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
<jsp:include page="/WEB-INF/views/LectNAV.jsp"></jsp:include>
            <article>
            <%
               
                Connection con = null;
                Statement statement = null;
                ResultSet resultSet = null;
            %>

            <aside class="h"  >
                <h1 style="background-color: lightblue; padding: 5px; display: block; font:Arial; font-size: 20px;"><b>Attendance </b></h1><br>
                <table border="1" cellpadding="5" align="center">
                    <tr>
                        <td>Year </td>
                        <td>Month </td>
                        <td>Count of Worked Days </td>
                        <td>OT Hours</td>
                    </tr>
                    <%
                        try {
                            con = DBConnection.createConnection();
                            statement = con.createStatement();
                            String sql = "SELECT count(date),sum(ot_hours),month,year FROM emp_attendance where (eid=" + session.getAttribute("id") + ") group by month,year";

                            resultSet = statement.executeQuery(sql);
                            while (resultSet.next()) {
                    %>


                    <tr>
                        <td><%=resultSet.getString("year")%></td>
                        <td><%=resultSet.getString("month")%></td>
                        <td><%=resultSet.getString("count(date)")%></td>
                        <td><%=resultSet.getString("sum(ot_hours)")%></td>
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
        </article> 
        <jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
    </body>
</html>