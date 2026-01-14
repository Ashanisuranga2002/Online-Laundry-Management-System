package servlets.order;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.Order;
import models.Service;
import services.OrderService;
import services.PricingService;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;

@WebServlet(name = "CreateOrderServlet", value = "/createOrder")
public class CreateOrderServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        
		//Prepare to forward to the JSP that shows the order form
		RequestDispatcher dispatcher = request.getRequestDispatcher("order/order.jsp");

		//user session
        HttpSession session = request.getSession();
        
      //If no orderType was passed in the URL, show an error and go back
        if (request.getParameter("orderType") == null || request.getParameter("orderType").isEmpty()) {

            session.setAttribute("status", "failed");
            session.setAttribute("validation", "Order type is required.");

            response.sendRedirect("pricing.jsp");
            return;
        }

      //Convert the orderType parameter from text to a number
        int orderType = Integer.parseInt(request.getParameter("orderType"));

        // load all services (drop down)
        PricingService pricingService = new PricingService();
        ArrayList<Service> services = pricingService.getAllServices();

        
      //Put the services list and selected type into the form
        request.setAttribute("services", services);
        request.setAttribute("orderType", orderType);
        
      //Show the order form JSP with that data
        dispatcher.forward(request, response);
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

    	//user session
    	HttpSession session = request.getSession();
    	
    	//read all text from the form 
        String weight = request.getParameter("weight");
        String instructions = request.getParameter("instructions");
        String name = request.getParameter("name");
        String mobile = request.getParameter("mobile");
        String dropDate = request.getParameter("dropDate");
        String pickDate = request.getParameter("pickDate");

        if (request.getParameter("serviceId").isEmpty() || weight.isEmpty() || instructions.isEmpty() || name.isEmpty() || mobile.isEmpty() || dropDate.isEmpty() || pickDate.isEmpty() || request.getParameter("serviceId").isEmpty()) {
            session.setAttribute("status", "failed");
            session.setAttribute("validation", "All fields are required.");
            response.sendRedirect("services");
            return;
        }

        // Convert serviceId text into a number
        int serviceId = Integer.parseInt(request.getParameter("serviceId"));
        
        
        // check length of weight text (validations)
        if (weight.length() > 10) {
            session.setAttribute("status", "failed");
            session.setAttribute("validation", "Weight should be less than 10 characters.");
            response.sendRedirect("createOrder?orderType=" + serviceId);
            return;
        }

        //check length of instructions text
        if (instructions.length() > 300) {
            session.setAttribute("status", "failed");
            session.setAttribute("validation", "Instructions should be less than 300 characters.");
            response.sendRedirect("createOrder?orderType=" + serviceId);
            return;
        }

        //check length of name text
        if (name.length() > 45) {
            session.setAttribute("status", "failed");
            session.setAttribute("validation", "Name should be less than 45 characters.");
            response.sendRedirect("createOrder?orderType=" + serviceId);
            return;
        }
        
        //mobile number can't exceed 10
        if (mobile.length() != 10) {
            session.setAttribute("status", "failed");
            session.setAttribute("validation", "Mobile number should be 10 characters.");
            response.sendRedirect("createOrder?orderType=" + serviceId);
            return;
        }
        
        //Convert drop and pick dates from text to Date object
        Date dropDateValue = Date.valueOf(dropDate);
        Date pickDateValue = Date.valueOf(pickDate);
        
        //check drop date is not in the past
        if (dropDateValue.before(Date.valueOf(LocalDate.now()))) {
            session.setAttribute("status", "failed");
            session.setAttribute("validation", "Drop date should be in the future.");
            response.sendRedirect("createOrder?orderType=" + serviceId);
            return;
        }
        
        //check pick date comes after drop date
        if (pickDateValue.before(dropDateValue)) {
            session.setAttribute("status", "failed");
            session.setAttribute("validation", "Pick date should be after drop date.");
            response.sendRedirect("createOrder?orderType=" + serviceId);
            return;
        }

        
        //Prepare to create a new Order object
        OrderService orderService = new OrderService();
        Order order = new Order();
        
        // Get the price of the chosen service
        PricingService pricingService = new PricingService();
        Service service = pricingService.getServiceById(serviceId);
        
        //fill the order object with data 
        order.setOrderType(serviceId);
        order.setWeight(Double.parseDouble(weight));
        order.setInstructions(instructions);
        order.setName(name);
        order.setMobile(mobile);
        order.setDropDate(dropDateValue);
        order.setPickDate(pickDateValue);
        //calculate price by weight (service price * weight)/2
        order.setPrice((service.getPrice() * Double.parseDouble(weight)) / 2);

        boolean isCreated = orderService.createOrder(order);
        
        // pop success or failure message in session
        if (isCreated) {
            session.setAttribute("status", "success");
            session.setAttribute("validation", "Order created successfully.");
        } else {
            session.setAttribute("status", "failed");
            session.setAttribute("validation", "Failed to create order.");
        }

        // redirect to the orders page 
        response.sendRedirect("orders");
        return;

    }


}
