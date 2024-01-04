package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.register.dao.RegisterQuery;

public class UpdateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String name = request.getParameter("name");
            String password = request.getParameter("pass");
            String city = request.getParameter("city");

            RegisterQuery query = new RegisterQuery();
            int count = query.update(name, password, city);

            if (count > 0) {
                response.sendRedirect("View.jsp");
            } else {
                response.sendRedirect("Error.html");
            }
        } catch (Exception e) {
            // Log the exception
            e.printStackTrace(); // Consider using a logging framework for better management

            // Redirect to an error page or display an error message to the user
            response.sendRedirect("Error.html");
        }
    }
}
