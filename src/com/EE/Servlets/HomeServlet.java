package com.EE.Servlets;

import com.EE.Database.DBManager;
import com.EE.Database.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(value = "/home")
public class HomeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("Hello, servlet");

        ArrayList<User> users = null;
        try {
            users = DBManager.getUsers();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        request.setAttribute("users",users);
        request.getRequestDispatcher("home.jsp").forward(request,response);
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
