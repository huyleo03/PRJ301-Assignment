<%-- 
    Document   : att
    Created on : Oct 23, 2023, 4:14:23 PM
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
                font-family: Arial, sans-serif;
                background-color: #f0f0f0;
                margin: 0;
                padding: 0;
            }

            h1 {
                color: #333;
            }

            table {
                width: 100%;
                border-collapse: collapse;
                background-color: #fff;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            }

            table, th, td {
                border: 1px solid #ddd;
            }

            th, td {
                padding: 10px;
                text-align: left;
            }

            th {
                background-color: #333;
                color: #fff;
            }

            input[type="radio"] {
                margin-right: 5px;
            }

            input[type="text"] {
                width: 100%;
                padding: 5px;
                border: 1px solid #ddd;
                border-radius: 3px;
            }

            input[type="submit"] {
                background-color: #333;
                color: #fff;
                padding: 10px 20px;
                border: none;
                border-radius: 3px;
                cursor: pointer;
            }

            .heading{
                text-align: center;
                font-size: 20px;
                font-weight: bold;
                padding: 20px; /* Thêm khoảng cách xung quanh nội dung */
                background-color: #333; /* Màu nền */
                color: #fff; /* Màu chữ */
            }
            .center-button{
                text-align: center;
            }

        </style>
    </head>
    <body>
        <div class="heading">
            ${requestScope.ses.group.name}-${requestScope.ses.group.subject.name}-${requestScope.ses.room.id} 
        </div>
        <form action="att" method="POST">
            <table border="1px">
                <tr>
                    <td>Student</td>
                    <td>Status</td>
                    <td>Description</td>
                    <td>Taking Time</td>
                </tr>
                <c:forEach items="${requestScope.atts}" var="a">
                    <tr>
                        <td>
                            ${a.student.name}
                            <input type="hidden" name="stuid" value="${a.student.id}"/>
                        </td>
                        <td>
                            <input type="radio"
                                   <c:if test="${!a.status}">
                                       checked="checked"
                                   </c:if>
                                   name="status${a.student.id}" value="absent" /> absent
                            <input type="radio"
                                   <c:if test="${a.status}">
                                       checked="checked"
                                   </c:if>
                                   name="status${a.student.id}" value="present" /> present
                        </td>
                        <td><input type="text" value="${a.description}" name="description${a.student.id}"/></td>
                        <td>${a.datetime}</td>
                    </tr>   
                </c:forEach>

            </table>
            <input type="hidden" value="${requestScope.ses.id}" name="sesid"/>
            <div class="center-button">
                <input type="submit" value="Save"/>
            </div>
        </form>
    </body>
</html>
