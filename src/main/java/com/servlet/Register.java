package com.servlet;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class Register extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String name = request.getParameter("name");
            String password = request.getParameter("pass");
            String city = request.getParameter("city");

            // Validate inputs (consider using a validation framework or manual checks)

            RegisterQuery query = new RegisterQuery();
            int count = query.update(name, password, city);

            if (count > 0) {
                response.sendRedirect("link.jsp"); // Redirect to success page
            } else {
                response.sendRedirect("Error.html"); // Redirect to error page
            }
        } catch (IOException e) {
            // Log or handle input/output exceptions
            e.printStackTrace();
            response.sendRedirect("Error.html");
        }
    }
}
