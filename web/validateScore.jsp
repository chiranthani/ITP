<%-- 
    Document   : validateScore
    Created on : Sep 24, 2018, 6:53:52 PM
    Author     : Nirash
--%>

<%@page import="CommonMethods.CommonMethods"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Please Wait...</title>
    </head>
    <body>

        <%
            try {

                CommonMethods cm = new CommonMethods();

                HttpSession ses = request.getSession();
                String email = (ses.getAttribute("email")).toString();
                out.print(email);
                String shaString = cm.ConvertToSHA256(email);
             
                cm.sendEmail(email, "Welcome to MindReach", "Hi, " + "Activate your account at: http://localhost:8080/IMS_Progress_V_3/ActivateAccount?key1=" + email + "&key2=" + shaString);
               
                
                out.print("<h1>A email has been Send To Your Account Please login Using That</h1>");
        
            } catch (Exception ex) {
                out.print(ex.getMessage());
            }
            //response.sendRedirect("/StudentDashboard.jsp");
%>
        <p>

        </p>
    </body>
</html>
