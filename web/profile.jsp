<%-- 
    Document   : profile
    Created on : 26-Aug-2018, 14:32:33
    Author     : Fasrin
--%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="util.DBConnection" %>
<%@page import="java.io.PrintWriter"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
        <title> User Profile </title>
    </head>
    <body>
        <jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
        <jsp:include page="/WEB-INF/views/stuNAV.jsp"></jsp:include>
                        <%
			
			Connection con = null;
			Statement statement = null;
			ResultSet resultSet = null;
			
			%>	
			<%
		try{ 
					con = DBConnection.createConnection();
					statement=con.createStatement();
					String sql ="SELECT * FROM  student where userID="+session.getAttribute("id");

					resultSet = statement.executeQuery(sql);
					while(resultSet.next()){
					%>
                        
        <center>
                                <table>
                                <tr>
                                    <td> </td>
                                    <td> <img src="IMG/edit_1.png"> </td>
                                    <td> </td>
                                    <td> </td>
                                </tr>
				<tr>
                                    <td> <b> ID  </b> </td>
                                    <td> <%=resultSet.getString("userID") %></td>
				
                                    <td> <b> Full Name  </b> </td>
                                    <td> <%=resultSet.getString("fullname") %></td>
				</tr>
				<tr>
                                    <td> <b> Address  </b> </td>
                                    <td> <%=resultSet.getString("address") %></td>
                                    <td> <b> Contact No  </b> </td>
                                    <td> <%=resultSet.getString("contactNum") %></td>
				</tr>
				<tr>
                                    <td> <b> Email  </b> </td>
                                    <td><%=resultSet.getString("email") %></td>
				
                                </tr>
                                <tr>
                                    <td> <b> Parent Name  </b> </td>
                                    <td> <%=resultSet.getString("parentName") %> </td>
                                
                                    <td> <b> Working Place Address </b> </td>
                                    <td> <%=resultSet.getString("p_WorkingPlace") %> </td>
                                </tr>
                                <tr>
                                    <td> <b> Working Place Telphone  </b> </td>
                                    <td> <%=resultSet.getString("w_Telephone") %> </td>
                                </tr>
						
	<tr>
           <td> </td>
           <td> </td>
           <td> <input type="submit" value="Add Feedback" style="length:100px" onclick="location.href='studentFeedback.jsp?userID=<%=session.getAttribute("id")%>'"/> </td>
           <td> <input type="submit" value="update" style="length:100px" onclick="location.href='profileUpdate.jsp?userID=<%=session.getAttribute("id")%>'"/> </td>
        </tr>		
		
			</table>
</center>			
			<% }
			} catch (Exception e) {
				e.printStackTrace();
			}
			%>
	<br><br>
</aside>
</article>
  <jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
			
</body>
</html>
    </body>
</html>
