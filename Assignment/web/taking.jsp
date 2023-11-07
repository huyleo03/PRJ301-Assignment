<%-- 
    Document   : taking
    Created on : Nov 7, 2023, 5:08:45 PM
    Author     : HELLO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <center>
        <form action="atttendReport" method="get">
            <select name="classes">
                <c:forEach var="group" items="${requestScope.sub}">
                    <option value="${group.gid}">
                        ${group.gname}-${group.subname}-${group.gid}
                    </option>
                </c:forEach>
            </select>
            <input type="hidden" name="groupId" id="groupId" value="" /> <!-- Hidden input for groupId -->
            <input type="submit" value="VIEW" onclick="setGroupId();" />
        </form>

    </center>
    <script>
        function setGroupId() {
            // Get the selected value from the select element and set it to the hidden input field
            var selectedValue = document.querySelector('select[name="classes"]').value;
            document.querySelector('input[name="groupId"]').value = selectedValue;
        }
    </script>
</body>
</html>
