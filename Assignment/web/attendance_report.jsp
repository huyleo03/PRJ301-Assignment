<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
    <head>
        <title>Attendance Report</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                background-color: #f2f2f2;
            }
            h2 {
                text-align: center;
                margin-top: 20px;
            }
            table {
                border-collapse: collapse;
                width: 100%;
                background-color: white;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
                margin: 20px auto;
            }
            th, td {
                padding: 12px 15px;
                text-align: left;
                border-bottom: 1px solid #ddd;
            }
            th {
                background-color: #f2f2f2;
            }
            tr:nth-child(even) {
                background-color: #f2f2f2;
            }

            .highlight {
                color: blue;
            }
            .highlight-name{
                color: red;
            }
            
        </style>
    </head>
    <body>
        <h2>Attendance Report</h2>
        <table>
            <tr>
                <th>Student ID</th>
                <th>Student Name</th>
                <th>Session IDs</th>
                <th>Total Present</th>
                <th>Total Absent</th>
            </tr>
            <c:forEach var="attendance" items="${attendanceReportList}">
                <tr>
                    <td><c:out value="${attendance.studentId}"/></td>
                    <td class="${attendance.absenceRate > 20 ? 'highlight-name' : ''}"><c:out value="${attendance.studentName}"/></td>
                    <td>
                        <c:forEach var="sessionId" items="${fn:split(attendance.sessionIds, ', ')}" varStatus="loop">
                            <span class="${fn:contains(attendance.absentSessionIds, sessionId) ? 'highlight' : ''}">
                                <c:out value="${sessionId}"/><c:if test="${!loop.last}">, </c:if>
                                </span>
                        </c:forEach>
                    </td>
                    <td><c:out value="${attendance.totalPresent}"/></td>
                    <td><c:out value="${attendance.totalAbsent}"/></td>
                </tr>
            </c:forEach>

        </table>
    </body>
</html>
