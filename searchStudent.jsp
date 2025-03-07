<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Student Records</title>
    <style>
        /* General styling */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f0f4f8;
            margin: 0;
            padding: 0;
        }

        /* Navbar styling */
        .navbar {
            background-color: #007bff;
            color: white;
            padding: 10px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .navbar h1 {
            margin: 0;
            font-size: 24px;
        }

        .search-form {
            display: flex;
            align-items: center;
        }

        .search-form input[type="text"] {
            padding: 8px;
            border-radius: 4px;
            border: 1px solid #ccc;
            margin-right: 10px;
            width: 200px;
        }

        .search-form button {
            padding: 8px 12px;
            background-color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            color: #007bff;
            font-weight: bold;
        }

        .search-form button:hover {
            background-color: #e9ecef;
        }

        /* Back button styling */
        .back-button {
            display: inline-block;
            margin: 20px 0;
            padding: 10px 15px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            font-weight: bold;
        }

        .back-button:hover {
            background-color: #0056b3;
        }

        /* Table styling */
        .container {
            width: 100%;
            max-width: 800px;
            margin: 30px auto;
            background-color: white;
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #007bff;
            color: white;
        }

        tr:hover {
            background-color: #f1f1f1;
        }
    </style>
</head>
<body>

<div class="navbar">
    <h1>Student Records</h1>
    <form class="search-form" action="searchStudent.jsp" method="get">
        <input type="text" name="query" placeholder="Search by ID">
        <button type="submit">Search</button>
    </form>
</div>

<div class="container">
    <a href="adminHome.jsp" class="back-button">Back</a>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Course</th>
                <th>Branch</th>
                <th>Gender</th>
                <th>Father's Name</th>
            </tr>
        </thead>
        <tbody>
            <%
                Connection con = null;
                PreparedStatement ps = null;
                ResultSet rs = null;

                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/StudentManagement", "root", "@Shubham2003");

                    String searchQuery = request.getParameter("query");
                    if (searchQuery != null && !searchQuery.isEmpty()) {
                        // Display searched result first
                        String sql = "SELECT * FROM students WHERE studentId = ?";
                        ps = con.prepareStatement(sql);
                        ps.setString(1, searchQuery);
                        rs = ps.executeQuery();

                        while (rs.next()) {
                            String id = rs.getString("studentId");
                            String name = rs.getString("name");
                            String course = rs.getString("course");
                            String branch = rs.getString("branch");
                            String gender = rs.getString("gender");
                            String fatherName = rs.getString("fatherName");
            %>
            <tr style="background-color: #ffffcc;"> <!-- Highlight the searched row -->
                <td><%= id %></td>
                <td><%= name %></td>
                <td><%= course %></td>
                <td><%= branch %></td>
                <td><%= gender %></td>
                <td><%= fatherName %></td>
            </tr>
            <%
                        }
                    }

                    // Display all student records
                    String sql = "SELECT * FROM students";
                    ps = con.prepareStatement(sql);
                    rs = ps.executeQuery();

                    while (rs.next()) {
                        String id = rs.getString("studentId");
                        String name = rs.getString("name");
                        String course = rs.getString("course");
                        String branch = rs.getString("branch");
                        String gender = rs.getString("gender");
                        String fatherName = rs.getString("fatherName");

                        // Skip already displayed searched result
                        if (id.equals(searchQuery)) continue;
            %>
            <tr>
                <td><%= id %></td>
                <td><%= name %></td>
                <td><%= course %></td>
                <td><%= branch %></td>
                <td><%= gender %></td>
                <td><%= fatherName %></td>
            </tr>
            <%
                    }
                } catch (Exception e) {
                    out.print("Error: " + e.getMessage());
                } finally {
                    if (rs != null) rs.close();
                    if (ps != null) ps.close();
                    if (con != null) con.close();
                }
            %>
        </tbody>
    </table>
</div>

</body>
</html>
