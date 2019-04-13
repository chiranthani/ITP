<%-- 
    Document   : CourseView
    Created on : Aug 6, 2018, 9:37:55 PM
    Author     : rushaid
--%>

<%@page import="util.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="TableStyle.css"> 
        <link rel="stylesheet" type="text/css" href="formstyle1.css"> 
        <link rel="stylesheet" type="text/css" href="sidenavExam.css">        
        <link rel="stylesheet" type="text/css" href="formstyleExam.css">        
        <link rel="stylesheet" type="text/css" href="st1.css">         
        <link rel="stylesheet" type="text/css" href="formExam.css">       


        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>
            .topnav {
                overflow: hidden;
                background-color: #2196F3;
            }

            .topnav a {
                float: left;
                display: block;
                color: white;
                text-align: center;
                padding: 14px 16px;
                text-decoration: none;
                font-size: 17px;
            }

            .topnav a:hover {
                background-color: #2196F3;
                color: black;
            }

            .topnav a.active {
                background-color: gray;
                color: white;
            }


        </style>
        <style>
            input[type=submit] {
                width: 50%;
                background-color: #0059b3;
                color: white;
                padding: 19px 6px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }
        </style>
        <script>
            function check() {
                if (confirm("Are you sure to Delete the row?")) {
                    //do something
                    document.getElementById("adminForm").action = "./examdelete";
                    document.getElementById("adminForm").method = "POST";
                    document.getElementById("adminForm").submit();
                } else {
                    //do something
                }
            }
        </script>

        <%

            Connection con = null;
            Statement statement = null;
            ResultSet resultSet = null;

        %>

        <!--header section-->
        <jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
        </head>
        <body>
            <div class="sidenav" style=" height: 499px;">
                <a href="Exam.jsp">Add Examinations </a>
                <a href="ExamView.jsp">View Examinations </a>


            </div>

            <!--navigation tab on top-->
            <div class="topnav">
                <a href="DashBoardManager.jsp">HOME</a>
                <a class="active" href="Exam.jsp">EXAM</a>
                <a href="">RESULT</a>


            </div>



            <div class="content">

                <div class="wrapper" style="height: 445px; width: 1075px; padding-left: 16px; padding-right: 16px; border-left-width: 16px;">

                    <h2 style="color:black;background:linear-gradient(yellow, greenyellow);height:40px; width: 100%;height: 55px;">Edit Examinations</h2>

                <%@ page import="java.sql.*" %>




                <table id="customers">
                    <tr>
                        <th> Exam code  </th>
                        <th> Batch </th> 
                        <th> Exam type  </th>
                        <th> Exam Date</th>
                        <th> Exam time</th>
                        <th> Duration (h)</th>
                        <th> Subject code </th>
                        <th colspan="2" text-align="center"> Action </th>
                        <th> Student Attendance</th>

                    </tr>
                    <%                    try {

                            con = DBConnection.createConnection();
                            statement = con.createStatement();

                            String sql = "Select * from `exam`";
                            ResultSet rs = statement.executeQuery(sql);

                            while (rs.next()) {
                    %>
                    <tr>
                        <td><%=rs.getString("examCode")%>  </td>
                        <td> <%=rs.getString("batch")%></td>
                        <td> <%= rs.getString("examType")%></td>
                        <td> <%= rs.getString("examDate")%></td>
                        <td> <%=rs.getString("examTime")%></td>
                        <td> <%=rs.getString("duration")%></td>
                        <td> <%=rs.getString("subjectCode")%></td>


<!--            <td><a href="examupdate.jsp?examCode=<%=rs.getString("examCode")%>">Update</a></td>-->

                    <form  action="examupdate.jsp"  method="post" ID="adminForm">
                        <td>
                            <input type="hidden" name="examCode"  hidden value="<%=rs.getString("examCode")%>">
                            <input type="submit" value="update"   /> 
                        </td>
                    </form>

                    <form  action="examdelete"  method="post" ID="adminForm">
                        <td>
                            <input type="hidden" name="examCode"  hidden value="<%=rs.getString("examCode")%>">
                            <input type="submit" value="Delete" onclick="check()"  /> 
                        </td>
                    </form>

                    <form  action="ExamStudents.jsp"  method="post" ID="adminForm">
                        <td>
                            <input type="hidden" name="examCode"  hidden value="<%=rs.getString("examCode")%>">
                            <input type="submit" value="add" /> 
                        </td>
                    </form>


<!--                    <td><a href="ExamStudents.jsp?examCode=<%=rs.getString("examCode")%>">o</a></td>-->

                    </tr>

                    <%
                            }

                        } catch (Exception e) {
                            System.out.println("error");
                        }
                    %>
                </table>
            </div>
        </div>
    </div>
</body>
</html>
