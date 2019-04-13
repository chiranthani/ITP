<%-- 
    Document   : StudentDashboard
    Created on : 26-Aug-2018, 15:08:12
    Author     : Fasrin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>

        <jsp:include page="/WEB-INF/views/stuNAV.jsp"></jsp:include>
        <style>
            .socialMedia
            {
                background-color:#333;
                color:white;
                padding:07%;
            }

            a:link {
                text-decoration: none;
                

            }

        </style>

    <center>
        <table border="0" cellpadding="10" style="width: 80%; margin-left: 20px;font-size: 25px;" class="dashboard">
            <tbody>
                <tr>
                    <td><a href="profile.jsp"><img src="IMG/StudentIcon.png" width="209" height="223" /></a></td> &nbsp&nbsp&nbsp&nbsp
                    <td><a href="BooksView.jsp"><img src="IMG/course.png" width="209" height="223" /></a></td> &nbsp&nbsp&nbsp&nbsp
                    <td><a href=".jsp"><img src="IMG/time.jpg" width="209" height="223" /></a></td> &nbsp&nbsp&nbsp&nbsp
                    <td><a href=".jsp"><img src="IMG/timetable.png" width="209" height="223" /></a></td> &nbsp&nbsp&nbsp&nbsp
                </tr>
                <tr class="tText">
                    <td> <a href="profile.jsp"><b> Profile</b> </a> </td>
                    <td> <a href="BooksView.jsp"><b> Library </b></a> </td>
                    <td> <a href=""><b> TimeTable</b></a> </td>

                    <td> <a href=""><b> Exams & Results</b></a> </td>  
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
