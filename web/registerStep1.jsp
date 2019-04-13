<%-- 
    Document   : registerStep1
    Created on : 31-Aug-2018, 21:18:06
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
        <link rel="stylesheet" type="text/css" href="registerStep123.css">
        <script src="validation.js"> </script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Register Step 01 </title>
        
        <table border="0" style="width: 100%; margin-left: 5px; column-width: auto;">
            <tbody>
                <tr>
                    <td>
                        <div>
                            <img src="IMG/CaptureNew.PNG" width="500" height="200" > 
                        </div>
                            <jsp:include page="/WEB-INF/views/navigation.jsp"></jsp:include>
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
  			String NIC = request.getParameter("nic");
                        Date dnow = new Date();
                        SimpleDateFormat ft = new SimpleDateFormat ("yyyy-MM-dd");
                        
		 	Connection con = null;
			Statement statement = null;
			ResultSet resultSet = null;
         %>
    <table>
        <div class="backGround">
        <div class="form-style-5">
        <form onsubmit="return validation()" action="registerStudentServlet" method="post" name="account">
        <fieldset>
        <legend><span class="number">1</span> Personal Info</legend>
        <input type="text" name="fname" placeholder="Your Full Name" >
        <textarea name="address" placeholder="Your Address"></textarea>
        <input type="radio" name="gender" value ="Male" checked> Male
        <input type="radio" name="gender" value="Female"> Female
        <br>
        <input type="text" name="email" placeholder="Your Email">
        Select your date of birth
        <input type="date" name="dob" id="start" placeholder="Your Date of Birth" >
        <input type="text" name="contactno" placeholder="Your Contact Number" >
        <input type="text" name="nic" value="<%=NIC%>" readonly>
        <input type="hidden" name="date" value="<%=ft.format(dnow)%>" hidden readonly>
        <label for="course">Choose your course</label>
        <select name="Course" required>
        <option value="please select"></option>
                 <%     try{ 
				
					con = DBConnection.createConnection();
					statement=con.createStatement();
					String sql ="SELECT courseCode  FROM course" ;

					resultSet = statement.executeQuery(sql);
					while(resultSet.next()){
					%>
                       <option value="<%=resultSet.getString("courseCode") %>"><%=resultSet.getString("courseCode") %></option>
	    
				    <%
						}
				
					}
						catch (Exception e) {
					
						e.printStackTrace();
					}
					%>
        </select>      
        </fieldset>
          
        <input type="submit" value="Next"/>
        </form>
        </div>
        </div>
    </table>
    </body>
</html>
