<%-- 
    Document   : navigation
    Created on : Aug 22, 2018, 10:45:08 PM
    Author     : Ganeesha
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <link rel="stylesheet" type="text/css" href="St.css">
    </head>
    <body>
       <div class="headder">
                <a href="DashBoard.jsp"><b>HOME</b></a>
                <a href=".jsp"><b>  EMPLOYEE  </b> </a> 
                 <a href=".jsp"><b> STUDENT </b> </a> 
                 <a href=".jsp"> <b> COURSE </b> </a> 
		 <a href=".jsp"><b> FINANCE </b> </a>
                 <div class="dropdown">
                    
                     <button class="dropbtn" class2="active"><b>ATTENDANCE</b>                    
                 </button>
                     <div class="dropdown-content">
                     <a href="AddAttendance.jsp">Employee</a>
                     
                     <div class="dropdown-contentSub">
                         <a href="AddEmployeeAtt.jsp">Add Attendance</a>
                          <a href="AddLeave.jsp">Add Leave</a>
                     </div>
                     <a href="AddStudentAtt.jsp">Student </a>
                     
                 </div>
                 </div>
                 <div class="dropdown">
                    
                     <button class="dropbtn" class2="active"><b>SALARY</b>                    
                 </button>
                     <div class="dropdown-content">
                     <a href="BasicForNew.jsp">Add Basic Salary</a>
                     <a href="AddBonusSalary.jsp">Add Bonus</a>
                     <a href="SalaryCal.jsp">Salary Calculation</a>
                     <a href="Paysheet.jsp">PaySheet</a>
                     <a href="paySlip.jsp">PaySlip</a>
                 </div>
                 </div>
                 <a href=".jsp"><b> TIME TABLE </b> </a>
                 <a href="libraryEdit.jsp"><b> LIBRARY </b> </a>
	</div>
       
    </body>
</html>
