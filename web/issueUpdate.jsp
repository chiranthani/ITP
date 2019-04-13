<%-- 
    Document   : issueUpdate
    Created on : Aug 22, 2018, 6:56:37 PM
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
                  <h2  style="color:black;background-color:yellow"> Update Issue Resource</h2>
                  <%@ page import="java.sql.*" %>
      
        <%String Sid = request.getParameter("sid");%>
        
        
<%
  try{
	  
	
   Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ims","root","mjahrin#1srth");
      
    Statement st =  con.createStatement();
    String sql = "Select * from issueResource where sid='"+Sid+"'";
   /* String sql1 = "Select * from library";*/
    ResultSet resultSet = st.executeQuery(sql);
    
    while(resultSet.next())
   /* while(resultSet1.next())*/
    {
%>

	<form method="post" action="issueUpdate">
        
                <input type="text" name="Sid" value="<%=resultSet.getString("sid") %>"readonly >
            
		<input type="text" name="ISBN_num"  value="<%=resultSet.getString("ISBN_num") %>">
            
                <input type="text" name="issueDate"  value="<%=resultSet.getString("issueDate") %>">
                
                <input type="text" name="expiryDate"  value="<%=resultSet.getString("expiryDate") %>">

                <input type="text" name="returnDate"  value="<%=resultSet.getString("returnDate") %>">

		<input type="submit" value="Update">
         
	</form>
                                                
	<%
			}
		con.close();
		} catch (Exception e) {
		
			e.printStackTrace();
		}
	%>   
        
    </body>
</html>
