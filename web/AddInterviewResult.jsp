<%-- 
    Document   : AddInterviewResult
    Created on : Sep 25, 2018, 9:23:19 AM
    Author     : jahrin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>IMS</title>
        <link rel="stylesheet" type="text/css" href="Style.css">

        <script>
            function AccountValidate() {
                var pw = document.forms["AddEmployee"] ["pass"].value;
                var confirmPW = document.forms["AddEmployee"] ["cpass"].value;

                if (pw === null || pw === "") {
                    alert("Please enter your password");
                    return false;
                }

                if (confirmPW === null || confirmPW === "") {
                    alert("Please enter your password");
                    return false;
                }
                if (confirmPW !== pw) {
                    alert("Password did not match");
                    return false;
                }
            }
        </script>
        <jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
    </head>

    <style>
        .button {
            display: inline-block;
            width:80px;
            padding: 4px 7px;
            font-size: 15px;
            cursor: pointer;
            text-align: center;	
            text-decoration: none;
            outline: none;
            color: #fff;
            background-color: #0099ff;
            border: none;
            border-radius: 10px;
            box-shadow: 0 3px #666;
        }

        .button:hover {background-color: #00cccc}

        .button:active {
            background-color: #3e8e41;
            box-shadow: 0 5px #666;
            transform: translateY(4px);
        }
        .button4 {border-radius: 12px;}



        body {
            margin: 0;
            font-family: Arial, Helvetica, sans-serif;
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
    <body>

        <div class="topnav">
            <a href="DashBoardManager.jsp">HOME</a>
            <a class="active" href="#">INTERVIEW RESULT</a>

        </div>

        <div class="content">
            <br>
            <br>
            

            <center>
                <h2>Insert Interview Results</h2>
                <img src="IMG/interview.jpg" width="209" height="223" />
            </center>

            <br>
            <br>

            <center>
                <form name="empAccount" action="AddInterviewResultServlet">
                    <table border="0" style="width: 75%; margin-left: 50px">
                        <tbody>
                        <td>NIC &nbsp;</td>
                        <td><input type="text" name="id" required></td>
                        </tr>
                        <tr>
                            <td>Employee Name &nbsp;</td>
                            <td><input type="text" name="name" required></td>
                        </tr>
                        <tr>
                            <td>Employee Type &nbsp; </td>
                            <td><select name="type">
                                    <option>----- Select Employee Type -----</option>
                                    <option>Lecturer</option>
                                    <option>Manager</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>Interview Status &nbsp; </td>
                            <td><input type="radio" name="Result" value="PASS"  />Pass</td>
                        </tr>

                        <tr>
                            <td><td><input type="radio" name="Result" value="FAIL"  />Fail</td>         
                        </tr>
                        </tbody>
                    </table>
                    <br>
                    <br>

                    <input type="submit" value="ADD RESULTS" name="sub" onclick="return AccountValidate()"/>

                </form>
            </center>
        </div>

        <br>
        <br>

    </body>
</html>

