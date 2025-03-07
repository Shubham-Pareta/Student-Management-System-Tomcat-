<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Student Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .dashboard-container {
            text-align: center;
            background: #fff;
            padding: 20px 30px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            max-width: 400px;
        }
        h1 { color: #333; }
        p { margin-top: 10px; color: #555; }
        table {
            width: 100%;
            margin-top: 20px;
            border-collapse: collapse;
        }
        table th, table td {
            text-align: left;
            padding: 8px;
            border: 1px solid #ddd;
        }
        table th { background-color: #007bff; color: white; }
    </style>
</head>
<body>
    <div class="dashboard-container">
        <h1>Welcome to Your Dashboard</h1>
        <p>Your details are as follows:</p>

        <%
            // Get the studentId from session
            String studentId = (String) session.getAttribute("studentId");

            if (studentId != null && !studentId.trim().isEmpty()) {
                studentId = studentId.trim();

                Connection con = null;
                PreparedStatement ps = null;
                ResultSet rs = null;

                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/StudentManagement", "root", "@Shubham2003");

                    String sql = "SELECT * FROM students WHERE studentId = ?";
                    ps = con.prepareStatement(sql);
                    ps.setString(1, studentId);
                    rs = ps.executeQuery();

                    if (rs.next()) {
        %>
        <table>
            <tr><th>Field</th><th>Value</th></tr>
            <tr><td>Student ID</td><td><%= rs.getString("studentId") %></td></tr>
            <tr><td>Name</td><td><%= rs.getString("name") %></td></tr>
            <tr><td>Father's Name</td><td><%= rs.getString("fatherName") %></td></tr>
            <tr><td>Course</td><td><%= rs.getString("course") %></td></tr>
            <tr><td>Branch</td><td><%= rs.getString("branch") %></td></tr>
            <tr><td>Gender</td><td><%= rs.getString("gender") %></td></tr>
        </table>
        <%
                    } else {
                        out.println("<p>Invalid Student ID or no information found.</p>");
                    }
                } catch (Exception e) {
                    out.println("<p>Error: " + e.getMessage() + "</p>");
                } finally {
                    if (rs != null) try { rs.close(); } catch (Exception ignored) {}
                    if (ps != null) try { ps.close(); } catch (Exception ignored) {}
                    if (con != null) try { con.close(); } catch (Exception ignored) {}
                }
            } else {
                out.println("<p>Error: Student ID is missing or invalid.</p>");
            }
        %>
    </div>
</body>
</html>
