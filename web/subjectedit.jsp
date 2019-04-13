<%-- 
    Document   : courseViewmain
    Created on : Aug 25, 2018, 11:34:24 AM
    Author     : jahrin
--%>

<%@page import="util.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="sidenav.css"> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="TableStyleSheet.css"> 
        <title></title>
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


        <div class=""  >

            <div class="sidenav"  style="float:left;">
                <ul>      
                    <a href="Subject.jsp">Add course</a>
                    <a href="subjectView.jsp">View </a>
                    <a href="subjectedit.jsp">Edit & Update</a>
                    <a href="deletesubject.jsp">Delete</a>
                </ul>
            </div>


            <div   class=""  style="float:left;padding-left: 100px;padding-top: 40px;">



            <%@ page import="java.sql.*" %>

            <table    class="customers"  >
                <tr>
                    <th> Subject Code </th>
                    <th>  Subject Name</th> 
                    <th> Course Code </th>
                    <th> Action </th>
                </tr>

                <%    try {
                        con = DBConnection.createConnection();

                        Statement st = con.createStatement();
                        String sql = "Select * from subject";
                        ResultSet rs = st.executeQuery(sql);

                        while (rs.next()) {

                %>


                <tr>

                    <td><%=rs.getString("subCode")%>  </td>
                    <td> <%=rs.getString("subName")%></td>
                    <td> <%= rs.getString("coursecode")%></td>

                    <td><a href="subjectupdate.jsp?scode=<%=rs.getString("subCode")%>">Edit</a></td>






                </tr>



                <%
                        }
                        con.close();
                    } catch (Exception e) {
                        System.out.println("error");

                    }


                %>
            </table

        </div>




</body>
</html>
