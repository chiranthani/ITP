<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="util.DBConnection" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <link rel="stylesheet" type="text/css" href="St.css">
        <title>Update Salary</title>
        <jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>

        </head>

        <body>

        <article>

        <jsp:include page="/WEB-INF/views/navigation.jsp"></jsp:include>

            <article>       


                <aside class="h"> 


                    <h style="background-color: lightblue; padding: 5px; display: block; font:Arial; font-size: 20px;"><b>Update Salary Details</b></h><br>
                    <br>

                <%
                    String id = request.getParameter("EID");

                    Connection connection = null;
                    Statement statement = null;
                    ResultSet resultSet = null;
                %>
                <%
                    try {
                        connection = DBConnection.createConnection();
                        statement = connection.createStatement();
                        String sql = "SELECT *  FROM Salary where EID=" + id;

                        resultSet = statement.executeQuery(sql);
                        while (resultSet.next()) {
                %>

                <form method="post" action="UpdateSalaryServlet">
                    <table align="center">
                        <tr>
                            <td>Employee No</td>
                            <td><input type="text" name="empNo" value="<%=resultSet.getString("EID")%>" readonly></td>
                        </tr>
                        <tr>
                            <td>Month</td>
                            <td><input type="text" name="month" value="<%=resultSet.getString("month")%>" readonly></td>

                        </tr>	
                        <tr>
                            <td>Year</td>
                            <td><input type="text" name="year" value="<%=resultSet.getString("year")%>" readonly></td>
                        </tr>
                        <tr>
                            <td>Basic Salary</td>
                            <td><input type="text" name="basic" value="<%=resultSet.getString("basic_salary")%>"></td>
                        </tr>
                        <tr>
                            <td>Incentive</td>
                            <td><input type="text" name="bonus" value="<%=resultSet.getString("bonus")%>"></td>
                        </tr>
                        <tr>
                            <td>Deductions</td>
                            <td><input type="text" name="deduction" value="<%=resultSet.getString("deductions")%>"></td>
                        </tr>
                        <tr>
                            <td>Festival Advance</td>
                            <td><input type="text" name="festival" value="<%=resultSet.getString("festival")%>"></td>
                        </tr>
                        <tr>
                        </tr>
                        <tr>
                            <td></td>
                            <td><input type="submit" value="Update " /></td>

                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><input type="reset" value="Reset"/></td>
                        </tr>
                    </table>
                    <br><br><br>
                </form>
                <%
                        }

                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>

            </aside>
            </aside> 
        </article>	

        <jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>

    </body>
</html>