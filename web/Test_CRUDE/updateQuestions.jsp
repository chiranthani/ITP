<%-- 
    Document   : updateQuestions
    Created on : Sep 30, 2018, 7:03:54 AM
    Author     : Nirash
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="CommonMethods.DBConnection"%>
<%@page import="QAnswerRepository.QaRepository"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   
    <%  
  if (request.getParameter("id_question") != null && !request.getParameter("id_question").isEmpty()){
  
  QaRepository repository = new QaRepository();
  ResultSet result = repository.getQuestionById(Integer.parseInt(request.getParameter("id_question")));
  
  if(result.next()){
  
    
    

    
    %>
    
  
    
    
    
    <body>
        <h1>Hello World!</h1>
        
        
         <form action="<%=request.getContextPath() %>/UpdateQuestionServelet" method="POST">
             
             <table>
                        <input type="hidden" name="id_question" value="<%=result.getString("id_question")%>"/>
                        
                <td>Question</td>
                <td><input type="text" name="question">
                    
              
                    
                <tr>
                    
                    <td></td>
                    <td><input type="submit" value="Update Qusetion"></td>
                    
                </tr>
                    
             </table>
           

         </form>

        <% 
        
        }
}else{

response.sendRedirect("Error.jsp");
}
        
        
        %>
    </body>
</html>
