
<%@page import="util.DBConnection"%>
<%-- 
    Document   : CourseView
    Created on : Aug 6, 2018, 9:37:55 PM
    Author     : rushaid
--%>

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





        <style>
            .alert {
                padding: 20px;
                background-color: #36f454;
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
    <!--header section-->
    <jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
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
            <a class="active" href="#">EXAM</a>
            <a href="#">RESULT</a>
        </div>


        <div class="content">

            <div class="wrapper" style="height: 445px; width: 1075px; padding-left: 16px; padding-right: 16px; border-left-width: 16px;">

                <h2 style="color:black;background:linear-gradient(yellow, greenyellow);height:40px; width: 100%;height: 55px;">Students</h2>

                <%                  if (message != null) {
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


                <%@ page import="java.sql.*" %>

                <div>
                    <%String examCode = request.getParameter("examCode");%>

                    <% out.print("examCode:");%>
                    <% out.print(examCode);%><br>



                </div>


                <form action="studentadd" method="post" id="studentForm">

                    <input hidden name="examCode" hidden value="<%= examCode%>">  

                    <table id="customers">
                        <tr>

                            <th>
                                Student ID
                            </th>
                            <th>
                                Attendance
                            </th>

                        </tr>
                        <%
                            try {

                                con = DBConnection.createConnection();
                                statement = con.createStatement();

                                String sql = "Select * from `student`";
                                ResultSet rs = statement.executeQuery(sql);

                                while (rs.next()) {
                                    String user_id = rs.getString("userID");
                        %>
                        <tr>                  
                            <td>
                                <label for="check_<%= user_id%>" style="display: block">
                                    <%=rs.getString("userID")%> <%=rs.getString("fullname")%>  
                                </label>
                            </td>

                            <td>
                                <input checked type="checkbox" name="attending" value="<%= user_id%>" id="check_<%= user_id%>">
                            </td>                    
                        </tr>

                        <%
                                }

                            } catch (Exception e) {
                                System.out.println("error");
                            }
                        %>
                    </table>
                    <button>Submit</button>
                </form>
            </div>
        </div>

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
