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

        <!--header section-->
        <jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>




            <style>
                .alert {
                    padding: 20px;
                    background-color: #f44336;
                    color: white;
                    opacity: 1;
                    transition: opacity 0.6s;
                    margin-bottom: 15px;
                }

                .alert.success {background-color: #4CAF50;}
                .alert.info {background-color: #2196F3;}
                .alert.warning {background-color: #ff9800;}

                .closebtn {
                    margin-left: 15px;
                    color: white;
                    font-weight: bold;
                    float: right;
                    font-size: 22px;
                    line-height: 20px;
                    cursor: pointer;
                    transition: 0.3s;
                }

                .closebtn:hover {
                    color: black;
                }
                
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

        <%String message = (String) request.getAttribute("alertMsg");%>

    </head>




    <body >

        <%

            Connection con = null;
            Statement statement = null;
            ResultSet resultSet = null;

        %>

        <%@ page import="java.sql.*" %>
        <%String examCode = request.getParameter("examCode");%>
        <%
            try {

                con = DBConnection.createConnection();
                //  statement = con.createStatement();

                Statement st = con.createStatement();
                String sql = "Select * from exam where examCode='" + examCode + "'";
                resultSet = st.executeQuery(sql);

                while (resultSet.next()) {

        %>

        <div class="sidenav" style=" height: 499px;">
            <a href="Exam.jsp">Add Examinations </a>
            <a href="ExamView.jsp">View Examinations </a>
            <a href="ExamResult.jsp">Add Exam Result </a>
            <a href="ExamresultView.jsp">View Exam Results </a>
        </div>

        <!--navigation tab on top-->
        <div class="topnav">
            <a href="DashBoardManager.jsp">HOME</a>
            <a class="active" href="#">EXAM</a>
            <a href="">RESULT</a>

        </div>


        <div class="content">

            <div class="wrapper" style="height: 100%; width: 1075px; padding-left: 16px; padding-right: 16px; border-left-width: 16px;">

                <!--<h2 style="color:black;background:linear-gradient(yellow, greenyellow);height:40px; width: 100%;height: 55px;">Update Examinations</h2>-->
                <form method="post" action="examupdate">
                    <center>
                        <table id="customers" >

                            <tr><td> exam Code </td>
                                <td> 
                                    <input type="text" name="examCode" value="<%=resultSet.getString("examCode")%>"readonly >
                                </td>

                                <td> batch </td>
                                <td>  
                                    <input type="text" name="batch" value="<%=resultSet.getString("batch")%>" >
                                </td>
                            </tr>

                            <tr><td> Exam type</td>
                                <td>  
                                    <input type="text" name="examType" value="<%=resultSet.getString("examType")%>">
                                </td>



                                <td> Exam Date</td>
                                <td> 
                                    <input type="date" name="examDate"  value="<%=resultSet.getString("examDate")%>">
                                </td>
                            </tr>

                            <tr><td> Exam time</td>
                                <td> 
                                    <input type="time" name="examTime" value="<%=resultSet.getString("examTime")%>">
                                </td>


                                <td> duration</td>
                                <td> 
                                    <input type="text" name="duration" value="<%=resultSet.getString("duration")%>">
                                </td>
                            </tr>


                            <tr>
                                <td>Subject code</td>

                                <td> 
                                    <input type="text" name="subjectCode" value="<%=resultSet.getString("subjectCode")%>">
                                </td>

                                <td></td>

                                <td>
                                    <input type="submit" value="Update">
                                </td>

                            </tr>

                        </table>

                        <%
                            if (message != null) {
                        %>

                        <div class="alert">

                            <!--<label for="">-->
                            <span class="closebtn">&times;</span>  
                            <%=message%>
                            <!--</label>-->

                        </div>

                        <%
                            }
                        %>   

                    </center>

                </form>

            </div>

        </div>

    </div>

    <%
            }
            con.close();
        } catch (Exception e) {

            e.printStackTrace();
        }
    %>



    <script>
        var close = document.getElementsByClassName("closebtn");
        var i;

        for (i = 0; i < close.length; i++) {
            close[i].onclick = function () {
                var div = this.parentElement;
                div.style.opacity = "0";
                setTimeout(function () {
                    div.style.display = "none";
                }, 600);
            }
        }
    </script>  
</body>
</html>
