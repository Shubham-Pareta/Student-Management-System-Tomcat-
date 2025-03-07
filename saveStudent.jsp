<%@ page import="java.sql.*" %>
<%
    String course = request.getParameter("course");
    String branch = request.getParameter("branch");
    String studentId = request.getParameter("studentId");
    String name = request.getParameter("name");
    String fatherName = request.getParameter("fatherName");
    String gender = request.getParameter("gender");
    String message = ""; // Initialize message variable

    Connection con = null;
    PreparedStatement ps = null;

    try {
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/StudentManagement", "root", "@Shubham2003");

        // Check if the studentId already exists
        String checkSql = "SELECT COUNT(*) FROM students WHERE studentId = ?";
        ps = con.prepareStatement(checkSql);
        ps.setString(1, studentId);

        ResultSet rs = ps.executeQuery();
        rs.next(); // Move to the first row
        int count = rs.getInt(1);

        if (count > 0) {
            // If studentId exists, set a message
            message = "Student ID " + studentId + " already exists. Please use a unique ID.";
        } else {
            // Insert the new student record
            String sql = "INSERT INTO students (course, branch, studentId, name, fatherName, gender) VALUES (?, ?, ?, ?, ?, ?)";
            ps = con.prepareStatement(sql);
            ps.setString(1, course);
            ps.setString(2, branch);
            ps.setString(3, studentId);
            ps.setString(4, name);
            ps.setString(5, fatherName);
            ps.setString(6, gender);

            int rowsInserted = ps.executeUpdate();
            if (rowsInserted > 0) {
                response.sendRedirect("adminHome.jsp"); // Redirect on success
            } else {
                message = "Failed to add student.";
            }
        }
    } catch (Exception e) {
        message = "Error: " + e.getMessage(); // Capture error message
    } 
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Save Student</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f9;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .message-container {
            background-color: #ffffff;
            padding: 20px 30px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
            max-width: 400px;
            width: 100%;
        }

        h2 {
            color: #333;
            margin-bottom: 20px;
        }

        .message {
            font-size: 16px;
            color: #555;
            margin-bottom: 20px;
        }

        .button {
            display: inline-block;
            padding: 10px 20px;
            font-size: 16px;
            font-weight: bold;
            color: #fff;
            background-color: #007bff;
            text-decoration: none;
            border-radius: 4px;
            transition: background-color 0.3s ease;
        }

        .button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="message-container">
        <h2>Student Registration Status</h2>
        <p class="message"><%= message %></p>
        <a href="adminHome.jsp" class="button">Go to Admin Dashboard</a>
    </div>
</body>
</html>
