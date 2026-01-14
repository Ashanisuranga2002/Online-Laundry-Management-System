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


@WebServlet("/PromotionDeleteServlet")
public class PromotionDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int id = Integer.parseInt(request.getParameter("id"));
		boolean isTrue;
		
		isTrue 	= PromotionController.deletdata(id);
		
		if(isTrue == true) {
			
			String alertMessage = "Data Deleted Successfully";
			response.getWriter().println("<script>alert('"+alertMessage+"');"+" window.location.href = 'PromotionGetAllServlet' </script>");
			
			
		}else {
			
			List<PromotionModel> promotionDetails = PromotionController.getById(id);
			request.setAttribute("promotionDetails", promotionDetails);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("/common/wrong.jsp");
			dispatcher.forward(request, response);
		}
		
		
		
	}

}
