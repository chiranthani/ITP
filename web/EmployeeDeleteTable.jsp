<%-- 
    Document   : EmployeeDeleteTable
    Created on : Aug 25, 2018, 4:15:55 PM
    Author     : Hiruni Dep
--%>

<%@page import="java.sql.ResultSet"%>
<%@include file="DBConfig.jsp" %>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>IMS</title>
       <link rel="stylesheet" type="text/css" href="Style.css">
    </head>
    <body>
        
        <div class="sidenav">
            <a href="EmployeeNonAcademic.jsp"> <b>Insert Employee</b></a>
            <a href="EmpoyeeUpdateTable.jsp"> <b>Update Employees </b></a>
            <a href="#"> <b>Delete Employees </b></a>
</div>

    <div class="content">
        <br>
        <br>
        <br>
        <br>
        
         <h2>Delete Employee Details</h2>
        
        <% Statement hiruni = con.createStatement();
        
           String query = "select * from employee";
           ResultSet rs = hiruni.executeQuery(query); 
        %>
        
        <br>
        <br>
        
    <center>
        
        <table id="employee">
            <tr>
                <th>User ID</th>
                <th>Full Name</th>
                <th>NIC</th>
                <th>Marital Status</th>
                <th>Address</th>
                <th>Email</th>
                <th>Mobile</th>
                <th>Home (Phone Number)</th>

                <th>Emp Type</th>
                <th>Qualifications</th>
                <th>Experience</th>
                
                <th></th>
                
            </tr>
            
            <tr>
                <% while (rs.next()) { %>
                <td><%=rs.getString("userID")%> </td>
                <td><%=rs.getString("FullName")%> </td>
                <td><%=rs.getString("NIC")%> </td>
                <td><%=rs.getString("Address")%> </td>
                <td><%=rs.getString("MaStatus")%> </td>
                <td><%=rs.getString("Email")%> </td>
                <td><%=rs.getString("Mobile")%> </td>
                <td><%=rs.getString("Home")%> </td>
                
                <td><%=rs.getString("EmpType")%> </td>
                <td><%=rs.getString("EduQulification")%> </td>
                <td><%=rs.getString("Experience")%> </td>
                
                
                
                <td><a href="EmployeeDelete.jsp?eid=<%=rs.getString("userID") %>">DELETE</a></td>

            </tr>
            <% } %>
            
        </table>
        
    </center>
    </div>
            
</body>
</html>
