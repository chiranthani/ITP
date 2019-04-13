<%-- 
    Document   : TimeTableSearch
    Created on : Sep 25, 2018, 9:50:13 AM
    Author     : jahrin
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="util.DBConnection" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>IMS</title>
        <link rel="stylesheet" type="text/css" href="Style.css">
    </head>
    <body>
        
        <%
            Connection con = null;
            Statement statement = null;
            ResultSet resultSet = null;
        %>
        
        <div class="sidenav">
            <a href="TimeTable.jsp"> <b> Insert Time Tables </b></a>
        </div>
        
        <div class="content">
            <br>
            <br>
            <br>
            <br>
            
            <center>
                <h2> Search for Time Tables</h2>
            </center>
            
            <center>
                <form name="search" action="TimeTableSearchServlet" method="POST">
                    <div style="width: 75%; margin-left: 50px">
                        <label> Select the subject </label>
                        <select name="sub">
                            <option value="Select the Subject"></option>
                            <% try {

                                                con = DBConnection.createConnection();
                                                statement = con.createStatement();
                                                String sql1 = "SELECT subName FROM subject";

                                                resultSet = statement.executeQuery(sql1);
                                                while (resultSet.next()) {
                                        %>

                                        <option value="<%=resultSet.getString("subName")%>"><%=resultSet.getString("subName")%></option>

                                        <%
                                                }

                                            } catch (Exception e) {
                                                e.printStackTrace();
                                            }
                                        %>
                                    </select>
                                    
                                    <br>
                                    <br>
                                    <br>
                                    
                                    <input type="submit" value="Search">      
                    </div>        
                </form>
                                    
                                    <br>
                                    <br>
                                    <br>
                                    
<table id="timetable">
            <tr>
                <th>Time period</th>
                <th>Day</th>
                <th>Hall Name</th>
                <th>Lecturer Name</th>
            </tr>
            
            <%
                try{
                    
                    Statement st = con.createStatement();
                    String sql = "SELECT * FROM lecture_time WHERE subject ='" +request.getAttribute("sub")+ "'";
                    
                    ResultSet rs = st.executeQuery(sql);
                    while (rs.next()) {
            %>
            
            <tr>
                <td> <%= rs.getString("timePeriod") %> </td>
                <td> <%= rs.getString("day") %> </td>
                <td> <%= rs.getString("hallNum") %> </td>
                <td> <%= rs.getString("LectrerName") %> </td>
            </tr>
            
            <%
                    }

                } catch (Exception e) {

                    e.printStackTrace();
                }
            %>
          
        </table>                    
            </center>
            
        </div>
        
    </body>
</html>
