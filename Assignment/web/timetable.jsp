<%-- 
    Document   : timetable
    Created on : Oct 18, 2023, 2:16:05 PM
    Author     : sonnt
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            body {
                font-family: 'Arial', sans-serif;
                background-color: #f4f4f4;
                padding: 20px;
            }
            .form-container span {
                margin-right: 5px; /* Thêm khoảng cách phải cho các span */
            }
            form-container {
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
                gap: 10px; /* Thêm khoảng cách giữa các thành phần */
                margin-bottom: 20px;

            }

            input[type="date"],
            input[type="submit"] {
                padding: 10px;
                margin-right: 5px;
                border: 1px solid #ccc;
                border-radius: 5px;
            }

            input[type="submit"] {
                cursor: pointer;
                background-color: #5cb85c;
                color: white;
                border-color: #4cae4c;
            }

            input[type="submit"]:hover {
                background-color: #449d44;
            }

            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 65px;
            }

            table, th, td {
                border: 1px solid #ddd;
            }

            th, td {
                text-align: left;
                padding: 8px;
            }

            th {
                background-color: #f0f0f0;
            }

            tr:nth-child(even) {
                background-color: #f9f9f9;
            }

            tr:hover {
                background-color: #f1f1f1;
            }

            a {
                text-decoration: none;
                color: #337ab7;
            }

            a:hover {
                text-decoration: underline;
            }

            .form-container {
                text-align: center;
            }

            .w3-bar-item {
                display: block;
                padding: 10px;

            }

            .w3-sidebar .w3-bar-block .w3-bar-item {
                padding: 20px;
                text-decoration: none;
                font-size: 18px;
                display: block;
                color: orange;
                transition: 0.3s;
            }

            /* Change color on hover */
            .w3-sidebar .w3-bar-block .w3-bar-item:hover {
                background-color: #555;
                color: #fff;
            }
            .sidebar-links {
                width: 80%; /* Full width of the sidebar */
                text-align: center; /* Center text for all child elements */
            }



        </style>
    </head>
    <body>
        <div class="w3-sidebar w3-bar-block w3-card w3-animate-left" style="display:none" id="mySidebar">
            <button class="w3-bar-item w3-button w3-large" onclick="w3_close()">Close &times;</button>
            <div class="sidebar-links">
                <a href="chay" class="w3-bar-item w3-button">Attendance Report</a>
                <a href="logout" class="w3-bar-item w3-button">Log out</a>
            </div>
        </div>


        <div id="main">
            <div class="w3-teal">
                <button id="openNav" class="w3-button w3-teal w3-xlarge" onclick="w3_open()">&#9776;</button>
            </div>

            <div class="form-container">
                <form action="timetable" method="get">
                    <input type="hidden" name="id" value="${param.id}"/>
                    <span>From</span><input type="date" value="${requestScope.from}" name="from"/> 
                    <span>To</span> <input type="date" value="${requestScope.to}" name="to"/>  
                    <input type="submit" value="View"/>
                </form>
            </div>
            <table>
                <tr>
                    <td>Slot/Date</td>
                    <c:forEach items="${requestScope.dates}" var="d">
                        <td>
                            ${d}
                        </td>
                    </c:forEach>
                </tr>
                <c:forEach items="${requestScope.slots}" var="s" varStatus="loop">
                    <tr>
                        <td>${s.id}-${s.description}</td>
                        <c:forEach items="${requestScope.dates}" var="d">
                            <td>
                                <c:forEach items="${requestScope.sessions}" var="k">
                                    <c:if test="${k.date eq d and k.slot.id eq s.id}">
                                        <a href="att?id=${k.id}">
                                            ${k.group.name}-${k.group.subject.name}-${k.room.id}
                                            <c:if test="${k.isAtt}">
                                                (attended)
                                            </c:if>
                                            <c:if test="${!k.isAtt}">
                                                (not yet)
                                            </c:if>
                                        </a>
                                    </c:if>
                                </c:forEach>
                            </td>
                        </c:forEach>
                    </tr>
                </c:forEach>

            </table>
        </div>
        <script>
            function w3_open() {
                document.getElementById("main").style.marginLeft = "25%";
                document.getElementById("mySidebar").style.width = "25%";
                document.getElementById("mySidebar").style.display = "block";
                document.getElementById("openNav").style.display = 'none';
            }
            function w3_close() {
                document.getElementById("main").style.marginLeft = "0%";
                document.getElementById("mySidebar").style.display = "none";
                document.getElementById("openNav").style.display = "inline-block";
            }
        </script>   
    </body>
</html>
