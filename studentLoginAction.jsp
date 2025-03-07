<%@ page import="java.sql.*" %>
<!-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> -->
<!-- <%@ page import="javax.servlet.http.*" %> -->

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Student Login</title>
    <style>
        /* General Reset */
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
        }

        /* Body Styles */
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f8f9fa;
        }

        /* Form Container */
        form {
            width: 300px;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            text-align: center;
        }

        h2 {
            color: #333;
            margin-bottom: 20px;
        }

        label {
            font-weight: bold;
            color: #555;
            display: block;
            margin-bottom: 5px;
            text-align: left;
        }

        input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 16px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        button {
            width: 100%;
            padding: 10px;
            color: #fff;
            background-color: #007bff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            font-weight: bold;
        }

        button:hover {
            background-color: #0056b3;
        }

        .error-message {
            margin-top: 10px;
            color: red;
            font-size: 14px;
        }
    </style>
</head>
<body>
    <form action="studentLoginAction.jsp" method="post">
        <h2>Student Login</h2>
        <label>Student ID:</label>
        <input type="text" name="studentId" placeholder="Enter your ID" required>
        <button type="submit">Login</button>
        <%
    // Logic to handle the ID validation
    String studentId = request.getParameter("studentId");
    String errorMessage = "";

    if (studentId != null && !studentId.isEmpty()) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            // Connect to the database
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/StudentManagement", "root", "@Shubham2003");

            // Query to check if the ID exists
            String sql = "SELECT * FROM students WHERE studentId = ?";
            ps = con.prepareStatement(sql);
            ps.setString(1, studentId);
            rs = ps.executeQuery();

            if (rs.next()) {
                // Store the studentId in session
                session.setAttribute("studentId", studentId);

                // Redirect to student dashboard
                response.sendRedirect("studentDashboard.jsp");
            } else {
                // If the ID is incorrect, display an error message
                errorMessage = "Invalid Student ID. Please try again.";
            }
        } catch (Exception e) {
            errorMessage = "Error: " + e.getMessage();
        } finally {
            try { if (rs != null) rs.close(); } catch (Exception ignored) {}
            try { if (ps != null) ps.close(); } catch (Exception ignored) {}
            try { if (con != null) con.close(); } catch (Exception ignored) {}
        }
    }

    if (!errorMessage.isEmpty()) {
%>
    <div class="error-message"><%= errorMessage %></div>
<% } %>
    </form>
</body>
</html>
