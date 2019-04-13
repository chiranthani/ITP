<%-- 
    Document   : AddAttendance
    Created on : Aug 12, 2018, 9:47:29 AM
    Author     : Ganeesha
--%>
<%@page import="java.util.Locale"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="util.DBConnection" %>
<%@page import="java.util.Calendar"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <link rel="stylesheet" type="text/css" href="sidenav.css"> 

        <title>Employee Attendance</title>	
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

        <jsp:include page="/WEB-INF/views/attendancenavi.jsp"></jsp:include>

        <%
            Calendar now = Calendar.getInstance();

            Connection con = null;
            Statement statement = null;
            ResultSet resultSet = null;
        %>
     

        <div class="content">

            <div class="sidenav"  style="float:left;">
                <ul>    
                    <a href="AddStudentAtt.jsp">Add Student Attendance</a><br>
                    <a href="AddEmployeeAtt.jsp">Add Employee Attendance</a><br>
                    <a href="AddLeavingTime.jsp">Add Leaving Time</a><br>

                </ul>
            </div>
        </div>
        
      

<h2  style="color:black;background-color:lightblue"> Add Employee Attendance </h2>
<br>
            <form name="form" action="addAttTimeServlet" method="post">

                <table cellpadding="3" align="center">

                    <tr>
                        <td>Employee No</td>
                        <td><input type="text" name="empNo" required></td>
                    </tr>
                    <tr>
                        <td>Year</td>
                        <td><input type="number" name="year" value="<%=now.get(Calendar.YEAR)%>" readonly></td>
                    </tr>
                    <tr>
                        <td>Month</td>
                        <td><input type="text" name="month" value="<%=now.getDisplayName(Calendar.MONTH, Calendar.LONG, Locale.getDefault())%>" readonly></td>
                    </tr>
                    <tr>
                        <td>Date</td>
                        <td><input type="number" name="date" value="<%=now.get(Calendar.DATE)%>" readonly></td>
                    </tr>
                    <tr>
                        <td>Attendance Time</td>
                        <td><input type="time" name="Atime" required></td>
                    </tr>

                    <tr>
                        <td></td>
                        <td><input type="submit" value="Add" ></td>
                    </tr>

                    <tr>
                        <td></td>
                        <td><input type="reset" value="reset" ></td>
                    </tr>

                </table>
            </form>
</body>
</html>
