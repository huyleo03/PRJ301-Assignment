<%-- 
    Document   : giaodien
    Created on : Oct 8, 2023, 9:44:02 PM
    Author     : HELLO
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Trang Điểm Danh</title>
        <link rel="stylesheet" href="styles.css">
        <script src="scripts.js"></script>
        <style>
            body {
                font-family: Arial, sans-serif;
            }

            .container {
                width: 80%;
                margin: 0 auto;
                padding: 20px;
                box-shadow: 0 0 10px rgba(0,0,0,0.1);
            }

            table {
                width: 100%;
                border-collapse: collapse;
            }

            th, td {
                padding: 10px;
                border: 1px solid #ddd;
            }

            th {
                background-color: #f2f2f2;
            }
        </style>
    </head>
    <body>

        <div class="container">
            <h2>Điểm Danh Lớp: <c:out value="${lopHoc}" /></h2>

            <table>
                <thead>
                    <tr>
                        <th>Họ Tên</th>
                        <th>Ngày</th>
                        <th>Điểm Danh</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="hs" items="${danhSachHocSinh}">
                        <tr>
                            <td><c:out value="${hs.hoTen}" /></td>
                            <td><c:out value="${hs.ngay}" /></td>
                            <td>
                                <select class="diemdanh-select" onchange="capNhatDiemDanh(this, '${hs.id}')">
                                    <option value="present" <c:if test="${hs.diemDanh == 'present'}">selected</c:if>>Có mặt</option>
                                    <option value="absent" <c:if test="${hs.diemDanh == 'absent'}">selected</c:if>>Vắng mặt</option>
                                    </select>
                                </td>
                            </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

    </body>
</html>
