<%-- 
    Document   : EmpoyeeUpdate
    Created on : Aug 25, 2018, 4:17:40 PM
    Author     : Hiruni Dep
--%>

<%@page import="java.sql.ResultSet"%>
<%@include file="DBConfig.jsp" %>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link rel="stylesheet" type="text/css" href="Style.css">
    </head>
    <body>

        <div class="sidenav">
            <a href="EmployeeNonAcademic.jsp"> <b>Insert Employee</b></a>
            <a href="#"> <b>Update Employees </b></a>
            <a href="EmployeeDeleteTable.jsp"> <b>Delete Employees </b></a>
        </div>

        <div class="content">
            <h2>Update Employee Details</h2>

            <%             String userID = request.getParameter("eid");

                Statement stmt = con.createStatement();

                String query = "select * from employee where userID = " + userID;
                ResultSet rs = stmt.executeQuery(query);
            %>

            <center>
                <form action="EmpoyeeFinalUpdate.jsp" method="POST">
                    <table border="0" style="width: 50%; margin-left: 50px; column-width: auto;">

                        <% while (rs.next()) {%>

                        <tr>
                            <td>
                                <input type="hidden" name="id" value="<%=userID%>" >
                            </td>
                        </tr>

                        <tr>
                            <td>
                                Full Name &nbsp;
                            </td>
                            <td>
                                <input type="text" name="name" value="<%=rs.getString("FullName")%>">
                            </td>
                        </tr>

                        <tr>
                            <td>
                                NIC &nbsp;
                            </td>
                            <td>
                                <input type="text" name="nic" value="<%=rs.getString("NIC")%>">
                            </td>
                        </tr>

                        <tr>
                            <td>
                                Address &nbsp;
                            </td>
                            <td>
                                <input type="text" name="add" value="<%=rs.getString("Address")%>">
                            </td>
                        </tr>

                        <tr>
                            <td>
                                Marital Status &nbsp;
                            </td>
                            <td>
                                <input type="text" name="state" value="<%=rs.getString("MaStatus")%>">
                            </td>
                        </tr>

                        <tr>
                            <td>
                                Email &nbsp;
                            </td>
                            <td>
                                <input type="text" name="mail" value="<%=rs.getString("Email")%>">
                            </td>
                        </tr>

                        <tr>
                            <td>
                                Contact Number (Mobile) &nbsp;
                            </td>
                            <td>
                                <input type="text" name="mob" value="<%=rs.getString("Mobile")%>">
                            </td>
                        </tr>

                        <tr>
                            <td>
                                Contact Number (Home) &nbsp;
                            </td>
                            <td>
                                <input type="text" name="hm" value="<%=rs.getString("Home")%>">
                            </td>
                        </tr>



                        <tr>
                            <td>
                                Employee Type &nbsp;
                            </td>
                            <td>
                                <input type="text" name="type" value="<%=rs.getString("EmpType")%>">
                            </td>
                        </tr>

                        <tr>
                            <td>
                                Education Qualification &nbsp;
                            </td>
                            <td>
                                <input type="text" name="qua" value="<%=rs.getString("EduQulification")%>">
                            </td>
                        </tr>

                        <tr>
                            <td>
                                Experience &nbsp;
                            </td>
                            <td>
                                <input type="text" name="ex" value="<%=rs.getString("Experience")%>">
                            </td>
                        </tr>



                        <% }%>

                    </table>

                    <br>

                    <tr>
                        <td>
                            <button type="submit" value="" name="submit" class="buttonLog"> UPDATE </button>
                        </td>
                    </tr>


                </form>

            </center>
        </div>
    </body>
</html>
