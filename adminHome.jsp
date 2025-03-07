<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Home</title>
    <style>
        /* General styling */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(135deg, #74b9ff, #a29bfe);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        /* Container styling */
        .nav-container {
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
            width: 320px;
            padding: 20px;
            text-align: center;
            animation: fadeIn 1s ease;
        }

        /* Header styling */
        .header h2 {
            color: #2d3436;
            font-size: 1.5em;
            font-weight: 600;
            margin: 0 0 20px 0;
        }

        .logout-container {
            margin-top: 20px;
        }

        .logout-container a {
            color: #d63031;
            text-decoration: none;
            font-weight: bold;
            font-size: 0.9em;
            transition: color 0.3s;
        }

        .logout-container a:hover {
            color: #e17055;
        }

        /* Navigation links as rows */
        .nav a {
            display: block;
            color: #0984e3;
            background-color: #dfe6e9;
            padding: 12px;
            margin: 10px 0;
            text-decoration: none;
            font-size: 1.1em;
            border-radius: 8px;
            transition: background 0.3s, color 0.3s, transform 0.2s;
            font-weight: bold;
        }

        /* Hover effect for navigation links */
        .nav a:hover {
            background-color: #74b9ff;
            color: #ffffff;
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        /* Fade-in animation */
        @keyframes fadeIn {
            from { opacity: 0; transform: scale(0.9); }
            to { opacity: 1; transform: scale(1); }
        }
    </style>
</head>
<body>

    <div class="nav-container">
        <!-- Header with title -->
        <div class="header">
            <h2>Admin Dashboard</h2>
        </div>

        <!-- Navigation links -->
        <div class="nav">
            <a href="addStudent.jsp">Add New Student</a>
            <a href="deleteStudent.jsp">Delete Student</a>
            <a href="selectStudent.jsp">Update Student</a>
            <a href="searchStudent.jsp">Search Student</a>
        </div>

        <!-- Logout option at the bottom -->
        <div class="logout-container">
            <a href="index.html" class="logout">Logout</a>
        </div>
    </div>

</body>
</html>
