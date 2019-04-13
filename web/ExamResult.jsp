<%-- 
    Document   : Course
    Created on : Jul 23, 2018, 11:15:15 AM
    Author     : rushaid
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="formstyleExam.css"> 

        <link rel="stylesheet" type="text/css" href="sidenavExam.css"> 

        <link rel="stylesheet" type="text/css" href="st1.css">         

        <link rel="stylesheet" type="text/css" href="formExam.css">

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>


        <!--//validation of result add form-->
        <script>
            function examValidate() {
                var examCode = document.forms["resourceForm"]["examCode"].value;
                var userID = document.forms["resourceForm"] ["userID"].value;
                var marks = document.forms["resourceForm"]["marks"].value;

                if (examCode === null || examCode === "") {
                    alert("Please enter examCode number");
                    return false;
                }


                if (userID === null || userID === "") {
                    alert("Please enter the userID ");
                    return false;
                }


                if (marks === null || marks === "") {
                    alert("Please enter the marks ");
                    return false;
                }


            }
        </script>
     <!--header section-->
        <jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>

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
                    background-color: #2196F3;
                    color: white;
                }
            
    </style>

    <%String message = (String) request.getAttribute("alertMsg");%>


</head>
<body>
    <div class="sidenav"  style="float:left; height:486px">

        <img src="img1.png" style="width:100%; max-width:45px; height: auto; padding-left:74px">

        <ul>      
            <a href="Exam.jsp">Add Examinations </a>
            <a href="ExamView.jsp">View Examinations </a>

            <a href="ExamresultView.jsp">View Exam Results </a>
            <a href="studentsView.jsp">View Students </a>
        </ul>
    </div>

    <!--navigation tab on top-->
         <div class="topnav">
            <a href="DashBoardManager.jsp">HOME</a>
            <a class="active" href="#">EXAM</a>
            
        </div>

    <div style="padding-left:267px">

        <h2  style="color:black; background:linear-gradient(yellow, red)">---Result Details </h2>


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




        <div>

            <div class="contain">

                <div class="wrapper" style=" height: 364px;">

                    <div class="contacts" style="width:90px; height:200px">

                        <h5>RESULT FORM</h5>

                        <label style="float: bottom; padding-top: 217px">save</label>

                    </div>

                    <div class="form" style="width:956px; padding-top: 0px;" >

                        <h5>Fill the following form</h5>

                        <div class="form" >
                            <%String examCodec = request.getParameter("examCode");%>

                            <% out.print("examCode:");%>
                            <% out.print(examCodec);%><br>
                        </div>

                        <form  action="resultadd"  method="post"  name="resourceForm"  >

                            <label>  student ID </label>                          

                            <%String studentID = request.getParameter("studentID");%>
                            
                            <input name="studentID" value="<% out.print(studentID);%>" readonly="readonly">                               

                            <label>  Subject </label>                          

                            <%String sub_name = request.getParameter("subName");%>
                            
                            <input name="Subject_name" value="<% out.print(sub_name);%>" readonly="readonly">

                            <label> Enter the Marks </label>

                            <input type="text" name="marks" style="width: 860.6666px;" onchange="handleChange(this);">

                            <input type="submit" value="Submit"  name="butteninsert"   onclick="return examValidate()" style="
                                   margin-top: 35px;
                                   margin-left: 136px;"> 

                        </form>

                    </div>

                </div>

            </div>

        </div>

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

    function handleChange(input) {
        if (input.value < 0)
            input.value = 0;
        if (input.value > 100)
            input.value = 100;
    }
</script> 





</body>

</html>
