<%-- 
    Document   : login
    Created on : 11-Aug-2018, 18:25:36
    Author     : Fasrin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html> 
<html>
    <head>
        <style>

            .button {
                width: 100px;
                background-color: #008ae6;
                color: white;
                padding: 14px 20px;
                margin: 8px 0;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }

            .button:hover { background-color: #4d94ff;}
        </style>
        <link rel="stylesheet" type="text/css" href="formstyle.css"> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
    <table border="0" style="width: 100%; margin-left: 5px; column-width: auto;">
        <tbody>
            <tr>
                <td>
                    <div>
                        <img src="IMG/CaptureNew.PNG" width="480" height="150" > 
                    </div>
                </td>
                <td></td>
                <td>
                    <div>
                        <a href="profile.jsp"> <img src="IMG/1.png" width="80px"></a>

                        <br>                            

                        You are not logged in.
                    </div>
                </td>
            </tr>
        </tbody>
    </table>
    <script>

        function validate() {
            var sid = document.forms["loginForm"]["sid"].value;
            var pass = document.forms["loginForm"] ["pass"].value;

            if ((pass === null || pass === "") || (sid === null || sid === "")) {
                alert("cannot keep fields empty");
                return false;
            } else {
                return true;
            }

        }
    </script>
</head>
<body  >
    <hr   >

    <h2>  </h2>
<center>

    <form onsubmit="return validateLogin()" method="post" action="loginServlet" name="lgnform">
        <table >
            <tr> 
                <td> Select User Type </td>
                <td> 
                    <select name="utype">
                        <option value="please select"> Please Select </option>
                        <option value="Student"> Student </option>
                        <option value="Lecturer"> Lecturer </option>
                        <option value="Manager"> Manager </option>
                    </select>
                </td>
            </tr>

            <tr>
                <td> Enter Username </td>
                <td> <input type="text" name="uname"  required>   </td>
            </tr>

            <br/>

            <tr>

                <td> Enter Password </td>
                <td> <input type="password" name="pass" required > </td>
            </tr>

            <tr> 
                <td>
                </td>    
                <td>
                    <input type="submit" value="Submit"  name= "butteninsert"  onclick="return validate()" style="width: 150px;">
                </td>
            </tr>    
        </table>
    </form>
</center>
</div>



<div style="background-color:#333;height:170px;">

    <div style="float:left;">
        <h2 style="color:white;padding-left: 100px;"> Are you a new Student !!!!!</h2>

        <caption style="font-size: 17px; "><b style="color:white;padding-left: 100px;">click here to Check Entry Test Result</b></caption>&nbsp&nbsp

        <input type="button" onclick="location.href = 'EntryTestResult.jsp'"  class="button" value = "Click"><br>
    </div>
    <div style="float:right;padding-right: 100px;">
        <h2 style="color:white;padding-left: 100px;"> For New Employee </h2>
        <caption style="font-size: 17px;"><b  style="color:white;padding-left: 100px;">Click here to Interview Result &nbsp;</b></caption>&nbsp&nbsp
        <input type="button" onclick="location.href = 'EmpInterviewResult.jsp'"   class="button" value = "Click"><br>
    </div>

</div>
</body>
</html>
