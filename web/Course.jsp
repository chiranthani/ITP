<%-- 
    Document   : Course
    Created on : Jul 23, 2018, 11:15:15 AM
    Author     : jahrin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <link rel="stylesheet" type="text/css" href="formstyle.css"> 
         
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>   Add Course</title>
        
        <script>  
                    function courseValidate(){
                    var cname =document.forms["resourceForm"]["cname"].value;
                    var ccode =document.forms["resourceForm"] ["code"].value;
                    var sdate = document.forms["resourceForm"]["stdate"].value;
                    var fee =document.forms["resourceForm"] ["fee"].value;
                    var duration =document.forms["resourceForm"] ["duration"].value;
                    var subject  =document.forms["resourceForm"] ["subjects"].value;
            
                    
                    if (cname=== null || cname===""){
                        alert("Please enter course name");
                        return false;
                    }
                    else
                        return true;
                    
                    if (ccode=== null || ccode===""){
                        alert("Please enter the course code");
                        return false;
                    }
                    else
                        return true;
                    
                    if(sdate=== null || sdate===""){
                        alert("Please enter the Start Date");
                        return false;
                    }
                    else
                        return true;
                    
                    if(fee=== null || fee===""){
                        alert("Please enter the course fee");
                        return false;
                    }
                    else
                        return true;
                    
                    if (duration===null || duration===""){
                        alert("Please enter the duration");
                        return false;
                    }
                    else
                        return true;
                    
                    if(subject=== null || subject===""){
                        alert("Please enter the subject");
                        return false;
                    }
                    else
                        return true;
                }
             </script>
           
        
   
    </head>
    <body>
        <h2  style="color:black;background-color:yellow"> Add Course </h2>
        <div   class="divv">
        <form     action="courseadd"  method="post"   name="resourceForm"  >
       
                
            
            <label> Enter the Course Name </label>
            <input type="text"   name="cname" placeholder="Name of the course "> 
           
            
       
                <label>  Enter the course code </label>
                <input type="text" name="code" placeholder="Course code       (Eg:a111,c222)">
     
                                                               
	

               <label>     Enter the Start Date  </label>
                  <input type="date"  name="stdate" placeholder="course start Date">
          
                 
              
             
                  <label>   Enter the course Fee </label>
                <input type="text" name="fee"  placeholder="Fee">
                     
                
                       <label>  Enter the duration </label>
                      <input type ="text" name="duration" placeholder="No Of years">
                 
                 
               
                      <label> Enter the number of subjects  </label>
                     <input type="text" name="subjects" placeholder="  subjects">
                 
                 
            
                     <input type="submit" value="Submit"    onclick="return courseValidate()"> 
               
          
            
        </form>
        </div>
    </body>
</html>
