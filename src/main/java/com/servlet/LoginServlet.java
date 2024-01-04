package com.servlet;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("uname");
        String password = request.getParameter("pass");
        PrintWriter out = response.getWriter();
        RegisterQuery query = new RegisterQuery();
        HttpSession session = request.getSession();

        try {
            ResultSet rs = query.login(name, password);
            if (rs.next()) {
                // Setting username in the session attribute
                session.setAttribute("username", name); // Assuming 'name' is the username

                out.print("Welcome: " + name);
                RequestDispatcher rd = request.getRequestDispatcher("View.jsp");
                rd.include(request, response);
            } else {
                out.print("<h1 style='color:red'>Invalid Credentials</h1>");
                RequestDispatcher rd = request.getRequestDispatcher("login.html");
                rd.forward(request, response);
            }
        } catch (Exception e) {
            // Handle exceptions properly, log them, or provide an appropriate error response
            e.printStackTrace();
            out.print("<h1 style='color:red'>An error occurred</h1>");
        }
    }
}
