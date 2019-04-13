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
        <script src="validation.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Register for Entry Test</title>

        <!--    <table border="0" style="width: 100%; margin-left: 5px; column-width: auto;">
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
</table>-->
        </head>

    <%
        String NIC = request.getParameter("nic");
        Date dnow = new Date();
        SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd");


    %>
    <body>
        <form  class="form-style-5" onsubmit="return validate()" action="EntryTestRegisterServlet" method="post" name="account">

            <fieldset>
                <legend><span class="number">1</span> Personal Info</legend>
                <input type="text" name="fname" placeholder="Your Full Name" required>
                <textarea name="address" placeholder="Your Address"></textarea>

                <br>
                <input type="email" name="email" placeholder="Your Email">

                <label for="course">Choose your course</label>
                <select name="Course" required>
                    <option value="please select"></option>
                    <%     try {
                            Connection con = null;
                            Statement statement = null;
                            ResultSet resultSet = null;
                            con = DBConnection.createConnection();
                            statement = con.createStatement();
                            String sql = "SELECT courseCode  FROM course";

                            resultSet = statement.executeQuery(sql);
                            while (resultSet.next()) {
                    %>
                    <option value="<%=resultSet.getString("courseCode")%>"><%=resultSet.getString("courseCode")%></option>

                    <%
                            }

                        } catch (Exception e) {

                            e.printStackTrace();
                        }
                    %>
                </select>      
            </fieldset>

            <fieldset>
                <legend><span class="number">2</span> Login Info</legend>

                <input type="hidden" name="uType" value="Student">
                <input type="text" name="uname" placeholder="User Name" required>
                <input type="password" name="password" placeholder="Password" required>
                <input type="password" name="password1" placeholder="Confirm Password">
            </fieldset>
            <fieldset>
                <legend><span class="number">3</span> Entry Requirements</legend>
                <input type="text" name="olNo" pattern="[0-9\s]+" required placeholder="OL Exam Year">
                <table width="100%">
                    <tr>
                        <td width="50%">
                            Maths
                        </td>
                        <td  width="50%">
                            <select name="maths"  style="width:100%;" >
                                <option value="please select" ></option>    		
                                <option value="A">A</option>
                                <option value="B">B</option>
                                <option value="C">C</option>
                                <option value="S">S</option>

                            </select>
                        </td>
                    </tr>
                </table>

                <table width="100%">
                    <tr>
                        <td width="50%">
                            Science
                        </td>
                        <td  width="50%">
                            <select name="science"  style="width:100%;" >
                                <option value="please select" ></option>    		
                                <option value="A">A</option>
                                <option value="B">B</option>
                                <option value="C">C</option>
                                <option value="S">S</option>

                            </select>
                        </td>
                    </tr>
                </table>

                <table width="100%">
                    <tr>
                        <td width="50%">
                            English
                        </td>
                        <td  width="50%">
                            <select name="english"  style="width:100%;" >
                                <option value="please select" ></option>    		
                                <option value="A">A</option>
                                <option value="B">B</option>
                                <option value="C">C</option>
                                <option value="S">S</option>

                            </select>
                        </td>
                    </tr>
                </table>

            </fieldset>
            <input type="submit" value="Check Eligibility for Exam" />
        </form>
    </body>
</html>

