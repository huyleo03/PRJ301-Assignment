<%-- 
    Document   : home.jsp
    Created on : Oct 28, 2023, 4:16:09 PM
    Author     : HELLO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Trang chủ - Điểm danh</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <style>
            body {
                font-family: 'Roboto', sans-serif;
                line-height: 1.6;
                margin: 0;
                padding: 0;
                background-color: #f4f4f4;
                display: flex;
                flex-direction: column;
                min-height: 100vh;
            }

            header {
                background-color: #FFA042;
                color: #fff;
                padding: 5px 0;
                text-align: center;
                border-bottom: 1px solid #ddd;
            }

            nav {
                margin-top: 10px;
                display: flex;
                justify-content: space-between;
                padding: 10px 0;
                background-color: #FFA042;
                box-shadow: 0px 2px 2px 0px rgba(0, 0, 0, 0.05);
            }

            nav .main-links,
            nav .auth-links {
                display: flex;
            }

            nav a {
                color: #fff;
                padding: 8px 20px;
                text-decoration: none;
                font-weight: 500;
                transition: background 0.3s;
                border-radius: 4px;
            }

            nav a:hover {
                background-color: #555;
            }

            .auth-links {
                margin-left: auto;
                flex: 0;
                margin-left: 0;
            }

            .content {
                flex: 1;
                text-align: center;
                overflow-y: auto;
            }

            .content img {
                max-width: 100%;
                height: auto;
                border-radius: 4px;
                box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.1);
            }

            footer {
                background-color:#FFA042;
                color: #fff;
                text-align: center;
                padding: 10px 0;
                border-top: 1px solid #ddd;
                position: fixed;
                bottom: 0;
                left: 0;
                width: 100%;
            }

            footer p {
                margin: 0;
            }

            .user-menu {
                position: relative;
                display: flex;
                align-items: center;
            }

            .user-icon {
                padding: 8px;
                border-radius: 4px;
            }

            .dropdown {
                display: none;
                position: absolute;
                background-color: #fff;
                box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
                padding: 12px 0;
                z-index: 1;
                top: 100%; /* Đặt vị trí menu dropdown dưới logo người dùng */
                left: 0; /* Đảm bảo menu dropdown hiển thị đúng vị trí */
                border-radius: 4px;
                min-width: 160px;
            }

            .dropdown a {
                color: black;
                padding: 12px 16px;
                text-decoration: none;
                display: block;
                font-weight: 500;
                white-space: nowrap;
            }

            .dropdown a:hover {
                background-color: #f1f1f1;
            }
            .links-container {
                flex: 1; /* Đảm bảo container mới sẽ chiếm hết không gian còn lại */
                display: flex;
                justify-content: center; /* Căn giữa theo chiều ngang */
            }


        </style>
    </head>

    <body>
        <header>
            <h2>Welcome ${sessionScope.account.username}</h2>
        </header>
        <nav>
            <div class="links-container">
                <div class="main-links">
                    <a href="timetable?id=${sessionScope.iid}">TimeTable</a>
                    <a href="AttendanceTaking.jsp">AttendanceTaking</a>
                    <a href="atttendReport">Attendance Report</a>
                    <div class="user-menu">
                        <a href="#" class="user-icon"><i class="fas fa-user"></i></a>
                        <div class="dropdown">
                            <a href="login"><i class="fas fa-sign-in-alt"></i> Đăng nhập</a>
                            <a href="logout"><i class="fas fa-sign-out-alt"></i> Đăng xuất</a>
                        </div>
                    </div>
                </div>
            </div>
        </nav>
        <div class="content">
            <img src="img/z4822671201061_584bbc228ed04a7a68cc254f33c9dde9.jpg" alt="Image Description" />
        </div>
        <footer>
            <p>Hogward University</p>
        </footer>

        <script>
            $(document).ready(function () {
                $(".user-menu").hover(function () {
                    $(".dropdown").toggle();
                });

                $(".user-icon").click(function (event) {
                    event.preventDefault();
                    $(".dropdown").toggle();
                });
            });
        </script>

    </body>
</html>
