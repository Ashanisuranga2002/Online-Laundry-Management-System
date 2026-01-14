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

@WebServlet("/Services_UpdateServlet")
public class Services_UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		    String service_id = request.getParameter("service_id");
		    String service_name = request.getParameter("service_name");
		    String description = request.getParameter("description");
		    String price = request.getParameter("price");
		    String duration = request.getParameter("duration");
		    String available = request.getParameter("available");
		    String category = request.getParameter("category");
		  

		    boolean isTrue;
		    int serviceIdInt = Integer.parseInt(service_id);  // Fix: use actual ID
		    isTrue = Services_Controller.updatedata(serviceIdInt, service_name, description, price, duration, available, category);

		    if(isTrue) {
		        List<Services_Model> serviceupdate = Services_Controller.getByService_id(service_id);
		        request.setAttribute("serviceupdate", serviceupdate);

		        String alertMessage = "Data update Successful";
		        response.getWriter().println("<script> alert('" + alertMessage + "');" +
		                "window.location.href='Services_DisplayServlet';</script> ");
		    } else {
		        RequestDispatcher dis2 = request.getRequestDispatcher("service/Services_update.jsp");
		        dis2.forward(request, response);
		    }

	}
}
