<%-- 
    Document   : AddStudentAtt
    Created on : Aug 24, 2018, 7:48:36 PM
    Author     : Ganeesha
--%>

<%@page import="java.util.Date"%>
<%@page import="java.text.*"%>
<%@page import="java.util.Locale"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="util.DBConnection" %>
<%@page import="java.util.Calendar"%>
<%@page import="java.time.LocalDate"%>
<%@page import="javax.servlet.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

        <link rel="stylesheet" type="text/css" href="sidenav.css"> 
        <title>Add Student Attendance </title>
        <jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
        </head>
        <body>


        <jsp:include page="/WEB-INF/views/attendancenavi.jsp"></jsp:include>

        <%
            Date dnow = new Date();
            SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd");

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



        <h2  style="color:black;background-color:lightblue"> Add Student Attendance </h2>
        <br>

   
        <form name="form" action="addStudentAttServlet" method="post">
            <table cellpadding="3">

                <tr>
                    <td>Student ID</td>
                    <td><input type="text" name="sid" required></td>

                </tr>
                <tr>
                    <td>Date</td>
                    <td><input type="date" name="date" value="<%=ft.format(dnow)%>" ></td>                    
                </tr>
                <tr>
                    <td>Subject </td>
                    <td><select name="sub" >
                            <option value="please select" ></option> 
                            <%     try {

                                    con = DBConnection.createConnection();
                                    statement = con.createStatement();
                                    String sql = "SELECT subCode  FROM subject";

                                    resultSet = statement.executeQuery(sql);
                                    while (resultSet.next()) {
                            %>
                            <option value="<%=resultSet.getString("subCode")%>"><%=resultSet.getString("subCode")%></option>

                            <%
                                    }

                                } catch (Exception e) {

                                    e.printStackTrace();
                                }
                            %>
                        </select>
                    </td>
                </tr>

                <tr>
                    <td>status </td>
                    <td>  <input type="radio" name="status" value ="Present" > Present
                        <input type="radio" name="status" value="Absent"> Absent<br>
                    </td>
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
        <br><br>

        <h style=" font-size:20px; padding: 5px; font-style: normal; "><b>View Daily Attendance for Student</b></h> 
        <br><br>
        <table cellpadding="10" broader="1">

            <tr bgcolor="#33adff">
                <th>Student ID &nbsp;</th>
                <th>Student Name &nbsp;</th>
                <th>Date &nbsp;&nbsp;</th>
                <th>Subject &nbsp;</th>
                <th>Status &nbsp;</th>

            </tr>

            <%
                try {
                    con = DBConnection.createConnection();
                    statement = con.createStatement();
                    String sql = "SELECT * FROM stu_attendance a,student s where s.userID=a.sid AND a.date='" + ft.format(dnow) + "'";

                    resultSet = statement.executeQuery(sql);
                    while (resultSet.next()) {
            %>

            <tr>

                <td><%=resultSet.getString("a.sid")%></td>
                <td><%=resultSet.getString("s.fullname")%></td>
                <td><%=resultSet.getString("a.date")%></td>
                <td><%=resultSet.getString("a.subjectCode")%></td>
                <td><%=resultSet.getString("a.status")%></td>
            </tr>
            <%
                    }

                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>
        </table>
        <br><br>
    

<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</body>
</html>
