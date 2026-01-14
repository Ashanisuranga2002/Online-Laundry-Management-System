package servlets.employee;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import services.EmployeeController;


@WebServlet("/EmployeeInsertServlet")
public class EmployeeInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

   @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String name = request.getParameter("name");
		String role = request.getParameter("role");
		String contact_number = request.getParameter("contact_number");
		String email = request.getParameter("email");
		String shift_timing = request.getParameter("shift_timing");
		String password = request.getParameter("password");
		
		
		boolean isTrue;
		
		isTrue = EmployeeController.insertData(name, role, contact_number, email, shift_timing, password);
		
		if(isTrue == true) {
			
			String alertMessage = "Data insert successfully";
			response.getWriter().println("<script> alert ('"+alertMessage+"'); window.location.href = 'EmployeeGetAllServlet' </script>");
			
		}else {
			
			RequestDispatcher dis2 = request.getRequestDispatcher("/common/wrong.jsp");
			dis2.forward(request, response);
		}
	}

}
