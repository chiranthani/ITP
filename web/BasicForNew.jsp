<%-- 
    Document   : A
    Created on : Sep 10, 2018, 10:39:14 PM
    Author     : Ganeesha
--%>

<%@page import="java.util.Locale"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="util.DBConnection" %>
<%@page import="java.util.Calendar"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="Homestyle.css">
 <link rel="stylesheet" type="text/css" href="sidenav.css">
        <jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>

            <style>
                .button {
                    display: inline-block;
                    width:80px;
                    padding: 4px 7px;
                    font-size: 15px;
                    cursor: pointer;
                    text-align: center;	
                    text-decoration: none;
                    outline: none;
                    color: #fff;
                    background-color: #0099ff;
                    border: none;
                    border-radius: 10px;
                    box-shadow: 0 3px #666;
                }

                .button:hover {background-color: #00cccc}

                .button:active {
                    background-color: #3e8e41;
                    box-shadow: 0 5px #666;
                    transform: translateY(4px);
                }
                .button4 {border-radius: 12px;}



                body {
                    margin: 0;
                    font-family: Arial, Helvetica, sans-serif;
                }

                .topnav {
                    overflow: hidden;
                    background-color: #2196F3;
                }

                .topnav a {
                    float: left;
                    display: block;
                    color: white;
                    text-align: center;
                    padding: 14px 16px;
                    text-decoration: none;
                    font-size: 17px;
                }

                .topnav a:hover {
                    background-color: #ddd;
                    color: black;
                }

                .topnav a.active {
                    background-color: #2196F3;
                    color: white;
                }
            </style>
            <style>
                input[type=text], select {
                    width: 100%;
                    padding: 6px 10px;
                    margin: 4px 0;
                    display: inline-block;
                    border: 1px solid #ccc;
                    border-radius: 2px;  
                }
                input[type= number], select {
                    width: 100%;
                    padding: 6px 10px;
                    margin: 4px 0;
                    display: inline-block;
                    border: 1px solid #ccc;
                    border-radius: 2px;  
                }
                input[type=date], select {
                    width: 100%;
                    padding: 6px 10px;
                    margin: 4px 0;
                    display: inline-block;
                    border: 1px solid #ccc;
                    border-radius: 2px;  
                }

                input[type=password], select {
                    width: 80%;
                    padding: 6px 10px;
                    margin: 4px 0;
                    display: inline-block;
                    border: 1px solid #ccc;
                    border-radius: 2px;  
                }

                textarea {
                    width: 100%;
                    padding: 6px 10px;
                    margin: 4px 0;
                    display: inline-block;
                    border: 1px solid #ccc;
                    border-radius: 4px; 
                }

                label {
                    padding: 12px 12px 12px 0;
                    display: inline-block;
                }

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

                input[type=reset] {
                    width: 100%;
                    background-color: #0099ff;
                    color: white;
                    padding: 10px 10px;
                    border: none;
                    border-radius: 4px;
                    cursor: pointer;
                }

                input[type=reset]:hover {
                    background-color: #008ae6;
                }

                a {
                    color:#005c99;
                }

                a:link {
                    text-decoration: none;
                }

                a:visited {
                    text-decoration: none;
                }

                a:hover {
                    text-decoration: none;
                }

                a:active {
                    text-decoration: none;
                }

            </style>
            <style>
                .customers {
                    font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
                    border-collapse: collapse;
                    width: 100%;

                }

                .customers td, .customers th {
                    border: 1px solid #ddd;
                    padding: 8px;


                }

                .customers tr:nth-child(even){background-color: #f2f2f2;}

                .customers tr:hover {background-color: #ddd;}

                .customers th {
                    padding-top: 12px;
                    padding-bottom: 12px;
                    text-align: left;
                    background-color: #008ae6;
                    color: white;
                    width:120px;
                }
            </style>

        </head>
        <body>
        <%
            Calendar now = Calendar.getInstance();
            Connection con = null;
            Statement statement = null;
            ResultSet resultSet = null;
        %>     

        <div class="topnav">
            <a href="DashBoardManager.jsp">HOME</a>
            <a class="active" href="#">SALARY</a>

        </div>

        <article>
              <div class="content">

                <div class="sidenav"  style="float:left;">
                    <ul>      
                        <a href="BasicForNew.jsp" style="color:red;">Add Basic Salary</a><br>
                        <a href="AddBonusSalary.jsp">Add Bonus & Deductions</a><br>
                        <a href="Paysheet.jsp">Calculate & Paysheet</a><br>
                        <a href="PaySlip.jsp">PaySlip</a><br>
                    </ul>
                </div>
            </div>


            <aside class="h"  >
                <h1 style="background-color: lightblue; padding: 5px; display: block; font:Arial; font-size: 20px;"><b>Add Basic Salary for New Employee</b></h1>
                <br>

                <form name="form1" action="AddBasicSalaryServlet" method="post" >
                    <caption style="font-size: 17px;"><b>Add Basic Salary </b></caption>
                    <table align="center" cellpadding="5">


                        <tr>
                            <td>Employee No</td>
                            <!-- <td><input type="text" name="empNo" pattern="[0-9\s]+" > </td>-->
                            <td> <select name="empNo" required>
                                    <option value="please select"></option>
                                    <%
                                        try {
                                            con = DBConnection.createConnection();
                                            statement = con.createStatement();
                                            String s = "SELECT userID FROM employee where userID NOT IN (select EID from salary) ";

                                            resultSet = statement.executeQuery(s);
                                            while (resultSet.next()) {
                                    %>
                                    <option value="<%=resultSet.getString("userID")%>"><%=resultSet.getString("userID")%></option>

                                    <%	}

                                        } catch (Exception e) {
                                            e.printStackTrace();
                                        }
                                    %>  
                                </select>
                            </td>
                        </tr>
                     
                        <tr>
                            <td>Month</td>
                            <td><input type="text" name="month" value="<%=now.getDisplayName(Calendar.MONTH, Calendar.LONG, Locale.getDefault())%>" readonly> </td>

                        </tr>
                        <tr>
                            <td>Year</td>
                            <td><input type="number" name="year" value="<%=now.get(Calendar.YEAR)%>" readonly></td>                
                        </tr>


                        <tr>
                            <td>Basic Salary(Rs.)</td>
                            <td><input type="text" name="basic" pattern="[0-9\s]+" placeholder="Amount" required></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td style="color: red; font-size: 17px; font-style: italic;"><b><%=(request.getAttribute("err") == null) ? "" : request.getAttribute("err")%></b><b><%=(request.getAttribute("suc") == null) ? "" : request.getAttribute("suc")%></b></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td></td>

                            <td><input type="submit" value="Insert" ></td>

                        </tr>

                        <tr>
                            <td></td>
                            <td><input type="reset" value="Reset"/></td>
                        </tr>

                    </table>                            
                </form>

                <br><br>

                <caption style="font-size: 17px;"><b>Added New Employees </b></caption>


                <table class="customers" >
                    <br><br>	 
                    <tr>
                        <th>Employee No</th>
                        <th>Designation</th>
                        <th>Joined Date</th>


                    </tr>

                    <%
                        try {
                            con = DBConnection.createConnection();
                            statement = con.createStatement();
                            String sql = "SELECT userID,EmpType,DateJoined FROM employee where userID NOT IN (select EID from salary) ";

                            resultSet = statement.executeQuery(sql);
                            while (resultSet.next()) {
                    %>

                    <tr>

                        <td><%=resultSet.getString("userID")%></td>
                        <td><%=resultSet.getString("EmpType")%></td>
                        <td><%=resultSet.getString("DateJoined")%></td>



                        <%	}

                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        %>  
                    </tr>
                </table>
                <label> Employee Count </label>
                <%
                    try {
                        con = DBConnection.createConnection();
                        statement = con.createStatement();
                        String sql = "SELECT count(userID) FROM employee where userID NOT IN (select EID from salary)";

                        resultSet = statement.executeQuery(sql);
                        while (resultSet.next()) {
                %>
                <%=resultSet.getString("count(userID)")%>

                <%	}

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
