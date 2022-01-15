package com.EE.Servlets;

import com.EE.Database.DBManager;
import com.EE.Database.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(value = "/details")
public class DetailsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Long id = Long.parseLong(request.getParameter("id"));
        User user = null;
        try {
            user = DBManager.getUserByID(id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        request.setAttribute("user",user);
        request.getRequestDispatcher("details.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
