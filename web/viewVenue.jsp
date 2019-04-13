<%-- 
    Document   : viewVenue
    Created on : Aug 30, 2018, 11:04:30 AM
    Author     : IT17135580
--%>
<%@page import="java.util.Locale"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="util.DBConnection" %>
<%@page import="java.util.Calendar"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>View </title>
    <table border="0" style="width: 100%; margin-left: 5px; column-width: auto;">
        <link rel="stylesheet" type="text/css" href="St.css">
        <link rel="stylesheet" type="text/css" href="TableStyleSheet.css">
        <tbody>
            <tr>
                <td>
                    <div>
                        <img src="IMG/CaptureNew.PNG" width="500" height="200" > 
                    </div>
                </td>
                <td></td>
                <td>
                    <div>
                        <a href="profile.jsp"> <img src="IMG/1.png" width="80px"></a>
                        <br>



                    </div>
                </td>
            </tr>
        </tbody>
    </table>

</head>
<body>
    <article><br>
        <article>
            <aside class="h">
                <br><br> 
                <%
                    String nic = request.getParameter("nic");

                    // Calendar now = Calendar.getInstance();
                    Connection con = null;
                    Statement statement = null;
                    ResultSet resultSet = null;

                %>

                <center>
                     <h style="color: red; font-size: 17px;"><b><%=(request.getAttribute("msg1") == null) ? "" : request.getAttribute("msg1")%></b><b><%=(request.getAttribute("msg2") == null) ? "" : request.getAttribute("msg2")%></b></h>
                     <br>
                <br>
                <h style="color: red; font-size: 17px;"><b><%=(request.getAttribute("e") == null) ? "" : request.getAttribute("e")%></b><b><%=(request.getAttribute("s") == null) ? "" : request.getAttribute("s")%></b></h>
                </center>
                <br><br><br><br>

                <input type="button" onclick="location.href='HOME.jsp'"  value = "Exit">
                <br><br><br><br>
            </aside>
        </article>
        <jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
    </div>
</body>
</html>
