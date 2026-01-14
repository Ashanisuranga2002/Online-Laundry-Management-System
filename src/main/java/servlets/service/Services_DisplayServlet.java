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

@WebServlet("/Services_DisplayServlet")
public class Services_DisplayServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { 
		
		List <Services_Model> allServices = Services_Controller.getAllservice();
		request.setAttribute("allServices", allServices);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("service/Services_Details.jsp");
		dispatcher.forward(request, response);
	}


	
}
