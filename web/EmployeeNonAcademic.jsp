<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="util.DBConnection" %>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>IMS</title>
        <link rel="stylesheet" type="text/css" href="Style.css">

        <script>
            function insertValidate() {
                var name = document.forms["AddEmployee"]["name"].value;
                var nicNO = document.forms["AddEmployee"] ["nic"].value;
                var email = document.forms["AddEmployee"]["add"].value;
                var address = document.forms["AddEmployee"] ["mail"].value;

                if (name === null || name === "") {
                    alert("Please enter your name");
                    return false;
                }

                if (nicNO === null || nicNO === "") {
                    alert("Dear " + name + ", Please enter your NIC number");
                    return false;
                }

                if (address === null || address === "") {
                    alert("Dear " + name + ", Please enter your address");
                    return false;
                }

                if (email === null || email === "") {
                    alert("Please enter your email address");
                    return false;
                }

            }
        </script>

    </head>
    <body>
        <%
           

            Date dnow = new Date();
            SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd");

            Connection con = null;
            Statement statement = null;
            ResultSet resultSet = null;
        %>

        <div class="sidenav">
            <a href="#"> <b>Insert Non-Academic Employee</b></a>
            <a href="EmpoyeeUpdateTable.jsp"> <b>Update All Employees </b></a>
            <a href="EmployeeDeleteTable.jsp"> <b>Delete Employees </b></a>
            
            
        </div>

        <div class="content">
            <h2>Insert Non-Academic Staff</h2>
            <center>
                <form name="AddEmployee" action="EmployeeServlet" method="POST">

                    <table border="0" style="width: 75%; margin-left: 50px">
                        <tbody>
                            <tr>
                                <td>Full Name &nbsp;  </td>
                                <td><input type="text" name="name" size="50" /> </td>
                            <tr>    
                            <tr>
                                <td>NIC &nbsp;  </td>
                                <td><input type="text" name="nic" size="10" > </td>
                            </tr>
                            <tr>
                                <td>Address &nbsp;  </td>
                                <td>
                                    <textarea name="add" rows="4" cols="10"></textarea>
                                </td>
                            </tr>

                            <tr>
                                <td>Gender &nbsp; </td>
                                <td><input type="radio" name="Gender" value="male"  />Male</td>
                            </tr>

                            <tr>
                                <td><td><input type="radio" name="Gender" value="female"  />Female</td>           
                            </tr>

                            <tr>
                                <td>Date of Birth &nbsp; </td>
                                <td><input type="date" name="birth"/></td>
                            </tr>

                            <tr>
                                <td>Marital Status &nbsp;  </td>
                                <td><select name="state">
                                        <option>-- Select Marital Status --</option>
                                        <option>Married</option>
                                        <option>Unmarried</option>
                                    </select>
                                </td>
                            </tr>

                            <tr>
                                <td>Email &nbsp;</td>
                                <td><input type="text" name="mail" size="30"/></td>
                            </tr>

                            <tr>
                                <td>Contact Number(Mobile) &nbsp;  </td>
                                <td><input type="text" name="mob" size="10" /></td>
                            </tr>

                            <tr>
                                <td>Contact Number(Home) &nbsp;  </td>
                                <td><input type="text" name="home" size="10" /></td>
                            </tr>
                            
                            <tr>
                                <td>Working Experience &nbsp; </td>
                                <td>
                                    <textarea name="exp" rows="4" cols="50"></textarea>
                                </td>
                            </tr> 
                            
                            <tr>
                                <td>Employee Type &nbsp; </td>
                                <td><select name="type">
                                        <option>-----Select Employee Type-----</option>
                                        <option>Non-Academic</option>
                                    </select></td>
                            </tr> 
                            
                            <tr>
                                <td>Date joined &nbsp; </td>
                                <td><input type="date" name="join" value="<%=ft.format(dnow)%>" readonly></td>
                            </tr>

                        </tbody>
                    </table>                     
                    <br/>
                    <input type="submit" value="ADD NEW EMPLOYEE" name="sub" onclick="return insertValidate()"/>
                    <br>
                    <br>
                    <input type="reset" value="RESET" name="reset" />
                </form>
            </center>   
        </div>

        <br>
        <br>

    </body>
</html>


