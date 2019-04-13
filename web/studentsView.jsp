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
        <link rel="stylesheet" type="text/css" href="formExam.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


        <!--header section-->
        <jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>

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
        </head>
        <body>
        <%

            Connection con = null;
            Statement statement = null;

        %>

        <div class="sidenav" style=" height: 499px;">
            <a href="Exam.jsp">Add Examinations </a>
            <a href="ExamView.jsp">View Examinations </a>

            <a href="ExamresultView.jsp">View Exam Results </a>
            <a href="studentsView.jsp">View Students </a>
        </div>

        <!--navigation tab on top-->
        <div class="topnav">
            <a href="DashBoardManager.jsp">HOME</a>
            <a class="active" href="Exam.jsp">EXAM</a>
            <a href="#">RESULT</a>

        </div>
        <div class="content">

            <div class="wrapper" style="height: 500px; width: 1075px; padding-left: 16px; padding-right: 16px; border-left-width: 16px;">

                <h2 style="color:black;background:linear-gradient(yellow, greenyellow);height:40px; width: 100%;height: 55px;">Student Attendance</h2>

                <%@ page import="java.sql.*" %>

                <table id="">
                    <!--                customers-->

                    <tr>
                        <th> Exam Number </th>
                        <th> Subject name </th>
                        <th> Student ID</th>
                        <th> Result</th>

                    </tr>

                    <%                    try {

                            con = DBConnection.createConnection();

                            Statement st = con.createStatement();

                            Statement st2 = con.createStatement();

                            String sql2 = "SELECT subName FROM subject c, exam e, student_exam s "
                                    + "WHERE e.examCode=s.examCode AND e.subjectCode=c.subCode";

                            String sql = "Select * from student_exam";

                            ResultSet rs = st.executeQuery(sql);

                            ResultSet rs2 = st2.executeQuery(sql2);

                            while (rs.next() && rs2.next()) {

                    %>
                    <tr>

                        <td><%=rs.getString("examCode")%>  </td>
                        <td><%=rs2.getString("subName")%>  </td>
                        <td> <%= rs.getString("studentID")%></td>

                    <form  action="ExamResult.jsp"  method="post" >
                        <td>
                            <input type="hidden" name="examCode"  hidden value="<%=rs.getString("examCode")%>">
                            <input type="hidden" name="studentID"  hidden value="<%=rs.getString("studentID")%>">
                            <input type="hidden" name="subName"  hidden value="<%=rs2.getString("subName")%>">



                            <input type="submit" value="add" /> 
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
        </div>
    </div>


</body>
</html>
