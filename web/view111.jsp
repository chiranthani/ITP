<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
   

 <%@ page import="java.sql.*" %>

<%


             try {
             Class.forName("com.mysql.jdbc.Driver");
                } catch (ClassNotFoundException e) {
                    e.printStackTrace();
                     }
                           
 %>

      <h2 align="center" style="color:orange"><font><strong>Supplier Details</strong></font></h2>
<table align="center" cellpadding="5" cellspacing="5" border="1">
<tr>

</tr>
                   <tr bgcolor="#A52A2A">
                    <td> sid </td>
                   <td><b>user name</b></td>
                   <td><b>first Name</b></td>
                   <td><b>phone </b></td>
                   <td><b>email</b></td>
                   <td><b>password</b></td>
               
                 
               
          </tr>    
          
          
<%


  try{ 
	
              Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jah", "root", "mjahrin#1srth");
              Statement  st=con.createStatement();
                 String sql ="SELECT * FROM register";

    ResultSet  resultSet = st.executeQuery(sql);
    
      while(resultSet.next()){
    	  
    	  
%>


               <tr>
                <td><%=resultSet.getString("sid") %> </td>
               <td><%=resultSet.getString("uname") %></td>
               <td><%=resultSet.getString("fname") %></td>
               <td><%=resultSet.getString("phone") %></td>
               <td><%=resultSet.getString("mail") %></td>
               <td><%=resultSet.getString("pass") %></td>
          
               
             
              </tr>

<% 
}
   con.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
   


</body>
</html>