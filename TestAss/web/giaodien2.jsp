<%-- 
    Document   : giaodien2
    Created on : Oct 8, 2023, 10:17:15 PM
    Author     : HELLO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Attendance Taking</title>

        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f2f2f2;
                color: #333;
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
                padding: 8px 16px;
                text-align: left;
            }

            th {
                background-color: #004d80;
                color: #fff;
            }
            tr:nth-child(even) {
                background-color: #e5e5e5;
            }

            button {
                display: block;
                margin: 16px auto 0;
                padding: 8px 16px;
                background-color: #0069d9;
                color: #fff;
                border: none;
                border-radius: 4px;
            }

            button:hover {
                background-color: #0057b8;
                cursor: pointer;
            }
        </style>

    </head>
    <body>

        <h2>Attendance Taking</h2>

        <table>
            <thead>
                <tr>
                    <th>No.</th>
                    <th>Full Name</th>
                    <th>Attendance</th>
                </tr>  
            </thead>

            <tbody>
                <c:forEach var="i" begin="1" end="15">
                    <tr>
                        <td>${i}</td>
                        <td>Student ${i}</td> 
                        <td>
                            <select>
                                <option value="present">Present</option>
                                <option value="absent">Absent</option> 
                            </select>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <button type="submit">Save</button>

    </body>
</html>
