<%-- 
    Document   : courseupdate
    Created on : Aug 6, 2018, 9:26:08 PM
    Author     : jahrin
--%>

<%@page import="util.DBConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        

        <link rel="stylesheet" type="text/css" href="sidenav.css"> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title></title>

   <jsp:include page="/WEB-INF/views/header1.jsp"></jsp:include>
</head>    
<body>
    <%
        Connection con = null;

    %>
    <jsp:include page="/WEB-INF/views/coursenavi.jsp"></jsp:include>    

        <div class="content">

            <div class="sidenav"  style="float:left;">
                <ul>      
                    <a href="sidenav1.jsp">Add course</a>
                    <a href="courseViewmain.jsp">View </a>
                    <a href="CourseView.jsp">Edit & Update</a>
                    <a href="delete.jsp">Delete</a>
                </ul>
            </div>


        <%@ page import="java.sql.*" %>
        <%String id = request.getParameter("code");%>

        <%
            try {

                con = DBConnection.createConnection();

                Statement st = con.createStatement();
                String sql = "Select * from course where courseCode='" + id + "'";
                ResultSet resultSet = st.executeQuery(sql);

                while (resultSet.next()) {

        %>


        <div   class=""  style="float:right;padding-top: 30px;">


            <form method="post" action="courseupdate">
                <div>
                    <div  style="float:left;padding-left: 0px;padding-bottom: 15px;padding-top: 20px;">
                        <label style="width:143px;">  Enter course name </label>
                        <input type="text" name="cname"	  style="height: 35px"  value="<%=resultSet.getString("courseName")%>">
                    </div>
                    <div  style="float:right;padding-right:  170px;padding-bottom: 15px;padding-top: 20px;">
                        <label style="width:160px;">  Enter the course code </label>
                        <input type="text" name="code"  style="height: 35px"   value="<%=resultSet.getString("courseCode")%>"readonly>
                    </div>	
                </div>

                <div>
                    <div  style="float:left;padding-left: 0px;padding-bottom: 20px;">
                        <label  style="width:170px;" >  Enter the start date </label>
                        <input type="date" name="stdate" value="<%=resultSet.getString("startDate")%>" style="height: 35px" >
                    </div>
                    <div  style="float:right;padding-right:  170px;padding-bottom: 20px;">
                        <label  style="width:160px;"  >  Enter the course Fee</label>
                        <input type="text" name="fee" value="<%=resultSet.getString("courseFee")%>"  style="height: 35px">
                    </div>	
                </div>



                <div>
                    <div  style="float:left;padding-left: 0px;padding-bottom: 15px;padding-right: 50px;">
                        <label style="width:140px;">  Enter the duration </label>
                        <input type="text" name="duration"	value="<%=resultSet.getString("duration")%>" style="height: 35px">
                    </div>
                    <div  style="float:right;padding-right:  170px;padding-bottom: 15px;">
                        <label  style="width:160px;">  Number of subjects </label>
                        <input type="text" name="subjects" value="<%=resultSet.getString("noOfSubject")%>" style="height: 35px">
                    </div>	
                </div>

                <div  style="padding-left: 5px;">
                    <input type="submit" value="Update"  style="width:250px">
                </div>
            </form>



            <%
                    }
                    con.close();
                } catch (Exception e) {

                    e.printStackTrace();
                }
            %>
        </div>
    </div>
</body>
</html>
