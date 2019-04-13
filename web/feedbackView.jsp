<%-- 
    Document   : feedbackView
    Created on : 29-Sep-2018, 11:30:16
    Author     : Fasrin
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet" type="text/css" href="studentView.css">
         
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="/WEB-INF/views/studentnavi.jsp"></jsp:include>
           

               


             

        <section>
  <h1> Student Feedbacks </h1>
  <div class="tbl-header">
    <table cellpadding="0" cellspacing="0" border="0">
      <thead>
        <tr>
          <th> FEEDBACK ID </th>
          <th> COURSE </th>
          <th> DESCRIPTION </th>
          <th> DATE </th>
        </tr>
      </thead>
    </table>
  </div>
  <div class="tbl-content">
    <table cellpadding="0" cellspacing="0" border="0">
      <tbody>        
<%
  try{
	  
	
          
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ims","root","mjahrin#1srth");
     
    
   
    
    Statement st =  con.createStatement();
    String sql = "Select * from studentFeedback";
    ResultSet rs = st.executeQuery(sql);
    
    while(rs.next()){

%>

 
    <tr>
      
        <td> <%=rs.getString("feedbackID") %>  </td>
        <td> <%=rs.getString("course")%></td>
        <td> <%= rs.getString("description")%></td>
        <td> <%= rs.getString("Date")%></td>
        
     </tr>
  
  
   
<%
    }
    con.close();
  }
    catch(Exception e){
    	System.out.println("error");
    	
    }
  

%>
      </tbody>
    </table>
  </div>
</section>
    </body>
</html>
