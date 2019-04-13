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
                width: 90%;

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
            Connection con = null;


        %>

        <jsp:include page="/WEB-INF/views/studentnavi.jsp"></jsp:include>


            <div class="customer"  >

                <div class="sidenav"  style="float:left;padding-left:0px;">
                    <ul>      
                        
                        <a href="studentView.jsp">View Registered Students</a>
                        <a href="studentEdit.jsp">Edit & Update</a>
                        <a href="studentDelete.jsp">Delete</a>
                    </ul>
                </div>


                <div   class=""  style="float:right;">



                <%@ page import="java.sql.*" %>

                <table class="customers"  >
                    <tr>
                        <th> Student ID </th>
                        <th> Student Name </th>
                        <th> Address </th>
                        <th> Contact Number </th>
                        <th> Email </th>
                        <th> NIC </th>
                        <th> Course Code </th>
                        <th> Action </th>
                    </tr>

                    <%    try {

                            con = DBConnection.createConnection();

                            Statement st = con.createStatement();
                            String sql = "Select * from student";
                            ResultSet rs = st.executeQuery(sql);

                            while (rs.next()) {

                    %>


                    <tr>

                        <td> <%=rs.getString("userID")%>  </td>
                        <td> <%=rs.getString("fullname")%></td>
                        <td> <%= rs.getString("address")%></td>
                        <td> <%= rs.getString("contactNum")%></td>
                        <td> <%=rs.getString("email")%></td>
                        <td> <%=rs.getString("NIC")%></td>
                        <td> <%=rs.getString("courseCode")%></td>


                        <td><a href="studentUpdate.jsp?userID=<%=rs.getString("userID")%>">Update</a></td>
                            
                    </tr>



                    <%
                            }
                            con.close();
                        } catch (Exception e) {
                            System.out.println("error");

                        }


                    %>
                </table

            </div>




    </body>
</html>
