package servlets.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Services_Model;
import services.Services_Controller;

@WebServlet("/Services_DeleteServlet")
public class Services_DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String service_id = request.getParameter("service_id");
		boolean isTrue;
		isTrue = Services_Controller.deletedata(service_id);
		
		if(isTrue == true) {
			String alertMessage = "Data delete Successful";
			response.getWriter().println("<script>alert('"+alertMessage+"');"+"window.location.href='Services_DisplayServlet';</script>");
		}
		else {
			List<Services_Model> serviceDetail = Services_Controller.getByService_id(service_id);
			request.setAttribute("serviceDetail", serviceDetail);
			
			RequestDispatcher dis2 = request.getRequestDispatcher("wrong.jsp");
			dis2.forward(request, response);
		}
		
	}

}
