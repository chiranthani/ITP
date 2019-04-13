<%-- 
    Document   : custom_bill
    Created on : Sep 29, 2018, 8:24:51 PM
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
        <form action="../utilities" method="post" >    
            <select name="type">
                <option value="electricity">Electricity</option>
                <option value="Water">Water</option>
                <option value="telephone">Telephone</option>
                <option value="rent">Rent</option>
            </select>
            <select name="month">
                <option value="jan">January</option>
                <option value="Feb">February</option>
                <option value="march">March</option>
                <option value="april">April</option>
            </select>  
            <input type="text" name="amount"/>   
            <button><input type="submit"/></button>

        </form>
    </body>






</html>
