package servlets.order;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.Service;
import services.PricingService;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;

@WebServlet(name = "ServicesServlet", value = "/services")
public class ServicesServlet extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        
    	//chose the jsp page
    	RequestDispatcher dispatcher = request.getRequestDispatcher("common/pricing.jsp");

        HttpSession session = request.getSession();

        // model object for fetch data from services
        PricingService service = new PricingService();
        //create and array list for store services
        ArrayList<Service> services = service.getAllServices();

        // show all services
        request.setAttribute("services", services);
        
        //hand over to jsp
        dispatcher.forward(request, response);
    }

}
