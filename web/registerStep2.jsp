<%-- 
    Document   : registerStep2
    Created on : 31-Aug-2018, 15:35:12
    Author     : Fasrin
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="util.DBConnection" %>


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
            <form onsubmit="return validate2()" action="registerStudentStep2Servlet" method="post" name="register2">
                <fieldset>
                    <legend><span class="number">2</span> Parent/Gurardian Info</legend>
                    <input type="text" name="pname" placeholder="Parent Name">
                    <input type="text" name="pcontactno" placeholder="Parent Contact Number">

                    <input type="hidden" name="nic" value="<%=request.getAttribute("nic") %>" >
                    <input type="text" name="occupation" placeholder="Parent Occupation">
                    <textarea name="wpaddress" placeholder="Parent Working Place Address"></textarea>
                </fieldset>
                <input type="submit" value="Next" />
            </form>
        </div>
    </div>
    </table>


</body>
</html>
