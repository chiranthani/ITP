<%@page import="util.DBConnection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="sidenavExam.css"> 
        <link rel="stylesheet" type="text/css" href="st1.css">         
        <link rel="stylesheet" type="text/css" href="formExam.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
        <script>
            //validation of exam add form
            function examValidate() {
                var code = document.forms["resourceForm"]["examCode"].value;
                var batch = document.forms["resourceForm"] ["batch"].value;
                var type = document.forms["resourceForm"]["examType"].value;
                var date = document.forms["resourceForm"] ["examDate"].value;
                var time = document.forms["resourceForm"] ["examTime"].value;
                var duration = document.forms["resourceForm"] ["duration"].value;

                if (code === null || code === "") {
                    alert("Please enter exam code");
                    return false;
                }
                if (batch === null || batch === "") {
                    alert("Please enter the batch ");
                    return false;
                }
                if (type === null || type === "") {
                    alert("Please enter the exam type");
                    return false;
                }
                if (date === null || date === "") {
                    alert("Please select the date");
                    return false;
                }
                if (duration === null || duration === "") {
                    alert("Please enter the duration");
                    return false;
                }
                if (time === null || time === "") {
                    alert("Please enter the time");
                    return false;
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

        <script>
            SelectElement("month", valueToSelect)

            function SelectElement(id, valueToSelect)
            {
                var element = document.getElementById(id);
                element.value = valueToSelect;
            }</script>

        <%

            Connection con = null;
            Statement statement = null;
            ResultSet resultSet = null;

        %>

        <!--header section-->
        <jsp:include page="/WEB-INF/views/header1.jsp"></jsp:include>


        </head>
        <body>


            <!--navigation bar left side-->
            <div class="sidenav"  style="float:left; height:486px">
                <img src="img1.png" style="width:100%; max-width:45px; height: auto; padding-left:74px">
                <ul>      
                    <a href="Exam.jsp">Add Examinations </a>
                    <a href="ExamView.jsp">View Examinations </a>

                    <a href="ExamresultView.jsp">View Exam Results </a>
                    <a href="studentsView.jsp">View Students </a>
                    <form action="ExamReport" method="post">
                        <input type="submit" value="Report">
                    </form>

                    
                </ul>
            </div>
            <!--navigation tab on top-->
            <div class="topnav">
                <a href="DashBoardManager.jsp">HOME</a>
                <a class="active" href="Exam.jsp">EXAM</a>
                <a href="#">RESULT</a>

            </div>
            <div style="padding-left:267px">

                <h2  style="color:black; background:linear-gradient(yellow, red)">---Create New Exam </h2>

            <%                if (message != null) {
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

                    <div class="wrapper" style=" height: 366px;">

                        <div class="contacts" style="width:90px;">

                            <h5>EXAM FORM</h5>

                            <label style="float: bottom; padding-top: 241px">save</label>

                        </div>

                        <div class="form" style="width:956px; padding-top: 0px;" >

                            <form action="examadd"  method="post"  name="resourceForm" >
                                <p>
                                    <label for="">EXAM  CODE</label>
                                    <input type="text" name="examCode" pattern="{3}" title="three numbers" placeholder="xxx"> 
                                </p>
                                <p>
                                    <label for="">BATCH</label>
                                    <SELECT name="batch">
                                        <OPTION value="1">1</option>
                                        <OPTION value="2">2</option>
                                    </SELECT>
                                </p>
                                <p>
                                    <label for="">EXAM TYPE</label>
                                    <SELECT  name="examType" id="month">
                                        <OPTION value="JUNE">JUNE</option>
                                        <OPTION value="JANUARY" selected="selected">JANUARY</option>
                                    </SELECT>
                                </p>

                                <p>
                                    <label for="">EXAM DATE</label>
                                    <input type="date" value="2018-01-01"  name="examDate" placeholder="select date">
                                </p>

                                <p>
                                    <label for="">EXAM TIME</label>
                                    <input type="time" name="examTime" value="08:45:00" >
                                </p>

                                <p>
                                    <label for="">DURATION</label>
                                    <input type ="number" name="duration" placeholder="hours">
                                </p>

                                <p>
                                    <label for="">SUBJECT CODE</label>
                                    <select name="subjectCode"  >
                                        <%
                                            try {
                                                con = DBConnection.createConnection();
                                                statement = con.createStatement();
                                                String sql = "SELECT * FROM subject";
                                                resultSet = statement.executeQuery(sql);
                                                while (resultSet.next()) {
                                                   
                                        %>
                                        <option value="<%=resultSet.getString("subCode")%>"><%=resultSet.getString("subCode")%></option>
                                        <%
                                                }
                                            }catch (Exception e) {
                                                e.printStackTrace();
                                            }
                                        %>
                                    </select>
                                </p>
                                <p>
                                    <input type="submit" value="Submit"  name="butteninsert"   onclick="return examValidate()" style="
                                           margin-top: -5px;
                                           margin-left: 286px;

                                           ">
                                </p> 
                            </form>
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
        </script>  
    </body>
</html>

