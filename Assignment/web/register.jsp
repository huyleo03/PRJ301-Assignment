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
        <style>
            body {
                font-family: Arial, sans-serif;
            }

            h1 {
                text-align: center;
            }

            form {
                max-width: 500px;
                margin: 0 auto;
            }

            label {
                display: block;
                margin-bottom: 5px;
            }

            input[type="text"],
            input[type="password"] {
                padding: 5px;
                width: 100%;
                box-sizing: border-box;
            }

            input[type="submit"] {
                margin-top: 10px;
                padding: 10px 15px;
                background-color: #4CAF50;
                color: white;
                border: none;
            }

            input[type="submit"]:hover {
                background-color: #45a049;
            }
        </style>
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
