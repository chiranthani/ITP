

<%@page import="java.sql.ResultSet"%>
<%@page import="CommonMethods.DBConnection"%>
<%@page import="QAnswerRepository.QaRepository"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>


        <%

            if (new DBConnection().isConnected()) {
                out.print("DB Connected");
            } else {
                out.print("Database Not Connected");
            }


        %>
        <br><br><br><br><br><br><br><br>
     
        <br/>

        <table border="1">

            <tr>

                <th>Question ID</th>

                <th>Question</th>

               


            </tr>

            <%           try {

                    QaRepository repository = new QaRepository();
                    ResultSet resultSet = repository.getAllQuestions();
                while (resultSet.next()) {%>

            <tr>

                <td> <%=resultSet.getString("id_question")%>       </td>
                <td> <%=resultSet.getString("question")%>  </td>


                
                
                <td>
                    <form action="<%=request.getContextPath() %>/DeleteQuestionServelet" method="POST">
                        <input type="hidden" name="id_question" value="<%=resultSet.getString("id_question")%>">
                        <input type="submit" value="Remove"/>
                
                    </form>
                </td>
                
                     <td>
                    <form action="updateQuestions.jsp" method="POST">
                        <input type="hidden" name="id_question" value="<%=resultSet.getString("id_question")%>">
                        <input type="submit" value="UPDATE"/>
                
                    </form>
                </td>
                
                
                
                
                
                
            </tr>


            <%}

            } catch (Exception e) {%>


            <td colspan="3"<% e.getMessage(); %> </td>


            <%}

            %>

        </table>

    </body>
</html>
