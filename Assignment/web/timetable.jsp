<%-- 
    Document   : timetable
    Created on : Oct 9, 2023, 2:27:51 PM
    Author     : HELLO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Thời khóa biểu</title>
        <style>
        body {
        font-family: Arial, sans-serif;
        }

        h2 {
        text-align: center;
        }

        table {
        width: 80%;
        margin: 0 auto;
        border-collapse: collapse;
        }

        td, th {
        border: 1px solid #dddddd;
        text-align: left;
        padding: 16px;
        }

        tr:nth-child(even) {
        background-color: #dddddd;
        }

        th {
        background-color: #0077b6;
        color: white;
        }
        </style>
    </head>

    <body>
        <h2>Timetable</h2>

        <table border="1">
            <tr>
                <th>Slot</th>
                <th>Monday</th>
                <th>Tuesday</th>
                <th>Wednesday</th> 
                <th>Thursday</th>
                <th>Friday</th>
                <th>Saturday</th>
            </tr>

            <c:forEach begin="1" end="4" var="i">
                <tr>
                    <td>Slot ${i}</td>

                    <c:forEach begin="2" end="7">
                        <td>
                            <c:out value="Subject ${i} ${j}"/>  
                        </td>
                    </c:forEach>

                </tr>
            </c:forEach>

        </table>

    </body>
</html>
