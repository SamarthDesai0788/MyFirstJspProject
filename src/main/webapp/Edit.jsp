<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit User Details</title>
</head>
<body>

<%
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;

    try {
        // Load the database driver (replace 'your_database_driver' with the appropriate driver)
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Establish connection
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/login","root","Sama0788");

        // Create a statement
        stmt = conn.createStatement();

        // Execute a query (for example)
        rs = stmt.executeQuery("SELECT * FROM login");

        if(rs.next()) {
%>
            <form action="./Update" method="get">
                Enter Name: <input type="text" name="name" value="<%= rs.getString("name") %>"><br>
                Enter Password: <input type="password" name="pass" value="<%= rs.getString(2) %>"><br>
                Enter City: <input type="text" name="city" value="<%= rs.getString(3) %>"><br>
                <input type="submit" value="Update">
            </form>
<%
        } else {
            out.println("No data found!");
        }
    } catch (Exception e) {
        // Handle exceptions (e.g., ClassNotFoundException, SQLException)
        e.printStackTrace();
    } finally {
        // Close resources in a finally block
        try {
            if (rs != null) {
                rs.close();
            }
            if (stmt != null) {
                stmt.close();
            }
            if (conn != null) {
                conn.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
</body>
</html>