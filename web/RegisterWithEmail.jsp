<%-- 
    Document   : index
    Created on : Sep 4, 2018, 9:29:48 AM
    Author     : Nirash
--%>

<%@page import="study.MyConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
    </head>
    <body>



        <h1>Sign-up Page</h1>
        <form action="test" method="POST">

            <label>First Name::</label>
            <input name="fname" id="n1" type="text" value=""/>
            <br><br>


            <label>Last Name::</label>
            <input name="lname" id="n2" type="text" value=""/>
            <br><br>


            <label>Email::</label>
            <input name="email" id="n3" type="text" value=""/>
            <br><br>


            <label>Password::</label>
            <input name="pword" id="n4" type="text" value=""/>
            <br><br>
            <input  type="submit" value="Submit"/>
        </form>

        <%

            if (new MyConnection().isConnected()) {
                out.print("<h1>DB Connected</h1>");
            } else {
                out.print("<h1>DB not Connected</h1>");
            }


        %>
    </body>
</html>
