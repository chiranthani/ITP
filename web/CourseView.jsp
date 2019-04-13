<%-- 
    Document   : CourseView
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
                width:120px;
            }
        </style>

     <jsp:include page="/WEB-INF/views/header1.jsp"></jsp:include>
</head>
<body>
    <%
        Connection con = null;
        Statement statement = null;
        
    %>

    <jsp:include page="/WEB-INF/views/coursenavi.jsp"></jsp:include>


        <div class=""  >

            <div class="sidenav"  style="float:left;">
                <ul>      
                    <a href="sidenav1.jsp">Add course</a>
                    <a href="courseViewmain.jsp">View </a>
                    <a href="CourseView.jsp">Edit & Update</a>
                    <a href="delete.jsp">Delete</a>
                    <form action="courseReport" method="post">
                        <input type="submit" value="Report">
                    </form>
                </ul>
            </div>


            <div   class=""  style="float:left;padding-left: 100px;padding-top: 40px;">



            <%@ page import="java.sql.*" %>

            <table    class="customers"  >
                <tr>
                    <th> Course Code </th>
                    <th>  Course Name</th> 
                    <th> Start Date </th>
                    <th>  Course Fee</th>
                    <th> Duration  </th>
                    <th>  No Of Subjects</th>
                    <th>  Actions </th>
                </tr>

                <%                    

                        try {
                            con = DBConnection.createConnection();
                            statement = con.createStatement();
                       
                        String sql = "Select * from course";
                        ResultSet rs = statement.executeQuery(sql);

                        while (rs.next()) {

                %>


                <tr>

                    <td><%=rs.getString("courseCode")%>  </td>
                    <td> <%=rs.getString("courseName")%></td>
                    <td> <%= rs.getString("startDate")%></td>
                    <td> <%= rs.getString("courseFee")%></td>
                    <td> <%=rs.getString("duration")%></td>
                    <td> <%=rs.getString("noOfSubject")%></td>
                    <td><a href="courseupdate.jsp?code=<%=rs.getString("courseCode")%>">Edit</a></td> 

                </tr>



                <%
                        }
                        con.close();
                    } catch (Exception e) {
                        System.out.println("error");

                    }


                %>
            </table>

        </div>

   </article> 
        

</body>
</html>
