package servlets.customer;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.CustomerModel;
import services.CustomerController;



@WebServlet("/CustomerDeleteServlet")
public class CustomerDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int id = Integer.parseInt(request.getParameter("id"));
		boolean isTrue;
		
		isTrue 	= CustomerController.deletdata(id);
		
		if(isTrue == true) {
			
			String alertMessage = "Data Deleted Successfully";
			response.getWriter().println("<script>alert('"+alertMessage+"');"+" window.location.href = 'CustomerGetAllServlet' </script>");
			
			
		}else {
			
			List<CustomerModel> customerDetails = CustomerController.getById(id);
			request.setAttribute("customerDetails", customerDetails);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("/common/wrong.jsp");
			dispatcher.forward(request, response);
		}
	}

}
