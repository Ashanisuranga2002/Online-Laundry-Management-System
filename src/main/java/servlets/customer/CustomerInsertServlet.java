package servlets.customer;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import services.CustomerController;



@WebServlet("/CustomerInsertServlet")
public class CustomerInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		String password = request.getParameter("password");
		
		
		boolean isTrue;
		
		isTrue = CustomerController.insertData(name, phone, email, address, password);
		
		if(isTrue == true) {
			
			String alertMessage = "Data insert successfully";
			response.getWriter().println("<script> alert ('"+alertMessage+"'); window.location.href = 'CustomerGetAllServlet' </script>");
			
		}else {
			
			RequestDispatcher dis2 = request.getRequestDispatcher("/common/wrong.jsp");
			dis2.forward(request, response);
		}
	}

}
