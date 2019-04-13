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
        <link rel="stylesheet" type="text/css" href="formstyle.css"> 

        <link rel="stylesheet" type="text/css" href="sidenav.css"> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title></title>

    <table border="0" style="width: 100%; margin-left: 5px; column-width: auto;">
        <tbody>
            <tr>
                <td>
                    <div>
                        <img src="IMG/CaptureNew.PNG" width="480" height="120" > 
                    </div>
                </td>
                <td></td>
                <td>
                    <div>
                        <a href="profile.jsp"> <img src="IMG/1.png" width="80px"></a>
                        <br>                            

                        <a href="login.jsp" class="button" >Login</a>
                    </div>
                </td>
            </tr>
        </tbody>
    </table>
</head>    

<body>
    <%
        Connection con = null;

    %>
    <jsp:include page="/WEB-INF/views/coursenavi.jsp"></jsp:include>    

        <div class="content">

            <div class="sidenav"  style="float:left;">
                <ul>      
                    <a href="Subject.jsp">Add course</a>
                    <a href="courseViewmain.jsp">View </a>
                    <a href="subjectedit.jsp">Edit & Update</a>
                    <a href="deletesubject.jsp">Delete</a>
                </ul>
            </div>


        <%@ page import="java.sql.*" %>
        <%String sid = request.getParameter("scode");%>

        <%
            try {

                con = DBConnection.createConnection();

                Statement st = con.createStatement();
                String sql = "Select * from subject where subCode='" + sid + "'";
                /* String sql1 = "Select * from course";*/
                ResultSet resultSet = st.executeQuery(sql);

                while (resultSet.next()) /* while(resultSet1.next())*/ {

        %>


        <div   class=""  style="float:left;padding-left: 150px;">


            <form method="post" action="subjectupdate">
                <div>
                    <div  style="float:left;padding-left: 30px;padding-bottom: 15px;padding-top: 20px;">
                        <label style="width:150px;">  Enter course name </label>
                        <input type="text" name="scode"	  style="height: 35px"  value="<%=resultSet.getString("subCode")%>"readonly>
                    </div>

                </div>

                <div>
                    <div  style="float:left;padding-left: 30px;padding-bottom: 20px;">
                        <label  style="width:170px;" >  Enter the start date </label>
                        <input type="text" name="sname" value="<%=resultSet.getString("subName")%>" style="height: 35px" >
                    </div>

                </div>



                <div>
                    <div  style="float:left;padding-left: 30px;padding-bottom: 15px;">
                        <label style="width:150px;">  Enter the duration </label>
                        <input type="text" name="ccode"	style="height: 35px" value="<%=resultSet.getString("courseCode")%>" readonly>
                    </div>

                </div>

                <div  style="padding-left: 30px;">
                    <input type="submit" value="Update">
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
