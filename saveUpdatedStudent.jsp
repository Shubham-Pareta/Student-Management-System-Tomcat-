<%@ page import="java.sql.*" %>
<%
    String studentId = request.getParameter("studentId");
    String course = request.getParameter("course");
    String branch = request.getParameter("branch");
    String name = request.getParameter("name");
    String fatherName = request.getParameter("fatherName");
    String gender = request.getParameter("gender");
    String message = "";

    Connection con = null;
    PreparedStatement ps = null;

    try {
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/StudentManagement", "root", "@Shubham2003");

        // Update student details in the database
        String sql = "UPDATE students SET course = ?, branch = ?, name = ?, fatherName = ?, gender = ? WHERE studentId = ?";
        ps = con.prepareStatement(sql);
        ps.setString(1, course);
        ps.setString(2, branch);
        ps.setString(3, name);
        ps.setString(4, fatherName);
        ps.setString(5, gender);
        ps.setString(6, studentId);

        int rowsUpdated = ps.executeUpdate();

        if (rowsUpdated > 0) {
            message = "Student details updated successfully!";
        } else {
            message = "Failed to update student details. Please try again.";
        }
    } catch (Exception e) {
        message = "Error: " + e.getMessage();
    } finally {
        if (ps != null) ps.close();
        if (con != null) con.close();
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
            background-color: #fff;
            padding: 20px 30px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            text-align: center;
        }

        h2 {
            color: #333;
            margin-bottom: 20px;
        }

        p {
            color: #555;
            font-size: 16px;
        }

        .button {
            display: inline-block;
            padding: 10px 20px;
            font-size: 16px;
            font-weight: bold;
            color: #fff;
            background-color: #007bff;
            text-decoration: none;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            margin-top: 20px;
        }

        .button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="message-container">
        <h2>Update Status</h2>
        <p><%= message %></p>
        <a href="selectStudent.jsp" class="button">Back to Update</a>
        <a href="adminHome.jsp" class="button">Dashboard</a>
    </div>
</body>
</html>
