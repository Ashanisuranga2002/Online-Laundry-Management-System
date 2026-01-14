package servlets.order;



import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import services.OrderService;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;

@WebServlet(name = "DeleteOrderServlet", value = "/deleteOrder")
public class DeleteOrderServlet extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("updateOrder.jsp");

        // user session for store status
        HttpSession session = request.getSession();

        // check the url order id was provided 
        if (request.getParameter("orderId") == null || request.getParameter("orderId").isEmpty()) {

            session.setAttribute("status", "failed");
            session.setAttribute("validation", "Order Id is required.");

            response.sendRedirect("orders");
            return;
        }

        //change order id text in to integer
        int orderId = Integer.parseInt(request.getParameter("orderId"));

        // create a order service to delete order 
        OrderService orderService = new OrderService();

        //try to delete order from DB
        boolean deleted = orderService.deleteOrder(orderId);

        //success or failure message
        if (deleted) {
            session.setAttribute("status", "success");
            session.setAttribute("validation", "Order deleted successfully.");
        } else {
            session.setAttribute("status", "failed");
            session.setAttribute("validation", "Failed to delete order.");
        }

        //redirect to orders 
        response.sendRedirect("orders");
    }

}
