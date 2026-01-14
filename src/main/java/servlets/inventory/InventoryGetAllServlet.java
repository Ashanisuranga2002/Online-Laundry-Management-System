package servlets.inventory;

import java.io.IOException;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;

import services.InventoryControl;

import javax.servlet.annotation.WebServlet;


@WebServlet("/InventoryGetAllServlet")
public class InventoryGetAllServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final int RECORDS_PER_PAGE = 10;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Fetch all inventory
        List<services.InventoryControl.InventoryItem> allInventory = InventoryControl.getAllInventoryItems();

        // Get parameters
        String searchQuery = request.getParameter("tableSearch");
        String sortParam = request.getParameter("sort");
        String pageParam = request.getParameter("page");

        // Filter by search (case insensitive)
        if (searchQuery != null && !searchQuery.trim().isEmpty()) {
            String keyword = searchQuery.toLowerCase();
            allInventory.removeIf(item ->
                    !(item.getInvantoryName().toLowerCase().contains(keyword) ||
                      item.getInvantoryDescription().toLowerCase().contains(keyword) ||
                      item.getSupplierName().toLowerCase().contains(keyword))
            );
        }

        // Sort inventory
        if (sortParam != null) {
            switch (sortParam) {
                case "A-Z":
                    allInventory.sort(Comparator.comparing(services.InventoryControl.InventoryItem::getInvantoryName, String.CASE_INSENSITIVE_ORDER));
                    break;
                case "Oldest":
                    allInventory.sort(Comparator.comparing(services.InventoryControl.InventoryItem::getLastRestockDate));
                    break;
                case "Newest":
                    allInventory.sort(Comparator.comparing(services.InventoryControl.InventoryItem::getLastRestockDate).reversed());
                    break;
            }
        }

        // Pagination logic
        int currentPage = 1;
        if (pageParam != null) {
            try {
                currentPage = Integer.parseInt(pageParam);
            } catch (NumberFormatException e) {
                currentPage = 1;
            }
        }

        int totalRecords = allInventory.size();
        int totalPages = (int) Math.ceil((double) totalRecords / RECORDS_PER_PAGE);
        int startIndex = (currentPage - 1) * RECORDS_PER_PAGE;
        int endIndex = Math.min(startIndex + RECORDS_PER_PAGE, totalRecords);

        List<services.InventoryControl.InventoryItem> pageList = allInventory.subList(startIndex, endIndex);

        // Set attributes for JSP
        request.setAttribute("inventoryList", pageList);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("totalRecords", totalRecords);
        request.setAttribute("startIndex", startIndex);
        request.setAttribute("endIndex", endIndex);
        request.setAttribute("param", request.getParameterMap()); // preserve query params

        // Forward to JSP
        RequestDispatcher dispatcher = request.getRequestDispatcher("inventory/AllInventoriesDashboard.jsp");
        dispatcher.forward(request, response);
    }
}
