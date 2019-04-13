<%-- 
    Document   : studentFeedback
    Created on : 19-Sep-2018, 12:21:34
    Author     : Fasrin
--%>

<%@page import="util.DBConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="studentFeedback.css">
        <script src="validation.js"> </script>
        <table border="0" style="width: 100%; margin-left: 5px; column-width: auto;">
            <tbody>
               <tr>
                   <td>
                     <div>
                        <img src="IMG/CaptureNew.PNG" width="500" height="200" > 
                     </div>
                   
                     </td>
                     <td></td>
                     <td></td>
                     <td>
                     </td>
                    </tr>
            </tbody>
        </table>
    </head>
    <body>
         <%
                        Date dnow = new Date();
                        SimpleDateFormat ft = new SimpleDateFormat ("yyyy-MM-dd");
                        
		 	Connection con = null;
			Statement statement = null;
			ResultSet resultSet = null;
         %>
        <div class="back">
        <form method="POST" name="feedback" action="feedbackServlet">
          <h1>Add Feedback</h1>
          
          <div class="addmore">
            <input type="hidden" name="userID" value="<%=session.getAttribute("id")%>" >
          </div>
          <div class="addmore">
             <select name="course" required>
                <option value="please select"></option>
                <label>
                         <%     try{ 

                                                con = DBConnection.createConnection();
                                                statement=con.createStatement();
                                                String sql ="SELECT courseName  FROM course" ;

                                                resultSet = statement.executeQuery(sql);
                                                while(resultSet.next()){
                                                %>
                               <option value="<%=resultSet.getString("courseName") %>"><%=resultSet.getString("courseName") %></option>

                                            <%
                                                        }

                                                }
                                                        catch (Exception e) {

                                                        e.printStackTrace();
                                                }
                                                %>
                </label>
            </select> 
          </div>
          <div class="addmore">
            <input type="text" name="description" required/>
            <label> Description </label>
          </div>
          <div class="addmore">
            <input type="text" name="date" value="<%=ft.format(dnow)%>" hidden readonly>
          </div>
          <button>Submit</button>
          
        </form>
        </div>
    </body>
</html>
