<%-- 
    Document   : EntryTestOnlineForm
    Created on : Aug 30, 2018, 9:37:32 AM
    Author     : IT17135580
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Entry Test Online Form</title>
    <table border="0" style="width: 100%; margin-left: 5px; column-width: auto;">
        <link rel="stylesheet" type="text/css" href="St.css">
        <link rel="stylesheet" type="text/css" href="TableStyleSheet.css">
        <tbody>
            <tr>
                <td>
                    <div>
                        <img src="IMG/CaptureNew.PNG" width="500" height="200" > 
                    </div>
                </td>
                <td></td>
                <td>
                    <div>
                        <a href="profile.jsp"> <img src="IMG/1.png" width="80px"></a>
                        <br>



                    </div>
                </td>
            </tr>
        </tbody>
    </table>

</head>
<body>
    <article><br>
        <article>
            <aside class="h">
                <h style="background-color: lightblue; padding: 5px; display: block; font:Arial; font-size: 20px;"><b>Entry Requirement Form (For New Students)</b></h><br>


                <form name="form1" action="AddEntryTestServlet" onsubmit="return formValidate()" method="post" >

                    <table align="center" cellpadding="1">

                        <tr></tr>
                        <tr>
                            <td>Name</td>
                            <td><input type="text" name="name" pattern="[A-Za-z\s]+" required> </td>

                        </tr>


                        <tr>
                            <td>Address</td>
                            <td><textarea rows="4" cols="21" name="address" pattern="[A-Za-z0-9\s]" required></textarea> </td>


                        </tr>
                        <tr>
                            <td>NIC</td>
                            <td><input type="text" name="nic" required></td>                
                        </tr>


                        <tr>
                            <td>Contact No </td>
                            <td><input type="number" name="no" pattern="[0-9\s]" required></td> 

                        </tr>
                        <tr>
                            <td>OL Exam Year</td>
                            <td><input type="text" name="olNo" pattern="[0-9\s]+" required ></td>
                        </tr>
                        <tr>

                            <td>Index No</td>
                            <td><input type="text" name="index" pattern="[0-9\s]+" required ></td>
                        </tr>

                        <tr>
                            <td><b>OL Result</b></td>
                            <td>Subject</td>
                            <td>Grade</td>

                        </tr>
                        <tr>
                            <td></td>
                            <td>Maths</td>
                            <td><select name="maths"  style="width:55px;" >
                                    <option value="please select" ></option>    		
                                    <option value="A">A</option>
                                    <option value="B">B</option>
                                    <option value="C">C</option>
                                    <option value="S">S</option>

                                </select></td>
                        </tr>


                        <tr>
                            <td></td>
                            <td>English</td>
                            <td><select name="english"  required  style="width:55px;">
                                    <option value="please select" ></option>    		
                                    <option value="A">A</option>
                                    <option value="B">B</option>
                                    <option value="C">C</option>
                                    <option value="S">S</option>

                                </select></td>
                        </tr>

                        <tr>
                            <td></td>
                            <td>Sinhala/Tamil</td>
                            <td><select name="language"  required   style="width:55px;">
                                    <option value="please select" ></option>    		
                                    <option value="A">A</option>
                                    <option value="B">B</option>
                                    <option value="C">C</option>
                                    <option value="S">S</option>

                                </select></td>
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
            </aside>

        </article>
        <jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>

</body>
</html>