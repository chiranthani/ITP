<%-- 
    Document   : profileUpdate
    Created on : 26-Aug-2018, 16:33:19
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
        <link rel="stylesheet" type="text/css" href="TableStyleSheet.css">
        <style>
            input[type=submit] {
                width: 100%;
                background-color: #0099ff;
                color: white;
                padding: 10px 10px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }

            input[type=submit]:hover {
                background-color: #008ae6;
            }

           </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
       
        <jsp:include page="/WEB-INF/views/stuNAV.jsp"></jsp:include>
        
        <center>
<h><b> UPDATE THE STUDENT </b></h>
<br><br>
         
                <%
  			String userID = request.getParameter("userID");
                        
			Connection connection = null;
			Statement statement = null;
			ResultSet resultSet = null;
		%>
		
			<%
			try{ 
				connection = DBConnection.createConnection();
					statement=connection.createStatement();
					String sql ="SELECT * FROM  student where userID="+session.getAttribute("id");

					resultSet = statement.executeQuery(sql);
					while(resultSet.next()){
					%>
		<form method="post" action="updateProfile">
		<table class="customers">
		<tr><br>
                <td> <b>  </b> </td>
                <td> <input type="hidden" name="user" style="width: 250px;" value="<%=resultSet.getString("userID") %>"readonly> </td>
		
               <!-- <td> <input type="text" name="user" style="width: 250px;" value="<%=userID%>"readonly> </td>
                -->
               <br>
                </tr>
                
                <tr>
                    <td> <b> Full Name </b> </td>
                    <td> <input type="text" name="fullName" style="width: 250px;" value="<%=resultSet.getString("fullname") %>"readonly> </td>
                </tr>
                
                <tr>
                    <td> <b> Address </b> </td>
                    <td> <input type="text" name="address" style="width: 250px;" value="<%=resultSet.getString("address") %>"> </td>
                </tr>
                
                <tr>
                    <td> <b> Contact Number </b> </td>
                    <td> <input type="text" name="contactNumber" style="width: 250px;" value="<%=resultSet.getString("contactNum") %>" readonly > </td>
                </tr>
                
                <tr>
                    <td> <b> Email </b> </td>
                    <td> <input type="email" name="email" style="width: 270px;" value="<%=resultSet.getString("email") %>" readonly>
                </tr>
               
                <tr>
                    <td> <b> Parent Name </b> </td>
                    <td> <input type="text" name="pname" style="width: 250px;" value="<%=resultSet.getString("parentName") %>"  > </td>
                </tr>
                
                <tr>
                    <td> <b> Working Place </b> </td>
                    <td> <input type="text" name="wpaddress" style="width:250px;" value="<%=resultSet.getString("p_WorkingPlace") %>"> </td>
                </tr>    
 
                <tr>
                    <td> <b> Working Place Telephone </b> </td>
                    <td> <input type="text" name="pcontactno" style="width:250px;" value="<%=resultSet.getString("w_Telephone") %>"> </td>
                </tr>
        
                <tr>
                    <td> </td>
                    <td> <input type="submit" value="update"> </td>
                </tr>
        
	<%
			}
		connection.close();
		} catch (Exception e) {
		
			e.printStackTrace();
		}
	%>
                </table>
                </form>
        </center>
    </body>
</html>
