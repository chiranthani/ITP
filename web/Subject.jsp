<%-- 
    Document   : Subject
    Created on : Jul 23, 2018, 11:39:44 AM
    Author     : jahrin
--%>

<%@page import="util.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
        <script>

            function subjectValidate() {
                var scode = document.forms["resourceForm"]["scode"].value;
                var sname = document.forms["resourceForm"] ["sname"].value;
                var ccode = document.forms["resourceForm"]["ccode"].value;



                if (scode === null || scode === "") {
                    alert("Please enter the subject name");
                    return false;
                } else
                    return true;


                if (sname === null || sname === "") {
                    alert("Please enter the subject name");
                    return false;
                } else
                    return true;

                if (ccode === null || ccode === "") {
                    alert("Please enter course code");
                    return false;
                } else
                    return true;



            }
        </script>

        <link rel="stylesheet" type="text/css" href="formstyle.css"> 

        <link rel="stylesheet" type="text/css" href="sidenav.css"> 

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
        Statement statement = null;
        ResultSet resultSet = null;

    %>

    <jsp:include page="/WEB-INF/views/coursenavi.jsp"></jsp:include>


        <div class="content">

            <div class="sidenav"  style="float:left;">
                <ul>      
                    <a href="Subject.jsp">Add subject</a>
                    <a href="subjectView.jsp">View </a>
                    <a href="subjectedit.jsp">Edit & Update</a>
                    <a href="deletesubject.jsp">Delete</a>
                </ul>
            </div>

        <%@ page import="java.sql.*" %>
        <div   class=""  style="float:left;padding-left: 150px;">

            <form    action="subjectadd"  method="post"      name="resourceForm">

                <div>
                    <div  style="float:left;padding-left: 30px;padding-bottom: 15px;padding-top: 20px;">
                        <label style="width:170px;">  Enter subject code </label>
                        <input type="text" name="scode"	placeholder=" subject code " style="height: 35px">
                    </div>



                </div>


                <div>
                    <div  style="float:left;padding-left: 30px;padding-bottom: 20px;">
                        <label  style="width:170px;" >  Enter the subject name  </label>
                        <input type="text"  name="sname"  placeholder="Name of the subject " style="height: 35px" >
                    </div>

                </div>






                <div>
                    <div  style="float:left;padding-left: 30px;padding-bottom: 20px;">
                        <label>  Select the course code </label>

                        <select  name="ccode" >

                            <%                    try {
                                    con = DBConnection.createConnection();
                                    Statement st = con.createStatement();
                                    ResultSet rs = st.executeQuery("select * from course");
                                    while (rs.next()) {
                            %>

                            <option>
                                <%=rs.getString("courseCode")%>
                            </option>
                            <%
                                    }
                                } catch (Exception e) {
                                    e.printStackTrace();
                                }
                            %>
                        </select>

                    </div>

                </div>	      


                <div  style="padding-left: 30px;">
                    <input type="submit" value="Submit"     onclick="return subjectValidate()"> 
                </div>             
            </form>
        </div>

    </div>

</body>
</html>
