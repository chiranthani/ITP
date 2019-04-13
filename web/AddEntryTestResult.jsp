<%-- 
    Document   : AddEntryTestResult
    Created on : Aug 30, 2018, 2:07:36 PM
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
        <title>Add Entry Test Result</title>
        <jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>

    </head>
    <body>
        <article>
            <%
                Calendar now = Calendar.getInstance();
                Connection con = null;
                Statement statement = null;
                ResultSet resultSet = null;
                int a = 0;
            %>

            <jsp:include page="/WEB-INF/views/navigation.jsp"></jsp:include>
            <article>
                <aside class="h"> 
                    <h style="background-color: lightblue; padding: 5px; display: block; font:Arial; font-size: 20px;"><b>Add Entry Test Result</b></h><br>
                    <br>

                    <form name="form1" action="AddEntryTResultServlet" onsubmit="return formValidate()" method="post" >

                        <table aling ="right" cellpadding="5">

                            <th></th> 
                            <tr></tr>
                            <tr></tr>
                            <tr>
                                <td>Candidate NIC</td>
                                <td><input type="text" name="nic" > </td>


                            </tr>

                            <tr>
                                <td>Result</td>
                                <td>  <input type="radio" name="result" value ="Pass" > Pass
                                    <input type="radio" name="result" value="Fail"> Fail<br>
                                </td>

                            </tr>

                            <tr>
                                <td style="color: red; font-size: 17px; font-style: italic;"><b><%=(request.getAttribute("e1") == null) ? "" : request.getAttribute("e1")%></b><b><%=(request.getAttribute("s1") == null) ? "" : request.getAttribute("s1")%></b></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td></td>

                                <td><input type="submit" value="Insert" ></td>

                            </tr>

                            <tr>
                                <td></td>
                                <td><input type="reset" value="Reset"/></td>
                            </tr>

                        </table>                            
                    </form>
                    <br><br>
                </aside>
            </article>    

            <jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
        </div>
</body>
</html>