package servlets.common;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.UserModel;
import services.UserController;

@WebServlet("/UserDeleteServlet")
public class UserDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int id = Integer.parseInt(request.getParameter("employee_id"));
		boolean isTrue;
		
		isTrue = UserController.deleteaccount(id);
		if(isTrue == true) {
			String alertMassage = "Data Delete Successful";
			response.getWriter().println("<script>alert('"+alertMassage+"');"+"window.location.href = 'login.jsp'</script>");
		}else {
			
			List<UserModel> userDetails = UserController.getById(id);
			request.setAttribute("userDetails", userDetails);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("wrong.jsp");
			dispatcher.forward(request, response);
		}
		
		
	}
		
}


