<%-- 
    Document   : EmpInterviewResult
    Created on : Aug 30, 2018, 12:47:01 PM
    Author     : IT17135580
--%>

<%@page import="util.DBConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <table border="0" style="width: 100%; margin-left: 5px; column-width: auto;">
        <link rel="stylesheet" type="text/css" href="St.css">
        <link rel="stylesheet" type="text/css" href="TableStyleSheet.css">
        <link rel="stylesheet" type="text/css" href="Style.css"
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
    <%
        Connection con = null;
        Statement statement = null;
        ResultSet resultSet = null;
    %>
    <article><br>
        <article>
            <aside class="h">
                <h style="background-color: lightblue; padding: 5px; display: block; font:Arial; font-size: 20px;"><b>Check Interview Result</b></h><br>



                <center>
                    <h1>Please Enter your NIC </h1>
                <br>
                <form name="form" action="SearchInterviewResultServlet" method="post">
                    <div style="width: 75%; margin-left: 50px">
                        <label> Enter your NIC number</label>
                        <input type="text" name="cnic" required>
                        <br>
                        <br>
                        <input type="submit" value="Find"/>
                    </div>
                </form>
                </center>
                <br><br>

                <%
                    try {
                        con = DBConnection.createConnection();
                        statement = con.createStatement();
                        String sql = "SELECT * FROM emp_interview where NIC = '" + request.getAttribute("nic") + "'";

                        resultSet = statement.executeQuery(sql);
                        while (resultSet.next()) {
                %>
                <div align="center">

                    <table id="employee">

                        <tr>
                            <th>Name</th>
                            <th>NIC</th>
                            <th></th>
                            <th>Register</th>

                        </tr>
                        <tr>

                            <td><%=resultSet.getString("name")%></td>
                            <td><%=resultSet.getString("NIC")%></td>
                            <td><%=resultSet.getString("interviewStatus")%></td>


                            <td><a href="Employee.jsp?nic=<%=resultSet.getString("NIC")%>">Register</a></td> 

                        </tr>
                        <%
                                }

                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        %>
                    </table>
                </div>

                <h1 style="color: red;"> <%=(request.getAttribute("msg") ==null) ? "" : request.getAttribute("msg")%> <%=(request.getAttribute("msg1") == null) ? "" : request.getAttribute("msg1")%><%=(request.getAttribute("msg2") ==null) ? "" : request.getAttribute("msg2")%></h1>
                   <br>         
                    </aside>

                    </article>
                    <jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
                    </body>
                    </html>
