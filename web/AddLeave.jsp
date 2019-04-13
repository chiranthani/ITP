<%-- 
    Document   : AddLeave
    Created on : Aug 12, 2018, 10:05:21 AM
    Author     : Ganeesha
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="util.DBConnection" %>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="sidenav.css"> 
        <jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
            <title>Add Leave</title>

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

            Connection con = null;
            Statement statement = null;
            ResultSet resultSet = null;
        %>
        <div class="content">

            <div class="sidenav"  style="float:left;">
                <ul>    
                    <a href="AddLeave.jsp">Add Leave</a><br>
                    <a href="ViewTotalLeave.jsp">View Total Leave</a><br>
                   
                </ul>
            </div>
        </div>


    <h style="background-color: lightblue; padding: 5px; display: block; font:Arial; font-size: 20px;"><b>Add Employee Leave</b></h><br>



    <form name="form" action="addLeaveServlet" method="post">
        <table cellpadding="5">
            <tr>
                <td>Employee No</td>
                <td><input type="text" name="empNo" required></td>
            </tr>
            <tr>
                <td>Date</td>
                <td><input type="date" name="date" required></td>
            </tr>
            <tr>
                <td>Leave Type</td>
                <td><select name="leaveType" >
                        <option value="please select" ></option>    		
                        <option value="Medical">Medical</option>
                        <option value="Casual">Casual</option>
                        <option value="Annual">Annual</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>No of days/day</td>
                <td><select name="noOfDay" >
                        <option value="please select" ></option>   
                        <option value="0.5">Half Day</option>
                        <option value="1">One Day</option>
                        <option value="2">Two Days</option>
                </td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Add"/></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="reset" value="reset"/></td>
            </tr>

        </table>
    </form>


    <jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>   
</body>
</html>
