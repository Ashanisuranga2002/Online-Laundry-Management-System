package servlets.order;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.Order;
import services.OrderService;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "OrdersServlet", value = "/orders")
public class OrdersServlet extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		
		// Prepare to forward to the JSP that will display all orders
        RequestDispatcher dispatcher = request.getRequestDispatcher("order/orders.jsp");

        //user session
        HttpSession session = request.getSession();

        //create order model object to communicate with the DB
        OrderService orderService = new OrderService();
        
        // fetch order data from DB
        ArrayList<Order> orders = orderService.getAllOrders();

        //put the list of orders into the request under the name
        request.setAttribute("orders", orders);
        // hand over every thing to jsp
        dispatcher.forward(request, response);
    }

}
