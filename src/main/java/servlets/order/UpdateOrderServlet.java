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

@WebServlet(name = "UpdateOrderServlet", value = "/updateOrder")
public class UpdateOrderServlet extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
    	
    	
    	//show update order inside the server 
        RequestDispatcher dispatcher = request.getRequestDispatcher("order/updateOrder.jsp");

        //user session for store error or status
        HttpSession session = request.getSession();

        //check URL includes the order id 
        if (request.getParameter("orderId") == null || request.getParameter("orderId").isEmpty()) {

            session.setAttribute("status", "failed");
            session.setAttribute("validation", "Order Id is required.");

            response.sendRedirect("orders");//send back to orders list 
            return;
        }

        // convert text it to integer
        int orderId = Integer.parseInt(request.getParameter("orderId"));

        // load previous updated data to form 
        OrderService orderService = new OrderService();
        Order order = orderService.getOrderById(orderId);

        //show all services in dropdown 
        PricingService pricingService = new PricingService();
        ArrayList<Service> services = pricingService.getAllServices();

        request.setAttribute("order", order);
        request.setAttribute("services", services);
        
        //Display updated data
        dispatcher.forward(request, response);
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        HttpSession session = request.getSession();

        //read each parameter
        String weight = request.getParameter("weight");
        String instructions = request.getParameter("instructions");
        String name = request.getParameter("name");
        String mobile = request.getParameter("mobile");
        String dropDate = request.getParameter("dropDate");
        String pickDate = request.getParameter("pickDate");
        
        //if any field is blank
        if (request.getParameter("serviceId").isEmpty() || request.getParameter("orderId").isEmpty() || weight.isEmpty() || instructions.isEmpty() || name.isEmpty() || mobile.isEmpty() || dropDate.isEmpty() || pickDate.isEmpty()) {
            session.setAttribute("status", "failed");
            session.setAttribute("validation", "All fields are required.");
            
            //redirect to orders
            response.sendRedirect("orders");
            return;
        }

        // Convert serviceId and orderId to numbers
        int serviceId = Integer.parseInt(request.getParameter("serviceId"));
        int orderId = Integer.parseInt(request.getParameter("orderId"));

        
        // check  text is not too long 
        if (weight.length() > 10) {
            session.setAttribute("status", "failed");
            session.setAttribute("validation", "Weight should be less than 10 characters.");
            response.sendRedirect("updateOrder?orderId=" + orderId);
            return;
        }

        //Check instructions length
        if (instructions.length() > 300) {
            session.setAttribute("status", "failed");
            session.setAttribute("validation", "Instructions should be less than 300 characters.");
            response.sendRedirect("updateOrder?orderId=" + orderId);
            return;
        }

        // name
        if (name.length() > 45) {
            session.setAttribute("status", "failed");
            session.setAttribute("validation", "Name should be less than 45 characters.");
            response.sendRedirect("updateOrder?orderId=" + orderId);
            return;
        }

        //mobile
        if (mobile.length() != 10) {
            session.setAttribute("status", "failed");
            session.setAttribute("validation", "Mobile number should be 10 characters.");
            response.sendRedirect("updateOrder?orderId=" + orderId);
            return;
        }

        //change date text to date object
        Date dropDateValue = Date.valueOf(dropDate);
        Date pickDateValue = Date.valueOf(pickDate);
        
        
        //make sure date isn’t in the past
        if (dropDateValue.before(Date.valueOf(LocalDate.now()))) {
            session.setAttribute("status", "failed");
            session.setAttribute("validation", "Drop date should be in the future.");
            response.sendRedirect("updateOrder?orderId=" + orderId);
            return;
        }
        
        // make sure pick date is after drop date 
        if (pickDateValue.before(dropDateValue)) {
            session.setAttribute("status", "failed");
            session.setAttribute("validation", "Pick date should be after drop date.");
            response.sendRedirect("updateOrder?orderId=" + orderId);
            return;
        }

        //Prepare to update the Order object
        OrderService orderService = new OrderService();
        Order order = new Order();

        PricingService pricingService = new PricingService();
        Service service = pricingService.getServiceById(serviceId);
        // Look up the service’s price to recalculate the cost

        order.setOrderId(orderId);
        order.setOrderType(serviceId);
        order.setWeight(Double.parseDouble(weight));
        order.setInstructions(instructions);
        order.setName(name);
        order.setMobile(mobile);
        order.setDropDate(dropDateValue);
        order.setPickDate(pickDateValue);
        //new price
        order.setPrice((service.getPrice() * Double.parseDouble(weight)) / 2);

        // send updated data to DB
        boolean isUpdated = orderService.updateOrder(order);

        //success or failed message 
        if (isUpdated) {
            session.setAttribute("status", "success");
            session.setAttribute("validation", "Order updated successfully.");
            response.sendRedirect("orders");
        } else {
            session.setAttribute("status", "failed");
            session.setAttribute("validation", "Failed to update order.");
        }


        
        return;

    }


}
