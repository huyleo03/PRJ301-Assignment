<%-- 
    Document   : getback
    Created on : Nov 8, 2023, 11:44:02 PM
    Author     : HELLO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Logout Successful</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f2f2f2;
                text-align: center;
                padding: 50px;
            }

            .success-message {
                background-color: #4CAF50;
                color: white;
                padding: 20px;
                border-radius: 5px;
            }

            .back-button {
                display: inline-block;
                padding: 10px 20px;
                background-color: #007BFF;
                color: white;
                text-decoration: none;
                border-radius: 5px;
                margin-top: 20px;
            }

            .back-button:hover {
                background-color: #0056b3;
            }
        </style>
    </head>
    <body>
        <div class="success-message">
            Done
        </div>
        <a href="home.jsp" class="back-button">Back to home</a>
    </body>
</html>
