<%-- 
    Document   : utilities
    Created on : Sep 29, 2018, 7:40:46 PM
    Author     : Nirash
--%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat;"%>
<%@page import="java.util.Date;"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>



    <body>
        <h1>Hello World!</h1>

        <form action="utilities" method="post">

            <h1> <%
                Calendar calendar = Calendar.getInstance();
                calendar.setTime(new Date());
                out.print(calendar.get(Calendar.YEAR));
                %>
            </h1>
            <h2>Telephone</h2>

            <table border="4" width="2" cellspacing="2" cellpadding="2">


                <thead>
                    <tr>
                        <th>Month</th>
                        <th>Price</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>jan</td>
                        <td><input type="text" id="jan"/></td>
                    </tr>
                    <tr>
                        <td>Feb</td>
                        <td><input type="text" id="feb"/></td>
                    </tr>
                    <tr>
                        <td>March</td>
                        <td><input type="text" id="march"/></td>
                    </tr>
                    <tr>
                        <td>April</td>
                        <td><input type="text" id="april"/></td>
                    </tr>
                    <tr>
                        <td>May</td>
                        <td><input type="text" id="may"/></td>
                    </tr>
                    <tr>
                        <td>june</td>
                        <td><input type="text" id="june"/></td>
                    </tr>
                    <tr>
                        <td>july</td>
                        <td><input type="text" id="july"/></td>
                    </tr>
                </tbody>
            </table>

            <h2>Electricity</h2>
            <table border="4" width="2" cellspacing="2" cellpadding="2">


                <thead>
                    <tr>
                        <th>Month</th>
                        <th>Price</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>jan</td>
                        <td><input type="text" id="jan"/></td>
                    </tr>
                    <tr>
                        <td>Feb</td>
                        <td><input type="text" id="feb"/></td>
                    </tr>
                    <tr>
                        <td>March</td>
                        <td><input type="text" id="march"/></td>
                    </tr>
                    <tr>
                        <td>April</td>
                        <td><input type="text" id="april"/></td>
                    </tr>
                    <tr>
                        <td>May</td>
                        <td><input type="text" id="may"/></td>
                    </tr>
                    <tr>
                        <td>june</td>
                        <td><input type="text" id="june"/></td>
                    </tr>
                    <tr>
                        <td>july</td>
                        <td><input type="text" id="july"/></td>
                    </tr>
                </tbody>
            </table>
        </form>
    </body>
</html>
