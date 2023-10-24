<%-- 
    Document   : add
    Created on : Oct 7, 2023, 9:35:13 PM
    Author     : HELLO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Register</h1>
        <% 
            if (request.getAttribute("error") != null) {
              out.println(request.getAttribute("error")); 
            }
        %>

        <form action="register" method="post">
            Enter Username : <input type="text" name="user"/><br/>
            Enter Password : <input type="password" name="pass"/><br/>
            <input type="submit" value="REGISTER"/>
        </form>
    </body>
</html>
