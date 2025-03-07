<%@ page import="java.sql.*" %>
<%
    String studentId = request.getParameter("studentId");
    String course = "";
    String branch = "";
    String name = "";
    String fatherName = "";
    String gender = "";
    String message = "";

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/StudentManagement", "root", "@Shubham2003");

        // Fetch student details by studentId
        String sql = "SELECT * FROM students WHERE studentId = ?";
        ps = con.prepareStatement(sql);
        ps.setString(1, studentId);
        rs = ps.executeQuery();

        if (rs.next()) {
            course = rs.getString("course");
            branch = rs.getString("branch");
            name = rs.getString("name");
            fatherName = rs.getString("fatherName");
            gender = rs.getString("gender");
        } else {
            message = "Student with ID " + studentId + " not found.";
        }
    } catch (Exception e) {
        message = "Error: " + e.getMessage();
    } 
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Update Student Details</title>
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
            max-width: 400px;
            width: 100%;
        }

        h2 {
            color: #333;
            margin-bottom: 20px;
            text-align: center;
        }

        label {
            font-weight: bold;
            display: block;
            margin-top: 10px;
            color: #333;
        }

        input[type="text"],
        select {
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
            background-color: #007bff;
            text-decoration: none;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            margin-right: 10px; /* Add margin between buttons */
        }

        .button:hover {
            background-color: #0056b3;
        }

        .button-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .message {
            font-size: 16px;
            color: #555;
            margin-top: 20px;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h2>Update Student Details</h2>
        <% if (message.isEmpty()) { %>
        <form action="saveUpdatedStudent.jsp" method="post">
            <input type="hidden" name="studentId" value="<%= studentId %>">

            <label for="course">Course Name:</label>
            <input type="text" name="course" id="course" value="<%= course %>" required>

            <label for="branch">Branch Name:</label>
            <input type="text" name="branch" id="branch" value="<%= branch %>" required>

            <label for="name">Name:</label>
            <input type="text" name="name" id="name" value="<%= name %>" required>

            <label for="fatherName">Father's Name:</label>
            <input type="text" name="fatherName" id="fatherName" value="<%= fatherName %>" required>

            <label for="gender">Gender:</label>
            <select name="gender" id="gender" required>
                <option value="Male" <%= "Male".equals(gender) ? "selected" : "" %>>Male</option>
                <option value="Female" <%= "Female".equals(gender) ? "selected" : "" %>>Female</option>
                <option value="Other" <%= "Other".equals(gender) ? "selected" : "" %>>Other</option>
            </select>

            <div class="button-container">
                <button type="submit" class="button">Update</button>
                <a href="selectStudent.jsp" class="button">Back</a>
            </div>
        </form>
        <% } else { %>
        <p class="message"><%= message %></p>
        <% } %>
    </div>
</body>
</html>
