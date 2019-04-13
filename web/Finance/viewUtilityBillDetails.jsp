<%-- 
    Document   : viewUtilityBillDetails
    Created on : Sep 30, 2018, 1:12:15 PM
    Author     : Nirash
--%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="util.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>



        <%
            Connection con = null;
            
            ResultSet resultSet = null;
            ResultSet resultSet1 = null;
            ResultSet resultSet2 = null;
        %>     

        <form>
        <input type="text" id="year" name="year"/>
        <input type="text" id="month" name="month"/>
        <select name="types" id="types">
            <option>electricity</option>
            <option>telephone</option>
            <option>rent</option>
            <option>others</option>
        </select>
      button type="submit" name="btn" value="submit">Helloo</button>
        </form>

        <%
            try {
                String year = request.getParameter("year").toString();
                String month = request.getParameter("month").toString();
                String types = request.getParameter("types").toString();
                
                con = DBConnection.createConnection();
                
                PreparedStatement  tsql = con.prepareStatement("  SELECT SUM(amount) FROM utility_bill ub WHERE ub.year= ? ");
                PreparedStatement  tsql1 = con.prepareStatement(" SELECT SUM(amount) FROM utility_bill ub WHERE ub.month= ? ");
                PreparedStatement  tsql2 = con.prepareStatement(" SELECT SUM(amount) FROM utility_bill ub WHERE ub.type= ? ");
                tsql.setString(1, year);
                tsql1.setString(1, month);
                tsql2.setString(1, types);

                
                resultSet = tsql.executeQuery();
                resultSet1 = tsql1.executeQuery();
                resultSet2 = tsql2.executeQuery();

        %>

        <%while (resultSet.next()) {%>

        <h1><%=resultSet.getString("SUM(amount)")%></h1>
        
        <%}%>
        
        
        <%while (resultSet1.next()) {%>

        <h1><%=resultSet1.getString("SUM(amount)")%></h1>
        
        <%}%>
        
        
        <%while (resultSet2.next()) {%>

        <h1><%=resultSet2.getString("SUM(amount)")%></h1>
        
        <%}%>










        <%
                

            } catch (Exception e) {
                e.printStackTrace();
            }
        %>     

    </body>
</html>
