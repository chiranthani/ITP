<%-- 
    Document   : sidenav
    Created on : Aug 24, 2018, 10:39:11 PM
    Author     : jahrin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <script>
            function courseValidate() {
                var cname = document.forms["resourceForm"]["cname"].value;
                var ccode = document.forms["resourceForm"] ["code"].value;
                var sdate = document.forms["resourceForm"]["stdate"].value;
                var fee = document.forms["resourceForm"] ["fee"].value;
                var duration = document.forms["resourceForm"] ["duration"].value;
                var subject = document.forms["resourceForm"] ["subjects"].value;
                var descrip = document.forms["resourceForm"] ["description"];



              
                if (cname === null || cname === "") {
                    alert("Please enter course name");
                    return false;
                } else
                    return true;

                if (ccode === null || ccode === "") {
                    alert("Please enter the course code ");
                    return false;
                } else
                    return true;

                if (sdate === null || sdate === "") {
                    alert("Please enter the Start Date");
                    return false;
                } else
                    return true;

                if (fee === null || fee === "") {
                    alert("Please enter the course fee");
                    return false;
                } else
                    return true;

                if (duration === null || duration === "") {
                    alert("Please enter the duration");
                    return false;
                } else
                    return true;

                if (subject === null || subject === "") {
                    alert("Please enter the subject");
                    return false;
                } else
                    return true;
                
                
                  if (descrip === null || descrip === "") {
                    alert("Please enter the description");
                    return false;
                } else
                    return true;
                
            }
        </script>



     <link rel="stylesheet" type="text/css" href="formstyle.css">

        <link rel="stylesheet" type="text/css" href="sidenav.css"> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title></title>

        <jsp:include page="/WEB-INF/views/header1.jsp"></jsp:include>
        </head>
        <body>

        <jsp:include page="/WEB-INF/views/coursenavi.jsp"></jsp:include>


        <div class="content">

            <div class="sidenav"  style="float:left;">
                <ul>      
                    <a href="sidenav1.jsp">Add course</a>
                    <a href="courseViewmain.jsp">View </a>
                    <a href="CourseView.jsp">Edit & Update</a>
                    <a href="delete.jsp">Delete</a>
                    <form action="courseReport" method="post">
                        <input type="submit" value="Report">
                    </form>
                </ul>
            </div>

            <div   class=""  style="float:right;">


                <form action="courseadd"  method="post"   name="resourceForm"  >
                    
                    <div>
                        <div  style="float:left;padding-left: 0px;padding-bottom: 15px;padding-top: 20px;">
                            <label style="width:143px;">  Enter course name </label>
                            <input type="text" name="cname"	placeholder="Name of the course " style="height: 35px">
                        </div>

                        <div  style="float:right;padding-right:  170px;padding-bottom: 15px;padding-top: 20px;">
                            <label style="width:160px;">  Enter the course code </label>
                            <input type="text" name="code" placeholder=" Course code" style="height: 35px">
                        </div>	

                    </div>

                    <div>
                        <div  style="float:left;padding-left: 0px;padding-bottom: 20px;">
                            <label  style="width:170px;" >  Enter the start date </label>
                            <input type="date" name="stdate" placeholder="Course start date" style="height: 35px" >
                        </div>  
                        
                        <div  style="float:right;padding-right:  170px;padding-bottom: 20px;">
                            <label  style="width:160px;"  >  Enter the course Fee</label>
                            <input type="text" name="fee"placeholder=" Fee" style="height: 35px">
                        </div>	
                        
                    </div>



                    <div>
                        <div  style="float:left;padding-left: 0px;padding-bottom: 15px;padding-right: 50px;">
                            <label style="width:140px;padding-left:0px;">  Enter the duration </label>
                            <input type="text" name="duration"	placeholder="No of years " style="height: 35px">
                        </div>
                        
                        <div  style="float:right;padding-right:  170px;padding-bottom: 15px;">
                            <label  style="width:160px;">  Number of subjects </label>
                            <input type="text" name="subjects" placeholder=" Subjects" style="height: 35px">
                        </div>

                    </div>
                    
                    
                    
                    
                    
          

                 <input type="text" name="description" placeholder="Course description" style="height: 50px;width:780px">
                 
              
                
                    
                    
                    <div  style="padding-left: 5px;">
                        <input type="submit" value="Submit" style="width:250px"   onclick="return courseValidate()"  > 
                    </div>
                </form>
            </div>

        </div>


        

    </body>
</html>
