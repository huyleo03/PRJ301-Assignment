<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        
        <!-- CSS Styles -->
        <style>
            body {
                font-family: Arial, sans-serif;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                background-color: #f4f4f4;
            }
            form {
                padding: 20px;
                border: 1px solid #ccc;
                box-shadow: 0px 0px 10px rgba(0,0,0,0.1);
                background-color: #fff;
                border-radius: 5px;
            }
            input[type="text"], input[type="password"] {
                width: 100%;
                padding: 10px;
                margin: 10px 0;
                border: 1px solid #ccc;
                border-radius: 4px;
            }
            input[type="submit"] {
                padding: 10px 15px;
                background-color: #007BFF;
                border: none;
                color: #fff;
                border-radius: 4px;
                cursor: pointer;
            }
            input[type="submit"]:hover {
                background-color: #0056b3;
            }
        </style>
        
        <!-- JavaScript -->
        <script>
            // You can add JavaScript interactions here, for instance:
            // - Form validation
            // - Dynamic elements
            // - AJAX calls
        </script>
    </head>
    <body>
        <form action="login" method="POST">
            <label>Username:</label>
            <input type="text" name="username"/> <br/>
            <label>Password:</label>
            <input type="password" name="password" /> <br/>
            <input type="checkbox" name="remember" value="remember"/> Remember in this computer.<br/>
            <input type="submit" value="Login"/>
        </form>
        
         <script>
            function validateForm() {
                var username = document.forms[0]["username"].value;
                var password = document.forms[0]["password"].value;
                
                if (username === "") {
                    alert("Username must be filled out!");
                    return false;
                }
                
                if (password === "") {
                    alert("Password must be filled out!");
                    return false;
                }
                
                return true;
            }
        </script>
    </body>
</html>
