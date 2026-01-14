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

@WebServlet("/UpdateUserServlet")
public class UpdateUserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
       
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // GET method implementation if needed
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String gmail = request.getParameter("gmail");
        String password = request.getParameter("password");
        String phone = request.getParameter("phone");
        
        boolean isTrue = UserController.updateprofile(id, name, gmail, password, phone);
        
        if(isTrue) {
            // Get the updated user details
            List<UserModel> userdetails = UserController.getById(id);
            
            if (userdetails != null && !userdetails.isEmpty()) {
                // Get the updated user model
                UserModel updatedUser = userdetails.get(0);
                
                // Update the user in the session
                HttpSession session = request.getSession();
                session.setAttribute("user", updatedUser);
                
                // Show success message and redirect to ProfileServlet
                String alertMessage = "Data Update Successful";
                response.getWriter().println("<script> alert('" + alertMessage + "'); window.location.href = 'ProfileServlet'; </script>");
            } else {
                // Handle the case where no user was found
                RequestDispatcher dis2 = request.getRequestDispatcher("/common/wrong.jsp");
                dis2.forward(request, response);
            }
        } else {
            RequestDispatcher dis2 = request.getRequestDispatcher("/common/wrong.jsp");
            dis2.forward(request, response);
        }
    }
}