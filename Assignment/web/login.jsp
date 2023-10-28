<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login Form</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                background-color: #000044;
                background-image:
                    radial-gradient(2px 2px at 10% 10%, #f2f2f2 90%, transparent),
                    radial-gradient(3px 3px at 20% 20%, #f2f2f2 70%, transparent),
                    radial-gradient(2px 2px at 40% 40%, #f2f2f2 90%, transparent),
                    radial-gradient(2px 2px at 60% 60%, #f2f2f2 80%, transparent),
                    radial-gradient(3px 3px at 80% 80%, #f2f2f2 90%, transparent),
                    radial-gradient(3px 3px at 90% 90%, #f2f2f2 90%, transparent);
  
            }

            .wrapper {
                display: flex;
                align-items: center; /* Thêm thu?c tính này ?? c?n gi?a theo chi?u d?c */
                width: 60%;
                height: 60%;
                box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
                border-radius: 10px;
                overflow: hidden;
                background-color: #ffffff;
            }
            .wrapper img {
                width: 50%;
                height: 100%;
                object-fit: cover;
            }
            .login-container {
                width: 50%;
                padding: 20px;
                background-color: #ffffff;
            }
            .login-input {
                width: 100%;
                padding: 10px;
                margin-bottom: 10px;
                border-radius: 4px;
                border: 1px solid #e0e0e0;
            }
            .login-btn {
                width: 100%;
                padding: 10px;
                background-color: #007BFF;
                color: #ffffff;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                margin-bottom: 10px;
            }
            .remember-section {
                display: flex;
                align-items: center;
                margin-bottom: 15px;
            }

            .remember-section input[type="checkbox"] {
                margin-right: 10px;
            }

            .remember-section label {
                font-size: 14px;
            }
            .login-btn:hover {
                background-color: #0056b3;
                color: #f5f5f5;
            }

            .login-input:hover {
                border: 1px solid #007BFF;
            }
        </style>
    </head>
    <body>
        <div class="wrapper">
            <div class="login-container">
                <form action="login" method="post">
                    <input type="text" class="login-input" placeholder="Username" name="username">
                    <input type="password" class="login-input" placeholder="Password" name="password">
                    <div class="remember-section">
                        <input type="checkbox" name="remember" value="remember" id="remember-checkbox">
                        <label for="remember-checkbox">Remember in this computer.</label>
                    </div>
                    <button class="login-btn" type="submit">LOGIN</button>
                </form>
            </div>
            <img src="img/pexels-anni-roenkae-3418396.jpg" alt="Background Image"/>
        </div>
        <script>
            document.querySelector(".login-btn").addEventListener("mouseenter", function () {
                this.style.backgroundColor = "#004999";
                this.style.color = "#ffffff";
            });

            document.querySelector(".login-btn").addEventListener("mouseleave", function () {
                this.style.backgroundColor = "";
                this.style.color = "";
            });

            let inputs = document.querySelectorAll(".login-input");
            inputs.forEach(input => {
                input.addEventListener("mouseenter", function () {
                    this.style.boxShadow = "0 0 5px #007BFF";
                });
                input.addEventListener("mouseleave", function () {
                    this.style.boxShadow = "";
                });
            });
        </script>
    </body>
</html>
