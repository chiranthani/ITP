<%-- 
    Document   : DashBoardManager
    Created on : Aug 25, 2018, 4:12:26 PM
    Author     : Hiruni Dep
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>IMS</title>
    </head>

    <body>
        <style>
            .socialMedia
            {
                background-color:#333;
                color:white;
                padding:07%;
            }

            a:link {
                text-decoration: none;
                font-size: 25px;
                
            }

        </style>
        <jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>

        <jsp:include page="/WEB-INF/views/managerNAV.jsp"></jsp:include>


    <center>
        <table border="0" cellpadding="15" style="width: 80%; margin-left: 20px;" class="dashboard">
            <tr>
                <td> <a href="studentView.jsp"><img src="IMG/StudentIcon.png" width="209" height="223" ></a></td> &nbsp&nbsp&nbsp&nbsp
                <td><a href="EmployeeAdmin.jsp"><img src="IMG/Employee.png" width="209" height="223" ></a></td> &nbsp&nbsp&nbsp&nbsp
                <td><a href="Finance/viewUtilityBillDetails.jsp"><img src="IMG/Finance.png" width="209" height="223" ></a></td> &nbsp&nbsp&nbsp&nbsp
            
                <td><a href="sidenav1.jsp"><img src="IMG/course.png" width="209" height="223" ></a></td> &nbsp&nbsp&nbsp&nbsp
                <td><a href="Exam.jsp"><img src="IMG/timetable.png" width="209" height="223" ></a></td> &nbsp&nbsp&nbsp&nbsp

            </tr>
            <tr class="tText">
                <td> <a href="studentView.jsp"> <b>Student </b></a> </td>
                <td> <a href="EmployeeAdmin.jsp"><b> Employee</b> </a> </td>
                <td> <a href=""> <b>Finance </b></a> </td>
                <td> <a href="sidenav1.jsp"> <b> Course</b> </a> </td>
                <td> <a href="Exam.jsp"> <b> Exams & Results</b> </a> </td>
            </tr>
        </table>

        <table border="0" cellpadding="10" style="width:80%; margin-left: 50px;" class="dashboard">
            <tbody>
                <tr>
                    <td><a href="TimeTableHome.jsp"><img src="IMG/time.jpg" width="209" height="223" /></a></td> &nbsp&nbsp&nbsp&nbsp
                    <td><a href="BasicForNew.jsp"><img src="IMG/money.jpg" width="209" height="223" /></a></td> &nbsp&nbsp&nbsp&nbsp
                    <td><a href="AddEmployeeAtt.jsp"><img src="IMG/attendence.jpeg" width="209" height="223" /></a></td> &nbsp&nbsp&nbsp&nbsp
                    <td><a href="Addbooks.jsp"><img src="IMG/library1.png" width="209" height="223" /></a></td> &nbsp&nbsp&nbsp&nbsp
                    <!-- <td><a href=""><img src="IMG/.png" width="209" height="223" /></a></td> &nbsp&nbsp&nbsp&nbsp -->

                </tr>
                <tr class="tText">

                    <td> <a href="TimeTableHome.jsp"> <b>Time Table</b> </a> </td>
                    <td> <a href="BasicForNew.jsp"><b> Salary</b> </a> </td>
                    <td> <a href="AddEmployeeAtt.jsp"> <b>Attendance</b> </a> </td>
                    <td> <a href="Addbooks.jsp"><b> Library</b> </a> </td>
                    <!-- <td> <a href=""> Entry Test </a> </td>-->
                </tr>
        </table>

    </center>
    <br>
    <br>

    <footer class="socialMedia">
        <div style="float:left">
            MINDRICH College of Management Studies </br>
            Second Lane</br>
            Dehiwala </br>
            011 2 301904 
        </div>


        <div style="float:right">
            <a href="https://www.facebook.com/" style="text-decoration:none"> <img src="IMG/facebook-5-xxl.png" width="40px"> </a>
            <a href="https://www.instagram.com/" style="text-decoration:none"> <img src="IMG/instagram-5-xxl.png" width="40px"> </a>
            <a href="https://plus.google.com/" style="text-decoration:none"> <img src="IMG/google-plus-5-xxl.png" width="40px"> </a>
        </div>
    </footer>

</body>
</html>

