<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add New Student</title>
    <style>
        /* General styling */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f9;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        /* Form styling */
        .form-container {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            width: 350px;
        }

        h2 {
            text-align: center;
            color: #333;
        }

        label {
            font-weight: bold;
            color: #333;
            display: block;
            margin: 10px 0 5px;
        }

        input[type="text"],
        select {
            width: 100%;
            padding: 8px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        /* Button container for Save and Back buttons */
        .button-container {
            display: flex;
            gap: 10px; /* Space between the buttons */
        }

        /* Button styling */
        .button-container button,
        .button-container a {
            width: 100%;
            padding: 10px;
            color: #fff;
            background-color: #007bff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            font-weight: bold;
            text-align: center;
            text-decoration: none; /* Remove underline for the anchor tag */
        }

        .button-container button:hover,
        .button-container a:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

<div class="form-container">
    <h2>Add New Student</h2>
    <form action="saveStudent.jsp" method="post">
        <label for="course">Course Name:</label>
        <input type="text" name="course" id="course" required>

        <label for="branch">Branch Name:</label>
        <input type="text" name="branch" id="branch" required>

        <label for="studentId">Student ID (Unique):</label>
        <input type="text" name="studentId" id="studentId" required>

        <label for="name">Name:</label>
        <input type="text" name="name" id="name" required>

        <label for="fatherName">Father's Name:</label>
        <input type="text" name="fatherName" id="fatherName" required>

        <label for="gender">Gender:</label>
        <select name="gender" id="gender" required>
            <option value="" disabled selected>Select Gender</option>
            <option value="Male">Male</option>
            <option value="Female">Female</option>
            <option value="Other">Other</option>
        </select>

        <div class="button-container">
            <button type="submit" class="button">Save</button>
            <a href="adminHome.jsp" class="button">Back</a>
        </div>
    </form>
</div>

</body>
</html>
