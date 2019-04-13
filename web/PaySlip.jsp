<%-- 
    Document   : PaySlip
    Created on : Sep 11, 2018, 10:32:31 PM
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
            Connection connection = null;
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
                        <a href="BasicForNew.jsp">Add Basic Salary</a><br>
                        <a href="AddBonusSalary.jsp">Add Bonus & Deductions</a><br>
                        <a href="Paysheet.jsp">Calculate & Paysheet</a><br>
                        <a href="PaySlip.jsp" style="color:red;">PaySlip</a><br>
                    </ul>
                </div>
            </div>


            <aside class="h"  >
                <h1 style="background-color: lightblue; padding: 5px; display: block; font:Arial; font-size: 20px;"><b>Payslip</b></h1><br>
                <form name="form" action="viewPaySlipServlet" method="post">

                    <table>	
                        <tr>
                            <td>Employee No</td>
                            <td><input type="text" name="empNo" required></td>
                            <td>Month</td>
                            <td><input type="text" name="month"  ></td>
                            <td><input type="submit" value="view"> </td>
                            <td> &nbsp;&nbsp;&nbsp;&nbsp;</td>

                        </tr>
                        <tr>
                            <td>Year</td>
                            <td><input type="text" name="year" value="<%=now.get(Calendar.YEAR)%>" readonly></td>
                        </tr>

                    </table>
                </form>
                <br><br>
                <%
                    try {
                        connection = DBConnection.createConnection();
                        statement = connection.createStatement();
                        String sql = "SELECT *  FROM Salary s, employee e where (s.EID = e.userID) AND ( s.year='" + request.getAttribute("year") + "') AND (s.month = '" + request.getAttribute("month") + "') AND ( s.EID='" + request.getAttribute("empNo") + "') ";

                        resultSet = statement.executeQuery(sql);
                        while (resultSet.next()) {
                %>


                <table align="center">
                    <caption><b>Employee Pay Slip </b></caption>
                    <tr>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>Year</td>
                        <td><input type="text" name="year" value="<%=resultSet.getString("s.year")%>" readonly></td>
                    </tr>
                    <tr>
                        <td>Month</td>
                        <td><input type="text" name="month" value="<%=resultSet.getString("s.month")%>" readonly></td>

                    </tr>
                    <tr>
                        <td>Employee No</td>
                        <td><input type="text" name="empNo" value="<%=resultSet.getString("s.EID")%>" readonly></td>
                    </tr>
                    <tr>
                        <td>Employee Name</td>
                        <td><input type="text" name="empName" value="<%=resultSet.getString("e.fullname")%>" readonly></td>
                    </tr>
                    <tr>
                        <td>Designation </td>
                        <td><input type="text" name="designation" value="<%=resultSet.getString("e.EmpType")%>" readonly></td>
                    </tr>
                    <tr>
                        <td>Basic Salary</td>
                        <td><input type="text" name="basic" value="<%=resultSet.getString("s.basic_salary")%>" readonly></td>
                    </tr>

                    <tr>
                        <td>Incentive</td>
                        <td><input type="text" name="bonus" value="<%=resultSet.getString("s.bonus")%>" readonly></td>
                    </tr>
                    <tr>
                        <td>Gross Salary</td>
                        <td><input type="text" name="grossSal" value="<%=resultSet.getString("s.gross_salary")%>" readonly></td>
                    </tr>
                    <tr>
                        <td>No Pay</td>
                        <td><input type="text" name="noPay" value="<%=resultSet.getString("s.no_pay")%>" readonly></td>
                    </tr>
                    <tr>
                        <td>Deductions</td>
                        <td><input type="text" name="deduction" value="<%=resultSet.getString("s.deductions")%>" readonly></td>
                    </tr>
                    <tr>
                        <td>EPF 8%</td>
                        <td><input type="text" name="EPF" value="<%=resultSet.getString("s.EPF")%>" readonly></td>
                    </tr>
                    <tr>
                        <td>Balance Salary</td>
                        <td><input type="text" name="balanceSal" value="<%=resultSet.getString("s.balance_sal")%>" readonly></td>
                    </tr>
                    <tr>
                        <td>OT Amount</td>
                        <td><input type="text" name="ot" value="<%=resultSet.getString("s.OT")%>" readonly></td>
                    </tr>
                    <tr>
                        <td>Gross Amount</td>
                        <td><input type="text" name="grossAmt" value="<%=resultSet.getString("s.gross_Amt")%>" readonly></td>
                    </tr>
                    <tr>
                        <td>Festival Advance</td>
                        <td><input type="text" name="festival" value="<%=resultSet.getString("s.festival")%>" readonly></td>
                    </tr>
                    <tr>
                        <td>Net Salary</td>
                        <td><input type="text" name="netSal" value="<%=resultSet.getString("s.net_salary")%>" readonly></td>
                    </tr>

                    <tr>
                        <td></td>
                        <td></td>
                        <td><form name="form" action="paysheetReportServlet" method="post">
                                <input type="hidden" name="year" value="<%=request.getAttribute("year")%>">
                                <input type="hidden" name="month" value="<%=request.getAttribute("month")%>">
                                <input type="submit" value="Generate All PaySlip">
                            </form>
                        </td>
                </table>
                <br><br><br>

                <%
                        }

                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %> 


            </aside>
        </article> 
        <jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
    </body>
</html>
