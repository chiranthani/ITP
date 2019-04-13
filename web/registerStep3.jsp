<%-- 
    Document   : registerStep3
    Created on : 31-Aug-2018, 22:21:01
    Author     : Fasrin
--%>

<%@page import="util.DBConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="registerStep123.css">
        <script src="validation.js"> </script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Register Step 02 </title>
        
        <table border="0" style="width: 100%; margin-left: 5px; column-width: auto;">
            <tbody>
                <tr>
                    <td>
                        <div>
                            <img src="IMG/CaptureNew.PNG" width="500" height="200" > 
                        </div>
                            <jsp:include page="/WEB-INF/views/navigation.jsp"></jsp:include>
                    </td>
                    <td></td>
                    <td></td>
                    <td>
                    </td>
                </tr>
            </tbody>
        </table>
    </head>
    <body>
    <table>
        <div class="backGround">
        <div class="form-style-5">
        <form onsubmit="return validate3()" action="registerStudentStep3Servlet" method="post" name="register3">
            
        <fieldset>
        <legend><span class="number">3</span> Login Info</legend>
         <input type="text" name="id" value="<%=request.getAttribute("id") %>" >
        <input type="hidden" name="uType" value="Student">
        <input type="text" name="uname" placeholder="User Name">
        <input type="password" name="password" placeholder="Password">
        <input type="password" name="password1" placeholder="Confirm Password">
        </fieldset>
        <input type="submit" value="Create an Account" />
        </form>
        </div>
    </div>
    </table>
    </body>
</html>
