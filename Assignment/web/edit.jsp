<%-- 
    Document   : edit
    Created on : Oct 8, 2023, 11:23:45 PM
    Author     : HELLO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Quản lý học sinh</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                padding: 20px;
                color: #333;
            }

            h2 {
                border-bottom: 2px solid #333;
                padding-bottom: 10px;
                margin-bottom: 20px;
            }

            div {
                margin-bottom: 20px;
            }

            label, input, button {
                margin-right: 10px;
            }

            input {
                padding: 5px 10px;
                border: 1px solid #ccc;
                border-radius: 4px;
            }

            button {
                background-color: #007bff;
                color: #fff;
                border: none;
                border-radius: 4px;
                padding: 5px 10px;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }

            button:hover {
                background-color: #0056b3;
            }

            table {
                width: 100%;
                border-collapse: collapse;
                background-color: #fff;
                border-radius: 5px;
                box-shadow: 0px 0px 20px 0px rgba(0, 0, 0, 0.15);
            }

            table, th, td {
                border: 1px solid #ddd;
            }

            th, td {
                padding: 10px;
                text-align: left;
            }

            thead {
                background-color: #f2f2f2;
            }
        </style>
    </head>
    <body>

        <h2>Danh sách học sinh</h2>

        <div>
            <label for="searchId">Tìm kiếm theo Mã SV:</label>
            <input id="searchId" type="number" placeholder="Nhập mã SV...">
            <button onclick="searchById()">Tìm</button>
        </div>

        <div>
            <label for="studentName">Tên học sinh:</label>
            <input id="studentName" type="text" placeholder="Nhập tên học sinh...">
            <button onclick="addStudent()">Thêm học sinh</button>
        </div>

        <table id="studentsTable">
            <thead>
                <tr>
                    <th>Mã SV</th>
                    <th>Họ tên</th>
                    <th>Tuỳ chọn</th>
                </tr>
            </thead>
            <tbody>
                <!-- Rows will be added dynamically by JavaScript -->
            </tbody>
        </table>

        <script>
            // Dummy data for example
            let students = [
                {id: 1, name: "Nguyễn Văn A"},
                {id: 2, name: "Trần Thị B"}
            ];

            function searchById() {
                const searchId = parseInt(document.getElementById('searchId').value, 10);
                if (!isNaN(searchId)) {
                    const filteredStudents = students.filter(student => student.id === searchId);
                    renderStudents(filteredStudents);
                } else {
                    renderStudents();
                }
            }

            function renderStudents(filtered = students) {
                const tbody = document.getElementById("studentsTable").getElementsByTagName("tbody")[0];
                tbody.innerHTML = '';  // clear existing rows

                filtered.forEach(student => {
                    const row = tbody.insertRow();
                    const cell1 = row.insertCell(0);
                    const cell2 = row.insertCell(1);
                    const cell3 = row.insertCell(2);

                    cell1.innerHTML = student.id;
                    cell2.innerHTML = student.name;
                    cell3.innerHTML = `<button onclick="deleteStudent(${student.id})">Xóa</button>`;
                });
            }

            function addStudent() {
                const name = document.getElementById('studentName').value;

                // generate a new student ID (this is just a simple example, not for production)
                const newId = students.length > 0 ? students[students.length - 1].id + 1 : 1;

                students.push({
                    id: newId,
                    name: name
                });

                renderStudents();
            }

            function deleteStudent(id) {
                students = students.filter(student => student.id !== id);
                renderStudents();
            }

            // Initial render
            renderStudents();
        </script>

    </body>
</html>

