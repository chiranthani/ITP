<%-- 
    Document   : courseViewmain
    Created on : Aug 25, 2018, 11:34:24 AM
    Author     : jahrin
--%>

<%@page import="util.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="sidenav.css"> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="TableStyleSheet.css"> 
        <title></title>
        <style>

            .customers {
                font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
                border-collapse: collapse;
                width: 100%;

            }





            .customers td, .customers th {
                border: 1px solid #ddd;
                padding: 8px;


            }

            .customers tr:nth-child(even){background-color: #f2f2f2;}

            .customers tr:hover {background-color: #ddd;}

            .customers th {
                padding-top: 12px;
                padding-bottom: 12px;
                text-align: left;
                background-color: #008ae6;
                color: white;
                width:90px;
            }
        </style>

        <jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
        </head>
        <body>



        <%

            String userID = request.getParameter("userID");
            Connection connection = null;
            Statement statement = null;
            ResultSet resultSet = null;

        %>

        <jsp:include page="/WEB-INF/views/studentnavi.jsp"></jsp:include>


            <div class=""  >

                <div class="sidenav"  style="float:left;">
                    <ul>      

                        <a href="studentView.jsp">View Registered Students</a>
                        <a href="studentEdit.jsp">Edit & Update</a>
                        <a href="studentDelete.jsp">Delete</a>
                    </ul>
                </div>


                <div   class=""  style="float:left;padding-left: 100px;padding-top: 40px;">



                <%@ page import="java.sql.*" %>

                <h><b> UPDATE THE STUDENT </b></h>
                <form method="post" action="updateStudent">

                    <table  align="center" cellpadding="5">
                        <%     try {
                                connection = DBConnection.createConnection();
                                statement = connection.createStatement();
                                String sql = "SELECT * FROM  student s,login l where l.userType='Student' AND s.userID='" + userID + "'";

                                resultSet = statement.executeQuery(sql);
                                while (resultSet.next()) {
                        %>

                        <tr>
                            <td></td>
                            <td> <input type="hidden" name="user" style="width: 250px;" value="<%=resultSet.getString("s.userID")%>"readonly> </td>

<!-- <td> <input type="text" name="user" style="width: 250px;" value="<%=userID%>"readonly> </td>
                            -->

                        </tr>

                        <tr>
                            <td> Full Name </td>
                            <td> <input type="text" name="fullName" style="width: 250px;" value="<%=resultSet.getString("s.fullName")%>" > </td>
                            <td> Address </td>
                            <td> <input type="text" name="address" style="width: 250px;" value="<%=resultSet.getString("s.address")%>"> </td>


                        </tr>

                        <tr>
                            <td> Contact Number </td>
                            <td> <input type="text" name="contactNumber" style="width: 250px;" value="<%=resultSet.getString("s.contactNum")%>" > </td>
                            
                            <td> Email </td>
                            <td> <input type="email" name="email" style="width: 270px;" value="<%=resultSet.getString("s.email")%>">

                        </tr>


                        <tr>

                        <td> ParentName </td>
                        <td> <input type="text" name="pname" style="width: 250px;" value="<%=resultSet.getString("s.parentName")%>"> </td>
                        <td> Working Place </td>
                        <td> <input type="text" name="wpaddress" style="width:250px;" value="<%=resultSet.getString("s.p_WorkingPlace")%>"> </td>

                        </tr>


                        <tr>


                        <tr>
                            <td> Working Place Telephone </td>
                            <td> <input type="text" name="pcontactno" style="width:250px;" value="<%=resultSet.getString("s.w_Telephone")%>"> </td>
                        </tr>



                        <%
                                }
                                connection.close();
                            } catch (Exception e) {

                                e.printStackTrace();
                            }
                        %>

                        <tr>
                            <td> </td>
                            <td> <input type="submit" value="update"> </td>
                        </tr>
                    </table>
                </form>    
                </body>
                </html>
