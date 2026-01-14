package servlets.service;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import services.Services_Controller;


@WebServlet("/Services_InsertServlet")
public class Services_InsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		String service_name = request.getParameter("service_name");
		String description = request.getParameter("description");
		String price = request.getParameter("price");
		String duration = request.getParameter("duration");
		String available = request.getParameter("available");
		String category = request.getParameter("category");

		boolean isTrue;
		
		isTrue = Services_Controller.insertdata(service_name, description, price, duration, available, category);
		
		if(isTrue == true) {
			String alertMessage = "Data insert Successful";
			response.getWriter().println("<script> alert('"+alertMessage+"'); window.location.href= 'Services_DisplayServlet' </script> ");
			
		}
		
		else {
			RequestDispatcher dis2 = request.getRequestDispatcher("wrong.jsp");
			dis2.forward(request, response);
		}
		
	}

}
