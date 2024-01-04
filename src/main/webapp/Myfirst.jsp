<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Display Login Data</title>
    <style>
        table {
            margin: 0 auto; 
        }
    </style>
</head>
<body>
    <%
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/login", "root", "Sama0788");

            String sql = "SELECT name, password, city FROM login";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
    %>
    <h1 style="text-align: center;">Table</h1>
    <div style="text-align: center;">
        <table border="1">
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Password</th>
                    <th>City</th>
                </tr>
            </thead>
            <tbody>
    <%
            while (rs.next()) {
                String name = rs.getString("name");
                String password = rs.getString("password");
                String city = rs.getString("city");
    %>
                <tr>
                    <td><%= name %></td>
                    <td><%= password %></td>
                    <td><%= city %></td>
                </tr>
    <%
            }
    %>
            </tbody>
        </table>
    </div>
    <%
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // Close resources
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    %>
</body>
</html>
