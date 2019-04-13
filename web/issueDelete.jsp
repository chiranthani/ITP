<%-- 
    Document   : issueDelete
    Created on : Aug 22, 2018, 8:15:17 PM
    Author     : Rashmini Perera
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="TableStyleSheet.css"> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <h2  style="color:black;background-color:yellow"> Delete Issue Resources </h2>
        <%@ page import="java.sql.*" %>
        <jsp:include page="/WEB-INF/views/librarynavi.jsp"></jsp:include>


            <div class="content">

                <div class="sidenav"  style="float:left;">
                    <ul>      
                        <a href="Addbooks.jsp"></a>
                        <a href="libraryBooksView.jsp"></a>
                        <a href="libraryEdit.jsp"></a>
                        <a href="libraryDelete.jsp"></a>
                    </ul>
                </div>
            </div>        
            <table  id="" >
                <tr>

                    <th>  Sid       </th>
                    <th> ISBN_num   </th>
                    <th> issueDate  </th>
                    <th> expiryDate </th>
                    <th> returnDate </th>
                    <th> Action     </th>

                </tr>             


            <%

                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ims", "root", "mjahrin#1srth");

                    Statement st = con.createStatement();
                    String sql = "Select * from issueResource";
                    ResultSet rs = st.executeQuery(sql);

            %>


            <tr>

                <td><%=rs.getString("sid")%>  </td>
                <td> <%=rs.getString("ISBN_num")%></td>
                <td> <%= rs.getString("issueDate")%></td>
                <td> <%= rs.getString("expiryDate")%></td>
                <td> <%= rs.getString("returnDate")%></td>

            <form  action="subjectdelete"  method="post">
                <td>
                    <input type="text" name="Sid"  hidden value="<%=rs.getString("sid")%>">
                    <input type="submit"   value="Delete" >
                </td>
            </form>

        </tr>

        <%
                }
                con.close();
            }
            catch(Exception e

    
                ){
                System.out.println("error");

            }


        %>
    </table

</body>
</html>
