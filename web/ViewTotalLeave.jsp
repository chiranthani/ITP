<%-- 
    Document   : ViewTotalLeave
    Created on : Sep 26, 2018, 4:13:25 PM
    Author     : jahrin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="sidenav.css"> 
        <jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
    </head>
    <body>
        <jsp:include page="/WEB-INF/views/attendancenavi.jsp"></jsp:include>

         <div class="content">

            <div class="sidenav"  style="float:left;">
                <ul>    
                    <a href="AddLeave.jsp">Add Leave</a><br>
                    <a href="ViewTotalLeave.jsp">View Total Leave</a><br>
                   
                </ul>
            </div>
        </div>
    </body>
</html>
