<%-- 
    Document   : courseViewmain
    Created on : Aug 25, 2018, 11:34:24 AM
    Author     : jahrin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="sidenav.css"> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title></title>
        <style>

            .customers {
                font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
                border-collapse: collapse;
                width: 80%;

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
                width:120px;
            }


            input[type=submit] {
                width: 50%;
                background-color: #0099ff;
                color: white;
                padding: 10px 10px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }



        </style>

    <jsp:include page="/WEB-INF/views/header1.jsp"></jsp:include>
</head>
<body>


    <jsp:include page="/WEB-INF/views/coursenavi.jsp"></jsp:include>


        <div   >

            <div class="sidenav"  style="float:left;">
                <ul>      
                    <a href="sidenav1.jsp">Add course</a>
                    <a href="courseViewmain.jsp">View </a>
                    <a href="CourseView.jsp">Edit & Update</a>
                    <a href="delete.jsp">Delete</a>
                </ul>
            </div>


            <div   class=""  style="float:left;padding-left: 100px;padding-top: 40px;">



            <%@ page import="java.sql.*" %>

            <table    class="customers"  >
                <tr>
                    <th> Course Code </th>
                    <th> Course Name</th> 
                    <th> Start Date </th>
                    <th> Course Fee</th>
                    <th> Duration  </th>
                    <th> No Of Subjects</th>
                    <th> Action</th>
                </tr>

                <%
                    try {

                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ims", "root", "mjahrin#1srth");

                        Statement st = con.createStatement();
                        String sql = "Select * from course";
                        ResultSet rs = st.executeQuery(sql);

                        while (rs.next()) {

                %>


                <tr>

                    <td><%=rs.getString("courseCode")%>  </td>
                    <td> <%=rs.getString("courseName")%></td>
                    <td> <%= rs.getString("startDate")%></td>
                    <td> <%= rs.getString("courseFee")%></td>
                    <td> <%=rs.getString("duration")%></td>
                    <td> <%=rs.getString("noOfSubject")%></td>


                <form  action="cousrsedelete "  method="post">
                    <td>
                        <input type="hidden" name="code"   value="<%=rs.getString("courseCode")%>">
                        <input type="Submit" style="width:100px;"  value="Delete" >
                    </td>
                </form>

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
