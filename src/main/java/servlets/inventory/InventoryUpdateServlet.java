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
import services.InventoryControl.InventoryItem;

@WebServlet("/InventoryUpdateServlet")
public class InventoryUpdateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idStr = request.getParameter("inventoryid");
        if (idStr != null) {
            try {
                int inventoryid = Integer.parseInt(idStr);
                // Fetch the inventory item from your database (implement this method)
                InventoryItem item = InventoryControl.getInventoryById(inventoryid);

                if (item != null) {
                    // Set as request attribute for use in JSP
                    request.setAttribute("inventoryItem", item);
                    RequestDispatcher dispatcher = request.getRequestDispatcher("inventory/InventoryUpdateForm.jsp");
                    dispatcher.forward(request, response);
                } else {
                    // If not found, redirect or show an error
                    response.getWriter().println("<script>alert('Item not found!'); window.location.href = 'inventory/AllInventoriesDashboard.jsp';</script>");
                }
            } catch (NumberFormatException e) {
                response.getWriter().println("<script>alert('Invalid inventory ID!'); window.location.href = 'inventory/AllInventoriesDashboard.jsp';</script>");
            }
        } else {
            response.sendRedirect("inventory/AllInventoriesDashboard.jsp");
        }
    }

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
                response.getWriter().println("<script>alert('Last Restock Date is required!'); window.location.href = 'inventory/AllInventoriesDashboard.jsp';</script>");
                return;
            }

            Date lastRestockDate = sdf.parse(lastRestockDateStr);

            double unitprice = Double.parseDouble(request.getParameter("unitprice"));
            String storagelocation = request.getParameter("storagelocation");

            boolean isTrue = InventoryControl.updateInventory(
                    inventoryid, invantoryName, invantoryDescription,
                    quantityAvailable, category, stockstatus, suppliername,
                    lastRestockDate, unitprice, storagelocation);

            if (isTrue) {
                String alertMessage = "Data updated successfully";
                response.getWriter().println("<script>alert('" + alertMessage + "'); window.location.href = 'InventoryGetAllServlet';</script>");
            } else {
                RequestDispatcher dis2 = request.getRequestDispatcher("wrong.jsp");
                dis2.forward(request, response);
            }

        } catch (NumberFormatException | ParseException e) {
            e.printStackTrace();
            response.getWriter().println("<script>alert('Invalid input data!'); window.location.href = 'inventory/AllInventoriesDashboard.jsp';</script>");
        }
        
    }
}
