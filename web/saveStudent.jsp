<%-- 
    Document   : saveStudent
    Created on : Apr 21, 2018, 4:38:03 PM
    Author     : Nirash
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>


        <h1>Save Student</h1>

        <form action="saveStudent" method="POST">
            <table border="1">
                <thead>
                    <tr>
                        <td>Student Name</td>
                        <td><input type="text" name="studentName"/></td>
                       
                    </tr>
                    
                    
                       <tr>
                        <td>Date Of Birth</td>
                        <td><input type="date" name="dob"/></td>
                        <th></th>
                    </tr>
                    
                    
                </thead>
                <tbody>
                    <tr>
                        
                        <td><input type="submit" value="Save Student"/></td>
                    </tr>
                    <% 
                    if(request.getParameter("msg") != null){
                    
                    out.print(request.getParameter("msg"));
                    }
                    
                    
                    %>
                </tbody>
            </table>

            
        </form>
                
                <form action="updateStudent">
                    
                      <input type="submit" value="Update Student"/>
                </form>
                <script type="text/javascript">
  function handleClick(clickedId)
  {
     if(clickedId == "customerId")
       document.getElementById('tableTextId').value = "customer";
     else
       document.getElementById('tableTextId').value = "company";
  }
</script>
    </body>
</html>
