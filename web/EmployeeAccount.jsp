<%-- 
    Document   : EmployeeAccount
    Created on : Sep 10, 2018, 3:37:24 PM
    Author     : jahrin
--%>
<%@include file="DBConfig.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
       <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        
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
        
        <table border="0" style="width: 100%; margin-left: 5px; column-width: auto;">
        <link rel="stylesheet" type="text/css" href="St.css">
        <link rel="stylesheet" type="text/css" href="TableStyleSheet.css">
        <link rel="stylesheet" type="text/css" href="Style.css"
        <tbody>
            <tr>
                <td>
                    <div>
                        <img src="IMG/CaptureNew.PNG" width="500" height="200" > 
                    </div>
                </td>
                <td></td>
                <td>
                    <div>
                        <a href="profile.jsp"> <img src="IMG/1.png" width="80px"></a>
                        <br>



                    </div>
                </td>
            </tr>
        </tbody>
    </table>
       <hr>
    </head>
    <body>
     
      
        
        <div class="content">
            <br>
            <br>
            <br>
            
            <center>
                <h2>Create an Employee Account</h2>
                <img src="IMG/Employee.png" width="209" height="223" />
            </center>
            
            <br>
            <br>
            
    <center>
        <form name="empAccount" action="EmployeeAccountServlet">
            <table border="0" style="width: 75%; margin-left: 50px">
                <tbody>
                    <tr>
                        
                        <td><input type="hidden" name="id" value="<%=request.getAttribute("id")%>" ></td>
                    </tr>
                    <tr>
                       
                        <td><input type="hidden" name="uType" value="<%=request.getAttribute("etype")%>"></td>
                    </tr>
                    <tr>
                        <td>User Name</td>
                        <td><input type="text" name="uname" required></td>
                    </tr>
                    <tr>
                        <td>Password</td>
                        <td><input type="password" name="password" required></td>
                    </tr>
                    <tr>
                        <td>Confirm Password</td>
                        <td><input type="password" name="password1" ></td>
                    </tr>
                </tbody>
            </table>
                    <br>
                    <br>
                    
            <input type="submit" value="Create Account" name="sub" onclick="return AccountValidate()"/>
            
        </form>
    </center>
      </div>

        <br>
        <br>
 <jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
    </body>
</html>