package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Logout extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false); // Retrieves the session without creating a new one if it doesn't exist
        
        if (session != null) {
            session.invalidate(); // Invalidates the session, removing all attributes and marks it as expired
        }

        response.sendRedirect("Login.html"); // Redirects to the login page after logout
    }
}
