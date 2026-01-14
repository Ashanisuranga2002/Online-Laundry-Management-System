package servlets.promotion;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.PromotionModel;
import services.PromotionController;


@WebServlet("/PromotionUpdateServlet")
public class PromotionUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int promo_id = Integer.parseInt(request.getParameter("promo_id"));
		String promo_code = request.getParameter("promo_code");
		String description = request.getParameter("description");
		String discount_type = request.getParameter("discount_type");
		double value = Double.parseDouble(request.getParameter("value"));
		String valid_from = request.getParameter("valid_from");
		String valid_to = request.getParameter("valid_to");
		int usage_limit = Integer.parseInt(request.getParameter("usage_limit"));
		String status = request.getParameter("status");
		
		boolean isTrue;
		
		isTrue = PromotionController.updatedata(promo_id, promo_code, description, discount_type, value, valid_from, valid_to, usage_limit, status);
		
		if(isTrue == true) {
			
			List <PromotionModel> promotiondetails = PromotionController.getById(promo_id);
			
			request.setAttribute("promotiondetails", promotiondetails);
			
			String alertMessage = "Data Updated Successful";
			response.getWriter().println("<script> alert ('"+alertMessage+"'); window.location.href = 'PromotionGetAllServlet' </script>");
		}else {
			
			RequestDispatcher dis2 = request.getRequestDispatcher("common/wrong.jsp");
			dis2.forward(request, response);
		}
	}

}
