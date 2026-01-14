package servlets.inventory;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import services.InventoryControl;

@WebServlet("/InventoryInsertServlet")
public class InventoryInsertServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            int inventoryid = Integer.parseInt(request.getParameter("inventoryid"));
            String invantoryName = request.getParameter("invantoryName");
            String invantoryDescription = request.getParameter("invantoryDescription");
            int quantityAvailable = Integer.parseInt(request.getParameter("quantityAvailable"));
            String category = request.getParameter("category");
            String stockstatus = request.getParameter("stockstatus");
            String suppliername = request.getParameter("suppliername");

            String lastRestockDateStr = request.getParameter("lastRestockdate");
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            
            if (lastRestockDateStr == null || lastRestockDateStr.trim().isEmpty()) {
                response.getWriter().println("<script>alert('Last Restock Date is required!'); window.location.href = 'inventory/InventoryInsertForm.jsp';</script>");
                return;
            }
            Date lastRestockDate = sdf.parse(lastRestockDateStr);


            double unitprice = Double.parseDouble(request.getParameter("unitprice"));
            String storagelocation = request.getParameter("storagelocation");

            boolean isTrue = InventoryControl.insertInventory(
                    inventoryid, invantoryName, invantoryDescription,
                    quantityAvailable, category, stockstatus, suppliername,
                    lastRestockDate, unitprice, storagelocation);

            if (isTrue) {
                String alertMessage = "Data inserted successfully";
                response.getWriter().println("<script>alert('" + alertMessage + "'); window.location.href = 'InventoryGetAllServlet';</script>");
            } else {
                RequestDispatcher dis2 = request.getRequestDispatcher("form.jsp");
                dis2.forward(request, response);
            }

        } catch (NumberFormatException | ParseException e) {
            e.printStackTrace();
            response.getWriter().println("<script>alert('Invalid input data!'); window.location.href = 'inventory/InventoryInsertForm.jsp';</script>");
        }
    }
}
