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
                    padding: 3px;


                }

                .customers tr:nth-child(even){background-color: #f2f2f2;}

                .customers tr:hover {background-color: #ddd;}

                .customers th {
                    padding-top: 5px;
                    padding-bottom: 5px;
                    text-align: left;
                    background-color: #008ae6;
                    color: white;
                    width:100px;
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
                        <a href="BasicForNew.jsp">Add Basic Salary</a><br>
                        <a href="AddBonusSalary.jsp">Add Bonus & Deductions</a><br>
                        <a href="Paysheet.jsp"  style="color:red;">Calculate & Paysheet</a><br>
                        <a href="PaySlip.jsp">PaySlip</a><br>
                    </ul>
                </div>
            </div>


            <aside class="h"  >
                <h1 style="background-color: lightblue; padding: 5px; display: block; font:Arial; font-size: 20px;"><b>Calculate & view Paysheet</b></h1><br>
              
                <table>

                    <tr> <form name="form" action="CalculateServlet" method="post">
                        <td>Year</td>
                        <td><input type="text" name="year" pattern="[0-9\s]+" placeholder="Enter Current Year" required></td>
                        <td>Month</td>
                        <td><input type="text" name="month" pattern="[A-Za-z\s]+" placeholder="Enter Current Month" required></td>
                        <td><input type="submit" value="Calculate & View"> </td>
                    </form>
                    <td> &nbsp;&nbsp;&nbsp;&nbsp;</td>
                    <td><form name="form" action="paysheetReportServlet" method="post">
                            <input type="hidden" name="year" value="<%=request.getAttribute("year")%>">
                            <input type="hidden" name="month" value="<%=request.getAttribute("month")%>">
                            <input type="submit" value="Generate Paysheet">
                        </form>
                    </td>

                    </tr>


                </table>

                            <br><br>



                <table class="customers" >

                    <tr >
                        <th>Emp No</th>
                        <th>Designation </th>
                        <th>Basic Salary </th>
                        <th>EPF (8%) </th>
                        <th>Gross Salary (Basic + Incentive)</th>
                        <th>Balance Salary </th>
                        <th>OT Amount</th>
                        <th>Gross Amount (Bal. Sal + OT Sal)</th>
                        <th>Net Salary (Gross Am. + Festival)</th>

                    </tr>
                    <%
                        try {

                            con = DBConnection.createConnection();
                            statement = con.createStatement();
                            String sql = " select * from salary s,employee e where (s.EID = e.userID) AND ( s.year='" + request.getAttribute("year") + "') AND (s.month = '" + request.getAttribute("month") + "') group by s.EID";

                            resultSet = statement.executeQuery(sql);
                            while (resultSet.next()) {


                    %>


                    <tr>
                        <td><%=resultSet.getString("s.EID")%></td>
                        <td><%=resultSet.getString("e.EmpType")%></td>
                        <td><%=resultSet.getString("s.basic_salary")%></td>
                        <td><%=resultSet.getString("s.EPF")%></td>
                        <td><%=resultSet.getString("s.gross_salary")%></td>
                        <td><%=resultSet.getString("s.balance_sal")%></td>
                        <td><%=resultSet.getString("s.OT")%></td>
                        <td><%=resultSet.getString("s.gross_Amt")%></td>
                        <td><%=resultSet.getString("s.net_salary")%></td>
                    </tr>


                    <%
                            }

                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    %> 
                </table>
                <br><br>


            </aside>
        </article> 
        <jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
    </body>
</html>
