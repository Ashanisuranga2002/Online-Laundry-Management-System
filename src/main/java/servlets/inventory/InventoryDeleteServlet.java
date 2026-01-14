package servlets.inventory;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import services.InventoryControl;

@WebServlet("/InventoryDeleteServlet")
public class InventoryDeleteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idParam = request.getParameter("inventoryid");

        if (idParam == null || idParam.isEmpty()) {
            response.getWriter().println("<script>alert('Missing inventory ID.'); window.location.href = 'InventoryGetAllServlet';</script>");
            return;
        }

        try {
            int inventoryid = Integer.parseInt(idParam);
            boolean isTrue = InventoryControl.delete(inventoryid);

            if (isTrue) {
                // Success: Redirect to dashboard/list page
                response.sendRedirect("InventoryGetAllServlet");
            } else {
                // Failure: Show error and stay on dashboard
                response.getWriter().println("<script>alert('Delete failed!'); window.location.href = 'InventoryGetAllServlet';</script>");
            }
        } catch (NumberFormatException e) {
            response.getWriter().println("<script>alert('Invalid inventory ID.'); window.location.href = 'InventoryGetAllServlet';</script>");
        } catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }

    // Optionally, you can forward POST requests to GET
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
