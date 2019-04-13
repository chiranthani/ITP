<%-- 
    Document   : AddLeavingTime
    Created on : Sep 26, 2018, 3:36:32 PM
    Author     : jahrin
--%>

<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Date"%>
<%@page import="java.util.Locale"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="sidenav.css"> 
    </head>
    <body>

        <jsp:include page="/WEB-INF/views/attendancenavi.jsp"></jsp:include>
        <%

            Calendar now = Calendar.getInstance();
          //  Date d = new Date();
            SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd");
            // Date i = new Date(CURRENT_TIME_MILLIS);
            DateFormat time = new SimpleDateFormat("HH:mm");
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



        <h2  style="color:black;background-color:lightblue"> Add Leaving Time </h2>
        <br><br>


        <form name="form" action="addLeaveTimeServlet" method="post">
            <table cellpadding="7" align="center">

                <tr>
                    <td>Employee No</td>
                    <td><input type="text" name="empNo" required></td>

                    <td>Year</td>
                    <td><input type="number" name="year" value="<%=now.get(Calendar.YEAR)%>" readonly></td>

                </tr>
                <tr>
                    <td>Month</td>
                    <td> <input type="text" name="month" value="<%=now.getDisplayName(Calendar.MONTH, Calendar.LONG, Locale.getDefault())%>" readonly></td>
                </tr>

                <tr>
                    <td>Date</td>
                    <td><input type="number" name="date" value="<%=now.get(Calendar.DATE)%>" readonly></td>
                </tr>
                <tr>
                    <td><input type="hidden" ></td>
                    <td>Leaving Time</td>
                    <td><input type="time" name="Ltime" value="<%=time.format(now.getTime())%>"></td>

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
        <br><br><br>
        <jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
    </body>
</html>
