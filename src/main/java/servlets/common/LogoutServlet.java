package servlets.common;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
       
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processLogout(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processLogout(request, response);
    }
    
   
    private void processLogout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the current session
        HttpSession session = request.getSession(false);
        
        if (session != null) {
            // Remove user attribute
            session.removeAttribute("user");
            
            // Invalidate the session
            session.invalidate();
            
            // Show confirmation message
            String alertMessage = "Logout Successful";
            response.getWriter().println("<script> alert('" + alertMessage + "'); window.location.href = 'common/login.jsp'; </script>");
        } else {
            // If no session exists, just redirect to login page
            response.sendRedirect("common/login.jsp");
        }
    }
}