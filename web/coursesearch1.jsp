<%-- 
    Document   : coursesearch1
    Created on : Aug 6, 2018, 10:03:34 PM
    Author     : jahrin
--%>

<%@page import="util.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
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
                background-color: black;
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

            .topnav .search-container {
                float: right;
            }

            .topnav input[type=text] {
                padding: 6px;
                margin-top: 8px;
                font-size: 17px;
                border: none;
            }

            .topnav .search-container button {
                float: right;
                padding: 6px;
                margin-top: 8px;
                margin-right: 16px;
                background: #ddd;
                font-size: 17px;
                border: none;
                cursor: pointer;
            }

            .topnav .search-container button:hover {
                background: #ccc;
            }

            @media screen and (max-width: 600px) {
                .topnav .search-container {
                    float: none;
                }
                .topnav a, .topnav input[type=text], .topnav .search-container button {
                    float: none;
                    display: block;
                    text-align: left;
                    width: 100%;
                    margin: 0;
                    padding: 14px;
                }
                .topnav input[type=text] {
                    border: 1px solid #ccc;  
                }




            </style>

            <link rel="stylesheet" type="text/css" href="Homestyle.css">
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

        <div class="topnav">
            <a class="active" href="HOME.jsp">Home</a>
            <a href="#about">About</a>
            <a href="#contact">Contact</a>
            <a href="#contact">Contact</a>
            <div class="search-container">
                   <form  action="coursesearch1" method="post">
      <input type="text" placeholder="search for courses" name="code">
      <button type="submit" >Search</button>
    </form>
            </div>
        </div>

        <%

            Connection con = null;
            Statement statement = null;
            ResultSet rs = null;
        %>    



        <%@ page import="java.sql.*" %>
        <div style="padding:40px;border-bottom-color: red;padding-bottom: 400px; ">
            <div style="float:left;">

                <h2 style="color: #0099ff;font-style: italic;padding-top: 20px;padding-left: 20px;">  Search Results : </h2>
                <h3 style="color:red"><%=(request.getAttribute("m") == null) ? "" : request.getAttribute("m")%> </h3>
               <%
                    try {
                        con = DBConnection.createConnection();
                        statement = con.createStatement();
                        String sql = "SELECT *  FROM course where courseCode= '" + request.getAttribute("code") + "'";

                        rs = statement.executeQuery(sql);
                        while (rs.next()) {
                %>




                <h2 style="color: red;padding-left: 20px;">  <%=rs.getString("courseName")%>  (  <%=rs.getString("courseCode")%>)   </h2>

                <h5  style="padding-bottom: 50px;"> 
                    <%=rs.getString("description")%> 

                </h5>

                <div  style="float:left;padding-top:15px;padding-right:20px;background-color:#ffff99;border-radius:30px;">
                    <h4 style="padding-left: 25px;" >   Duration <br> <%=rs.getString("duration")%> year </h4>
                </div>

                &nbsp&nbsp&nbsp;
                <div  style="float:right;padding-top:15px;padding-right:20px;background-color:#ffff99;border-radius:30px;border-bottom: black;">

                    <h4 style="padding-left: 25px;" >   Course Fee <br><%= rs.getString("courseFee")%> </h4>




                </div>
            </div>





            <div  style="float:right;padding-top:30px;padding-right:30px;background-color:#ffff99;padding-bottom: 20px;border-radius:0px;">
                <h2  style="padding-left: 55px;font-style: italic;">Starting  on </h2> 
                <h2 style="padding-left: 55px;" >  <%= rs.getString("startDate")%>  </h2>
                <h3 style="padding-left: 10px;font-style: italic;"> Would you like to join??  </h3>
                <h3 style="padding-left: 35px;font-style: italic;">  Apply For Entry Test </h3>
                <p  style="padding-left: 80px;"> <button onclick="EntryTestOnlineForm.jsp" class="button4"  style="background-color:gray;padding:10px;">CLICK HERE</button> </p>
            </div>

        </div>



        <footer class="socialMedia">
            <div style="float:left">
                MINDRICH College of Management Studies </br>
                Second Lane</br>
                Dehiwala </br>
                011 2 301904 
            </div>


            <div style="float:right">
                <a href="https://www.facebook.com/" style="text-decoration:none"> <img src="IMG/facebook-5-xxl.png" width="40px"> </a>
                <a href="https://www.instagram.com/" style="text-decoration:none"> <img src="IMG/instagram-5-xxl.png" width="40px"> </a>
                <a href="https://plus.google.com/" style="text-decoration:none"> <img src="IMG/google-plus-5-xxl.png" width="40px"> </a>
            </div>
        </footer>

        <%
                }

                con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        %> 

    </body>
</html>
