<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
    <head>
        <title>Attendance Report</title>
    </head>
    <body>
        <h1>Attendance Report</h1>
        <c:if test="${not empty reports}">
            <table  border="1">
                <tr>
                    <th>Student ID</th>
                    <th>Student Name</th>  
                    <th>Session ID</th>
                    <th>Date</th>
                    <th>Status</th>
                    <th>Total Present</th>
                    <th>total Absent</th> 
                </tr>

                <c:forEach var="report" items="${reports}">
                    <tr>
                        <td>${report.studentId}</td>
                        <td>${report.studentName}</td>
                        <td>${report.sessionId}</td> 
                        <td>${report.date}</td>
                        <td>${report.status}</td>
                        <td>${report.totalPresent}</td>
                        <td>${report.totalAbsent}</td>
                    </tr>
                </c:forEach>
            </table>
        </c:if>
    </body>
</html>
