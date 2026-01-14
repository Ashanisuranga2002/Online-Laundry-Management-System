package servlets.common;
import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.UserModel;
import services.UserController;
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
   @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("gmail");
        String password = request.getParameter("password");
        
        try {
            List<UserModel> userList = UserController.loginvalidate(email, password);
            
            if (!userList.isEmpty()) {
                UserModel user = userList.get(0);
                HttpSession session = request.getSession();
                session.setAttribute("user", user);
                
                // Get the role from the database
                String role = user.getRole();
                
                if (role != null) {
                    // Check if this is a customer or employee based on role
                    if (role.equalsIgnoreCase("admin")) {
                        // Admin user
                        session.setAttribute("isAdmin", true);
                        response.sendRedirect("common/HomePage.jsp");
                    } else if (role.equalsIgnoreCase("Manager")) {
                        // Manager user
                        session.setAttribute("isManager", true);
                        response.sendRedirect("common/HomePage.jsp");
                    } else if (role.equalsIgnoreCase("customer")) {
                        // Customer user
                        session.setAttribute("isCustomer", true);
                        response.sendRedirect("common/HomePage.jsp");
                    } else {
                        // Regular employee (any other role)
                        session.setAttribute("isEmployee", true);
                        response.sendRedirect("common/HomePage.jsp");
                    }
                } else {
                    // Default to regular employee if role is not set
                    session.setAttribute("isEmployee", true);
                    response.sendRedirect("common/HomePage.jsp");
                }
            } else {
                // Login failed
                request.setAttribute("errorMessage", "Invalid email or password");
                RequestDispatcher dispatcher = request.getRequestDispatcher("/common/login.jsp");
                dispatcher.forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            // Handle error
            request.setAttribute("errorMessage", "An error occurred during login");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/common/login.jsp");
            dispatcher.forward(request, response);
        }
    }
}