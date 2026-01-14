package servlets.employee;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.EmployeeModel;
import services.EmployeeController;

@WebServlet("/EmployeeUpdateServlet")
public class EmployeeUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int employee_id = Integer.parseInt(request.getParameter("employee_id"));
		String name = request.getParameter("name");
		String role = request.getParameter("role");
		String contact_number = request.getParameter("contact_number");
		String email = request.getParameter("email");
		String shift_timing = request.getParameter("shift_timing");
		String password = request.getParameter("password");
		
		boolean isTrue;
		
		isTrue = EmployeeController.updatedata(employee_id, name, role, contact_number, email, shift_timing, password);
		
		if(isTrue == true) {
			
			List <EmployeeModel> employeedetails = EmployeeController.getById(employee_id);
			
			request.setAttribute("employeedetails", employeedetails);
			
			String alertMessage = "Data Updated Successful";
			response.getWriter().println("<script> alert ('"+alertMessage+"'); window.location.href = 'EmployeeGetAllServlet' </script>");
		}else {
			
			RequestDispatcher dis2 = request.getRequestDispatcher("common/wrong.jsp");
			dis2.forward(request, response);
		}
	}

}
