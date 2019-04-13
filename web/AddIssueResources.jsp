<%-- 
    Document   : index2
    Created on : Aug 11, 2018, 12:02:44 PM
    Author     : Rashmini Perera
--%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="formstyle.css">
        <link rel="stylesheet" type="text/css" href="sidenav.css"> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
            <title> issue resources </title>
            <script>
                function issueValidate() {
                    var Sid = document.forms["issueForm"]["Sid"].value;
                    var ISBN_num = document.forms["issueForm"] ["ISBN_num"].value;
                    var issueDate = document.forms["issueForm"]["issueDate"].value;
                    var expiryDate = document.forms["issueForm"] ["expiryDate"].value;
                    var returnDate = document.forms["issueForm"] ["returnDate"].value;

                    if (Sid == null || Sid == "") {
                        alert("Please enter the Student ID");
                        return false;
                    }

                    if (ISBN_num == null || ISBN_num == "") {
                        alert("Please enter the ISBN Number");
                        return false;
                    }

                    if (issueDate == null || issueDate == "") {
                        alert("Please enter the date of issue");
                        return false;
                    }

                    if (expiryDate == null || expiryDate == "") {
                        alert("Please enter the date of expiry");
                        return false;
                    }

                    if (returnDate == null || returnDate == "") {
                        alert("Please enter the return date");
                        return false;
                    }
                }
            </script>
        </head>
        <body>

        <jsp:include page="/WEB-INF/views/librarynavi.jsp"></jsp:include>
        <%  
            Date dnow = new Date();
            SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd");

        %>

        <div class="content">

            <div class="sidenav"  style="float:left;">
                <ul>      
                    <a href="AddIssueResources.jsp">Add Issue </a>
                    <a href="ViewIssueBooks.jsp">View Issued Details</a>
                    <a href="issueEdit.jsp">Add Return Details</a>
                    
                </ul>
            </div>
        </div>
        <div>
            <form name="issueForm" action="addIssueResource" method="POST">
                <h1> <center> Add Issue Resources </center> </h1>
                <table align="center" cellpadding="5" cellspacing="5">
                    <tr>
                        <td>Student ID:</td>
                        <td><input type="text" name="Sid"></td>
                    </tr>
                    <tr>
                        <td>ISBN Number:</td>
                        <td><input type="text" name="ISBN_num"></td>
                    </tr>
                    <tr>
                        <td>Date of issue:</td>
                        <td><input type="text" name="issueDate" value="<%=ft.format(dnow)%>" readonly></td>
                    </tr>
                    <tr>
                        <td>Date of Expiry:</td>
                        <td><input type="date" name="expiryDate"></td>
                    </tr>

                    <tr>
                        <td></td>
                        <td><input type="submit" value="submit" name="buttoninsert" onclick="return issueValidate()"></td>
                    </tr>
                </table>

            </form>
        </div>
                    <br><br><br>
                    
     <jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</body>
</html>

