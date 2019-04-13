<%-- 
    Document   : lecturerDashboard
    Created on : 26-Aug-2018, 20:32:06
    Author     : Fasrin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

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

        <jsp:include page="/WEB-INF/views/LectNAV.jsp"></jsp:include>


    <center>
        <table border="0" cellpadding="10" style="width: 80%; margin-left: 20px;" class="dashboard">
            <tbody>
                <tr>

                    <td><a href=""><img src="IMG/time_1.jpg" width="209" height="223" /></a></td> &nbsp&nbsp&nbsp&nbsp
                    <td><a href=""><img src="IMG/timetable.png" width="209" height="223" /></a></td> &nbsp&nbsp&nbsp&nbsp
                    <td><a href="LectBooksView.jsp"><img src="IMG/book.png" width="209" height="223" /></a></td> &nbsp&nbsp&nbsp&nbsp
                    <td><a href="ViewAttendance.jsp"><img src="IMG/lec.png" width="209" height="223" /></a></td> &nbsp&nbsp&nbsp&nbsp
                </tr>
                <tr class="tText">

                    <td> <a href="TimeTableSearch.jsp"><b> TimeTable </b></a> </td>
                    <td> <a href="ExamresultView.jsp"><b> Results</b></a> </td>
                    <td> <a href="LectBooksView.jsp"><b> Library</b></a> </td>
                    <td> <a href="ViewAttendance.jsp"><b> Attendance</b> </a> </td>
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
