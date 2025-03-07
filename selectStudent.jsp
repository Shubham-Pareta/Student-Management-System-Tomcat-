<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Select Student</title>
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

        select {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .button-container {
            display: flex;
            justify-content: space-between;
            gap: 10px; /* Gap between the buttons */
        }

        .button-container button,
        .button-container a {
            background-color: #007bff;
            color: white;
            border: none;
            cursor: pointer;
            font-weight: bold;
            text-align: center;
            padding: 10px;
            width: 100%; /* Ensure both buttons take up 100% of the container's width */
            border-radius: 4px;
            text-decoration: none; /* Remove underline from the anchor tag */
        }

        .button-container button:hover,
        .button-container a:hover {
            background-color: #0056b3;
        }

        .button-container a {
            display: inline-block; /* Make the anchor tag behave like a button */
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h2>Select Student</h2>
        <form action="updateStudent.jsp" method="get">
            <label for="studentId">Student ID:</label>
            <select name="studentId" id="studentId" required>
                <option value="">Select Student ID</option>
                <% 
                    Connection con = null;
                    PreparedStatement ps = null;
                    ResultSet rs = null;

                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/StudentManagement", "root", "@Shubham2003");
                        
                        String sql = "SELECT studentId FROM students";
                        ps = con.prepareStatement(sql);
                        rs = ps.executeQuery();

                        while (rs.next()) {
                            String id = rs.getString("studentId");
                %>
                            <option value="<%= id %>"><%= id %></option>
                <% 
                        }
                    } catch (Exception e) {
                        out.print("Error: " + e.getMessage());
                    } 
                %>
            </select>

            <div class="button-container">
                <button type="submit">Fetch Details</button>
                <a href="adminHome.jsp">Back</a>
            </div>
        </form>
    </div>
</body>
</html>
