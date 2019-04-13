<%-- 
    Document   : EmployeeAdmin
    Created on : Aug 25, 2018, 4:13:24 PM
    Author     : Hiruni Dep
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
        <link rel="stylesheet" type="text/css" href="Style.css">
    </head>

    <body>


        <hr color="blue">

        <br>
        <br>

    <center>
        <img src="IMG/Employee.png" width="200" height="200">

        <br>
        <br>
    </center>

    <center>
        <table border="0" style="width: 80%; margin-left: 50px; text-align: center" >
            <tbody>
                <tr>
                    <td>
                        <a href="EmployeeNonAcademic.jsp">
                            <input type="submit" value="INSERT & EDIT EMPLOYEE DETAILS" name="insert"/>
                        </a>

                        <br>
                        <br>
                        <br>
                        <br>

                        <a href="AddInterviewResult.jsp">
                            <input type="submit" value="ADD EMPLOYEE INTERVIEW RESULT" name="insert" />
                        </a>

                        <br>
                        <br>
                        <br>
                        <br>
                        <a>
                        <form action="EmployeeReportServlet" method="POST">
                            <input type="submit" value="Generate Report">
                        </form>
                        </a>
                    </td>
                </tr>
            </tbody>
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
