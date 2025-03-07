<%@ page import="java.sql.*" %>
<%
    String studentId = request.getParameter("studentId");
    String message = "";

    if (studentId != null && !studentId.isEmpty()) {
        Connection con = null;
        PreparedStatement ps = null;

        try {
            Class.forName("com.mysql.jdbc.Driver"); // Modern MySQL driver
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/StudentManagement", "root", "@Shubham2003");

            // Delete query to remove the student based on ID
            String sql = "DELETE FROM students WHERE studentId = ?";
            ps = con.prepareStatement(sql);
            ps.setString(1, studentId);

            int rowsDeleted = ps.executeUpdate();
            if (rowsDeleted > 0) {
                message = "Student with ID " + studentId + " has been successfully deleted.";
            } else {
                message = "No student found with ID " + studentId + ".";
            }
        } catch (Exception e) {
            message = "Error: " + e.getMessage();
        } 
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Delete Student</title>
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

        .form-container {
            background-color: #fff;
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

        form {
            margin-bottom: 20px;
        }

        input[type="text"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .button {
            display: inline-block;
            padding: 10px 20px;
            font-size: 16px;
            font-weight: bold;
            color: #fff;
            background-color: #d9534f; /* Red for delete */
            text-decoration: none;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .button:hover {
            background-color: #c9302c;
        }

        .message {
            font-size: 16px;
            color: #555;
            margin-top: 30px;
        }

        /* Adding space between the input field and the Delete button */
        .button-container {
            margin-top: 15px; /* This creates the gap */
        }

        .button-back {
            background-color: #007bff;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h2>Delete Student</h2>
        <form action="deleteStudent.jsp" method="get">
            <label for="studentId">Enter Student ID:</label>
            <input type="text" name="studentId" id="studentId" placeholder="Enter Student ID" required>
            
            <!-- Add gap between button and upper content -->
            <div class="button-container">
                <button type="submit" class="button">Delete</button>
            </div>
        </form>

        <% if (!message.isEmpty()) { %>
        <p class="message"><%= message %></p>
        <% } %>

        <a href="adminHome.jsp" class="button button-back">Back</a>
    </div>
</body>
</html>
