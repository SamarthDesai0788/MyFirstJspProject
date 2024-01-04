<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User List</title>
</head>
<body>
<%
    Connection con = null;
    Statement stmt = null;
    ResultSet rs = null;

    try {
        // Establish connection (replace 'your_database_url', 'your_username', 'your_password')
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://your_database_url:3306/login", "root", "Sama0788");

        // Create statement and execute query
        stmt = con.createStatement();
        rs = stmt.executeQuery("SELECT * FROM login");

        // Display user list
        while (rs.next()) {
%>
            <table border="1" style="width:50%;">
                <tr>
                    <th>Name</th>
                    <th>City</th>
                    <th>Edit</th>
                    <th>Delete</th>
                </tr>
                <tr>
                    <td><%= rs.getString("name") %></td>
                    <td><%= rs.getString("city") %></td>
                    <td><a href="Edit.jsp?name=<%= rs.getString("name") %>">Edit</a></td>
                    <td><a href="<%= request.getContextPath() %>/Delete?name=<%= rs.getString("name") %>">Delete</a></td>
                </tr>
            </table>
<%
        }
    } catch (Exception e) {
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
            if (con != null) {
                con.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
<a href="Register.html"><h4>Add new user</h4></a>
<a href="Logout">Logout</a>
</body>
</html>
