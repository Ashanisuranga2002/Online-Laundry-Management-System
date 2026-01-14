<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>All Payments</title>
    <!-- External libraries -->
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://unpkg.com/lucide@latest"></script>
    <!-- Add custom scrollbar style -->
    <style>
        /* Custom scrollbar styling */
        .custom-scrollbar::-webkit-scrollbar {
            width: 8px;
        }
        
        .custom-scrollbar::-webkit-scrollbar-track {
            background: #1e293b;
            border-radius: 10px;
        }
        
        .custom-scrollbar::-webkit-scrollbar-thumb {
            background: #4c1d95;
            border-radius: 10px;
        }
        
        .custom-scrollbar::-webkit-scrollbar-thumb:hover {
            background: #6d28d9;
        }
        
        /* Firefox scrollbar */
        .custom-scrollbar {
            scrollbar-width: thin;
            scrollbar-color: #4c1d95 #1e293b;
        }
    </style>
</head>
<body class="bg-[#0f172a] text-white">
    <!-- Main layout with sidebar and content -->
    <div class="flex min-h-screen">
        <!-- Sidebar navigation - sticky top-0 for scrollable content -->
        <aside class="w-64 min-h-screen bg-[#1e293b] p-6 flex flex-col border-r border-gray-700 shadow-lg sticky top-0">
            <h1 class="text-3xl font-bold text-blue-500 mb-10 tracking-wide">Admin Dashboard</h1>

            <!-- Navigation links -->
            <nav class="flex flex-col space-y-3 text-sm font-medium text-gray-300">
                <!-- Customer navigation link -->
                <a href="<%= request.getContextPath() %>/CustomerGetAllServlet"
                   class="flex items-center px-4 py-3 rounded-lg hover:bg-blue-700 hover:text-white transition duration-200 group">
                    <i data-lucide="users" class="w-5 h-5 mr-3 group-hover:stroke-white"></i>
                    Customers
                </a>

                <!-- Employee navigation link -->
                <a href="<%= request.getContextPath() %>/EmployeeGetAllServlet"
                   class="flex items-center px-4 py-3 rounded-lg hover:bg-blue-700 hover:text-white transition duration-200 group">
                    <i data-lucide="briefcase" class="w-5 h-5 mr-3 group-hover:stroke-white"></i>
                    Employees
                </a>

                <!-- Promotions navigation link -->
                <a href="<%= request.getContextPath() %>/PromotionGetAllServlet"
                   class="flex items-center px-4 py-3 rounded-lg hover:bg-blue-700 hover:text-white transition duration-200 group">
                    <i data-lucide="percent" class="w-5 h-5 mr-3 group-hover:stroke-white"></i>
                    Promotions
                </a>

                <!-- Payments navigation link (active) -->
                <a href="<%= request.getContextPath() %>/PaymentGetAllServlet"
                   class="flex items-center px-4 py-3 bg-blue-700 text-white rounded-lg transition duration-200 group">
                    <i data-lucide="credit-card" class="w-5 h-5 mr-3"></i>
                    Payments
                </a>
                
                <!-- Admin Profile navigation link -->
                <a href="<%= request.getContextPath() %>/ProfileServlet"
                   class="flex items-center px-4 py-3 rounded-lg hover:bg-blue-700 hover:text-white transition duration-200 group">
                    <i data-lucide="shield" class="w-5 h-5 mr-3 group-hover:stroke-white"></i>
                    Admin Profile
                </a>
            </nav>
            
            <!-- Spacer to push logout to bottom -->
            <div class="flex-grow"></div>
            
            <!-- Logout button at the very bottom -->
            <a href="<%= request.getContextPath() %>/LogoutServlet"
               class="flex items-center px-4 py-3 rounded-lg bg-red-600 hover:bg-red-700 text-white transition duration-200 group mt-6">
                <i data-lucide="log-out" class="w-5 h-5 mr-3"></i>
                Logout
            </a>
        </aside>

        <!-- Main content area -->
        <main class="flex-1 p-8 custom-scrollbar">
            <!-- Page header with search -->
            <div class="mb-6">
                <div class="flex justify-between items-center">
                    <h2 class="text-2xl font-bold">All Payments</h2>
                    <!-- Search input -->
                    <input type="text" 
                           id="searchInput" 
                           placeholder="Search..." 
                           class="px-3 py-2 rounded bg-[#1e293b] border border-gray-600 text-white"/>
                </div>
            </div>

            <!-- Payment data table -->
            <div class="overflow-auto rounded-lg shadow border border-gray-700">
                <table class="min-w-full bg-[#1e293b] border-collapse">
                    <!-- Table header -->
                    <thead class="bg-[#334155] text-gray-300 text-left">
                        <tr>
                            <th class="px-6 py-4 font-semibold text-sm uppercase tracking-wider">Payment ID</th>
                            <th class="px-6 py-4 font-semibold text-sm uppercase tracking-wider">Order ID</th>
                            <th class="px-6 py-4 font-semibold text-sm uppercase tracking-wider">Amount</th>
                            <th class="px-6 py-4 font-semibold text-sm uppercase tracking-wider">Status</th>
                            <th class="px-6 py-4 font-semibold text-sm uppercase tracking-wider">Payment Date</th>
                            <th class="px-6 py-4 font-semibold text-sm uppercase tracking-wider">Payment Method</th>
                            <th class="px-6 py-4 font-semibold text-sm uppercase tracking-wider">Created at</th>
                        </tr>
                    </thead>
                    
                    <!-- Table body with payment data -->
                    <tbody id="paymentTable" class="text-white divide-y divide-gray-700 text-sm">
                        <c:forEach var="payment" items="${allPayments}" varStatus="status">
                            <tr class="${status.index % 2 == 0 ? 'bg-[#1e293b]' : 'bg-[#283548]'} hover:bg-[#475569] transition-colors duration-150">
                                <td class="px-6 py-4 whitespace-nowrap font-medium">${payment.payment_id}</td>
                                <td class="px-6 py-4 whitespace-nowrap">${payment.order_id}</td>
                                <td class="px-6 py-4 whitespace-nowrap">${payment.amount}</td>
                                <td class="px-6 py-4 whitespace-nowrap">
                                    <span class="${payment.status == 'Completed' ? 'bg-green-500' : payment.status == 'Pending' ? 'bg-yellow-500' : 'bg-red-500'} px-2 py-1 rounded-full text-xs font-medium">
                                        ${payment.status}
                                    </span>
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap">${payment.payment_date}</td>
                                <td class="px-6 py-4 whitespace-nowrap">${payment.payment_method}</td>
                                <td class="px-6 py-4 whitespace-nowrap text-gray-300">${payment.created_at}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </main>
    </div>

    <!-- Search functionality script -->
    <script>
        /**
         * Filters the payment table based on search input
         * Searches across all columns of the table
         */
        function filterTable() {
            var input = document.getElementById("searchInput");
            var filter = input.value.toUpperCase();
            var rows = document.querySelectorAll("#paymentTable tr");

            rows.forEach(row => {
                let match = false;
                row.querySelectorAll("td").forEach(cell => {
                    if (cell.textContent.toUpperCase().includes(filter)) {
                        match = true;
                    }
                });
                row.style.display = match ? "" : "none";
            });
        }

        // Add event listener for search input
        document.getElementById("searchInput").addEventListener("input", filterTable);
        
        // Initialize Lucide icons
        document.addEventListener('DOMContentLoaded', function() {
            lucide.createIcons();
        });
    </script>
</body>
</html>