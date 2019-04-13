<%-- 
    Document   : index
    Created on : Aug 11, 2018, 11:16:03 AM
    Author     : Rashmini Perera
--%>

<%@page import="util.DBConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="formstyle.css">
        <link rel="stylesheet" type="text/css" href="sidenav.css"> 

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script>
            function resourceValidate() {
                var ISBN_num = document.forms["resourceForm"]["ISBN_num"].value;
                var name = document.forms["resourceForm"] ["name"].value;
                var authorName = document.forms["resourceForm"]["authorName"].value;
                var price = document.forms["resourceForm"] ["price"].value;
                var edition = document.forms["resourceForm"] ["edition"].value;
                var subject = document.forms["resourceForm"] ["subject"].value;


                if (name === null || name === "") {
                    alert("Please enter the name of the book");
                    return false;
                } else
                    return true;

                if (ISBN_num === null || ISBN_num === "") {
                    alert("Please enter the ISBN Number");
                    return false;
                } else
                    return true;

                if (authorName === null || authorName === "") {
                    alert("Please enter the author's name");
                    return false;
                } else
                    return true;

                if (price === null || price === "") {
                    alert("Please enter the price of the book");
                    return false;
                } else
                    return true;

                if (edition === null || edition === "") {
                    alert("Please enter the edition of the book");
                    return false;
                } else
                    return true;

                if (subject === null || subject === "") {
                    alert("Please enter the subject");
                    return false;
                } else
                    return true;
            }
        </script>

    </head>
    <body>
        <%

            Connection con = null;
            Statement statement = null;
            ResultSet resultSet = null;
        %>     


        <jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>

        <jsp:include page="/WEB-INF/views/librarynavi.jsp"></jsp:include>


            <div class="content">

                <div class="sidenav"  style="float:left;">
                    <ul>      
                        <a href="Addbooks.jsp">Add Books</a>
                        <a href="libraryBooksView.jsp">View All Books</a>
                        <a href="libraryEdit.jsp">Edit & Update</a>
                        <a href="libraryDelete.jsp">Delete</a>
                    </ul>
                </div>
            </div>

            <!--<div   class=""  style="float:right;">-->


            <div style="margin-left: 300px;">
                <form name="resourceForm" action="addLibraryResource" method="POST" >
                    <h2  style="color:black;background-color:yellow"> Add Library resources </h2>
                    <table align="center" cellpadding="5" cellspacing="5">

                        <tr>
                            <td>Name of the book:</td>
                            <td><input type="text" name="name"></td>
                        </tr>

                        <tr>
                            <td>ISBN Number:</td>
                            <td><input type="number" class="ISBN"  max="9999999999999" name="ISBN_num" style="width: 80%;padding: 12px 20px;margin: 8px 0;display: inline-block;border: 1px solid #ccc;border-radius: 4px;box-sizing: border-box;"></td>

                        </tr>

                        <tr>
                            <td> Author's Name: </td>
                            <td><input type="text" name="authorName"></td>
                        </tr>

                        <tr>
                            <td> Price of the book:</td>
                            <td> <input type="text" name="price" > </td>
                        </tr>

                        <tr>
                            <td> Edition: </td>
                            <td> <input type="text" name="edition" > </td>
                        </tr>
                    <%
                        try {
                            con = DBConnection.createConnection();
                            statement = con.createStatement();
                            String sql = "SELECT subName  FROM subject";
                            resultSet = statement.executeQuery(sql);
                            while (resultSet.next()) {
                    %>
                    <tr>
                        <td> Subject:</td>
                        <td> <select name="subject" required>
                                <option value="please select"></option>
                                <option value="<%=resultSet.getString("subName")%>"><%=resultSet.getString("subName")%></option>
                    </tr>
                    <%
                            }

                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    %>     
                    <tr>
                        <td><input type="submit" value="submit"  onclick="return resourceValidate()"></td>
                    </tr>

                </table>
            </form>
        </div>

        <jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
    </body>
</html>