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


@WebServlet("/EmployeeGetAllServlet")
public class EmployeeGetAllServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List <EmployeeModel> allEmployee = EmployeeController.getAllEmployees();
		request.setAttribute("allEmployee", allEmployee);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/employee/AllEmployeesDisplay.jsp");
		dispatcher.forward(request, response);
		
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		doGet(request, response);
	}

}
