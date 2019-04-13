<%-- 
    Document   : TimeTables
    Created on : Sep 13, 2018, 2:33:48 PM
    Author     : jahrin
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@include file="DBConfig.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <link rel="stylesheet" type="text/css" href="sidenav.css">
            <jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
            </head>
            <body>

            <%            Statement st1 = con.createStatement();
                String query1 = "SELECT hallNum FROM hall";
                ResultSet rs1 = st1.executeQuery(query1);

                Statement st2 = con.createStatement();
                String query2 = "SELECT subName FROM subject";
                ResultSet rs2 = st2.executeQuery(query2);

                Statement st3 = con.createStatement();
                String query3 = "SELECT FullName FROM employee where EmpType='Lecturer'";
                ResultSet rs3 = st3.executeQuery(query3);

            %>
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
                    background-color: #ddd;
                    color: black;
                }

                .topnav a.active {
                    background-color: gray;
                    color: white;
                }
            </style>
        </style>
        <div class="topnav">
            <a href="DashBoardManager.jsp">HOME</a>
            <a class="active" href="#">LECTURE </a>
            <a href="">EXAM</a>
        </div>  
        <div class="content">

            <div class="sidenav"  style="float:left;">
                <ul>      
                    <a href="TimeTables.jsp">Add Timetables </a>
                    <a href="">View Timetables</a>
                    <a href="">Edit & Update Timetables</a>

                </ul>
            </div>
        </div>
        <h1> <center> Add Lecture Timetables </center> </h1>

    <center>

        <form action="TimeTableServlet" method="POST" name="timetable">
            <table border="0" style="width:80%; margin-left: 50px">
                <tbody>
                    <tr>
                        <td>Time period &nbsp;</td>
                        <td><input type="text" name="date" value="" size="30"/></td>
                    <tr>
                    <tr>
                        <td>Date &nbsp;</td>
                        <td><select name="day">
                                <option>------ Select the Day ------</option>
                                <option>Monday</option>
                                <option>Tuesday</option>
                                <option>Wednesday</option>
                                <option>Thursday</option>
                                <option>Friday</option>
                                <option>Saturday</option>
                                <option>Sunday</option>
                            </select></td>
                    <tr>
                        <td>Subject &nbsp;</td>
                        <td> <select name="subject">
                                <option>---- Select the subject ---</option>
                                <% while (rs2.next()) {%>

                                <option value="<%=rs2.getString(1)%>"><%=rs2.getString(1)%></option>
                                <% } %>
                            </select> 
                        </td>  

                    </tr>

                    <tr>
                        <td>Hall Number &nbsp;</td>
                        <td>
                            <select name="hall">
                                <option>---- Select the Hall ----</option>
                                <% while (rs1.next()) {%>

                                <option value="<%=rs1.getString(1)%>"><%=rs1.getString(1)%></option>
                                <% } %>
                            </select> 
                        </td>  
                    </tr>

                    <tr>
                        <td>Lecturer Name &nbsp;</td>
                        <td><select name="lecturer">
                                <option>------ Select the Lecturer Name------</option>
                                <% while (rs3.next()) {%>

                                <option value="<%=rs3.getString(1)%>"><%=rs3.getString(1)%></option>
                                <% }%>
                            </select> 
                        </td>
                    </tr>
                </tbody>
            </table>
            <br>
            <br>
            <br>
            <input type="submit" value="ADD TIME TABLE"/>
        </form>
    </center>   
</div>

<br>
<br>

</body>
</html>
