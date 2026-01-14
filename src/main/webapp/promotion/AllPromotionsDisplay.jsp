<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>All Promotions</title>
    <!-- External libraries -->
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://unpkg.com/lucide@latest"></script>
</head>
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
        
        /* Error message styling */
        .error-message {
            color: #ef4444;
            font-size: 0.75rem;
            margin-top: 0.25rem;
        }
    </style>
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

                <!-- Promotions navigation link (active) -->
                <a href="<%= request.getContextPath() %>/PromotionGetAllServlet"
                   class="flex items-center px-4 py-3 bg-blue-700 text-white rounded-lg transition duration-200 group">
                    <i data-lucide="percent" class="w-5 h-5 mr-3"></i>
                    Promotions
                </a>

                <!-- Payments navigation link -->
                <a href="<%= request.getContextPath() %>/PaymentGetAllServlet"
                   class="flex items-center px-4 py-3 rounded-lg hover:bg-blue-700 hover:text-white transition duration-200 group">
                    <i data-lucide="credit-card" class="w-5 h-5 mr-3 group-hover:stroke-white"></i>
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
                
                <!-- Logout button at the bottom -->
                <a href="<%= request.getContextPath() %>/LogoutServlet"
                   class="flex items-center px-4 py-3 rounded-lg bg-red-600 hover:bg-red-700 text-white transition duration-200 group mt-auto">
                    <i data-lucide="log-out" class="w-5 h-5 mr-3"></i>
                    Logout
                </a>
            
        </aside>

        <!-- Main content area -->
        <main class="flex-1 p-8">
            <!-- Page header with search -->
            <div class="mb-6">
                <div class="flex justify-between items-center">
                    <h2 class="text-2xl font-bold">All Promotions</h2>
                    <!-- Search input -->
                    <input type="text" 
                           id="searchInput" 
                           placeholder="Search..." 
                           class="px-3 py-2 rounded bg-[#1e293b] border border-gray-600 text-white"/>
                </div>

                <!-- Add Promotion button -->
                <div class="mt-4 flex justify-end">
                    <button class="bg-green-600 hover:bg-green-700 text-white px-4 py-2 rounded shadow text-sm flex items-center" 
                            onclick="togglePromotionModal(true)">
                        <i data-lucide="plus" class="w-4 h-4 mr-1"></i> Add Promotion
                    </button>
                </div>
            </div>

            <!-- Promotion data table -->
            <div class="overflow-auto rounded-lg shadow border border-gray-700">
                <table class="min-w-full bg-[#1e293b] border-collapse">
                    <!-- Table header -->
                    <thead class="bg-[#334155] text-gray-300 text-left">
                        <tr>
                            <th class="px-6 py-4 font-semibold text-sm uppercase tracking-wider">Promo ID</th>
                            <th class="px-6 py-4 font-semibold text-sm uppercase tracking-wider">Promotion Code</th>
                            <th class="px-6 py-4 font-semibold text-sm uppercase tracking-wider">Description</th>
                            <th class="px-6 py-4 font-semibold text-sm uppercase tracking-wider">Discount Type</th>
                            <th class="px-6 py-4 font-semibold text-sm uppercase tracking-wider">Value</th>
                            <th class="px-6 py-4 font-semibold text-sm uppercase tracking-wider">Valid From</th>
                            <th class="px-6 py-4 font-semibold text-sm uppercase tracking-wider">Valid To</th>
                            <th class="px-6 py-4 font-semibold text-sm uppercase tracking-wider">Usage Limit</th>
                            <th class="px-6 py-4 font-semibold text-sm uppercase tracking-wider">Status</th>
                            <th class="px-6 py-4 font-semibold text-sm uppercase tracking-wider">Created At</th>
                            <th class="px-6 py-4 font-semibold text-sm uppercase tracking-wider">Actions</th>
                        </tr>
                    </thead>
                    
                    <!-- Table body with promotion data -->
                    <tbody id="promotionTable" class="text-white divide-y divide-gray-700 text-sm">
                        <c:forEach var="promotions" items="${allPromotions}" varStatus="status">
                            <tr class="${status.index % 2 == 0 ? 'bg-[#1e293b]' : 'bg-[#283548]'} hover:bg-[#475569] transition-colors duration-150">
                                <td class="px-6 py-4 whitespace-nowrap font-medium">${promotions.promo_id}</td>
                                <td class="px-6 py-4 whitespace-nowrap">${promotions.promo_code}</td>
                                <td class="px-6 py-4 whitespace-nowrap">${promotions.description}</td>
                                <td class="px-6 py-4 whitespace-nowrap">${promotions.discount_type}</td>
                                <td class="px-6 py-4 whitespace-nowrap">${promotions.value}</td>
                                <td class="px-6 py-4 whitespace-nowrap">${promotions.valid_from}</td>
                                <td class="px-6 py-4 whitespace-nowrap">${promotions.valid_to}</td>
                                <td class="px-6 py-4 whitespace-nowrap">${promotions.usage_limit}</td>
                                <td class="px-6 py-4 whitespace-nowrap">
                                    <span class="${promotions.status == 'Active' ? 'bg-green-500' : 'bg-red-500'} px-2 py-1 rounded-full text-xs font-medium">
                                        ${promotions.status}
                                    </span>
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap text-gray-300">${promotions.created_at}</td>
                                <td class="px-6 py-4 whitespace-nowrap">
                                    <div class="flex space-x-3">
                                        <!-- Update button -->
                                        <button type="button" 
                                                class="bg-yellow-500 text-white px-4 py-1.5 rounded-md hover:bg-yellow-600 transition-colors duration-150 shadow-sm flex items-center"
                                                onclick="openUpdateModal('${promotions.promo_id}', '${promotions.promo_code}', 
                                                '${promotions.description}', '${promotions.discount_type}', '${promotions.value}', 
                                                '${promotions.valid_from}', '${promotions.valid_to}', '${promotions.usage_limit}', 
                                                '${promotions.status}')">
                                            <i data-lucide="edit" class="w-4 h-4 mr-1"></i> Update
                                        </button>
                                        
                                        <!-- Delete form -->
                                        <form action="<%=request.getContextPath()%>/PromotionDeleteServlet" 
                                              method="post" 
                                              onsubmit="return confirm('Are you sure you want to delete this promotion?')">
                                            <input type="hidden" name="id" value="${promotions.promo_id}" />
                                            <button class="bg-red-600 hover:bg-red-700 text-white px-4 py-1.5 rounded-md transition-colors duration-150 shadow-sm flex items-center">
                                                <i data-lucide="trash-2" class="w-4 h-4 mr-1"></i> Delete
                                            </button>
                                        </form>
                                    </div>
                                </td>
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
         * Filters the promotion table based on search input
         * Searches across all columns of the table
         */
        function filterTable() {
            var input = document.getElementById("searchInput");
            var filter = input.value.toUpperCase();
            var rows = document.querySelectorAll("#promotionTable tr");

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
    </script>

    <!-- Add Promotion Modal -->
    <div id="promotionModal" class="fixed inset-0 bg-black bg-opacity-50 hidden items-center justify-center z-50">
        <div class="bg-[#0f172a] text-white p-6 rounded-xl w-full max-w-lg shadow-lg relative">
            <!-- Close button -->
            <button onclick="togglePromotionModal(false)" 
                    class="absolute top-3 right-4 text-2xl">&times;</button>
            
            <h2 class="text-2xl font-semibold mb-4 text-center">Add New Promotion</h2>

            <!-- Scrollable form container - added max height and overflow -->
            <div class="max-h-96 overflow-y-auto pr-2 custom-scrollbar">
                <!-- Add promotion form -->
                <form action="<%=request.getContextPath()%>/PromotionInsertServlet" 
                      method="post" 
                      id="addPromotionForm"
                      onsubmit="return validatePromotionForm('addPromotionForm')" 
                      class="space-y-4">
                    <!-- Promo Code input -->
                    <div>
                        <label class="block text-sm font-medium">Promotion Code</label>
                        <input type="text" 
                               name="promo_code" 
                               required 
                               class="w-full mt-1 px-4 py-2 rounded-lg bg-[#1e293b] text-white border border-gray-600 focus:outline-none focus:ring-2 focus:ring-purple-600" />
                    </div>
                    
                    <!-- Description input -->
                    <div>
                        <label class="block text-sm font-medium">Description</label>
                        <input type="text" 
                               name="description" 
                               required 
                               class="w-full mt-1 px-4 py-2 rounded-lg bg-[#1e293b] text-white border border-gray-600 focus:outline-none focus:ring-2 focus:ring-purple-600" />
                    </div>
                    
                    <!-- Discount Type input -->
                    <div>
                        <label class="block text-sm font-medium">Discount Type</label>
                        <select name="discount_type" 
                                required 
                                onchange="validateDiscountValue('addPromotionForm')"
                                class="w-full mt-1 px-4 py-2 rounded-lg bg-[#1e293b] text-white border border-gray-600 focus:outline-none focus:ring-2 focus:ring-purple-600">
                            <option value="Percentage">Percentage</option>
                            <option value="Fixed">Fixed</option>
                        </select>
                    </div>
                    
                    <!-- Value input -->
                    <div>
                        <label class="block text-sm font-medium">Value</label>
                        <input type="number" 
                               name="value" 
                               step="0.01"
                               required 
                               onchange="validateDiscountValue('addPromotionForm')"
                               class="w-full mt-1 px-4 py-2 rounded-lg bg-[#1e293b] text-white border border-gray-600 focus:outline-none focus:ring-2 focus:ring-purple-600" />
                    </div>
                    
                    <!-- Valid From input -->
                    <div>
                        <label class="block text-sm font-medium">Valid From</label>
                        <input type="date" 
                               name="valid_from" 
                               required 
                               class="w-full mt-1 px-4 py-2 rounded-lg bg-[#1e293b] text-white border border-gray-600 focus:outline-none focus:ring-2 focus:ring-purple-600" />
                    </div>
                    
                    <!-- Valid To input -->
                    <div>
                        <label class="block text-sm font-medium">Valid To</label>
                        <input type="date" 
                               name="valid_to" 
                               required 
                               class="w-full mt-1 px-4 py-2 rounded-lg bg-[#1e293b] text-white border border-gray-600 focus:outline-none focus:ring-2 focus:ring-purple-600" />
                    </div>
                    
                    <!-- Usage Limit input -->
                    <div>
                        <label class="block text-sm font-medium">Usage Limit</label>
                        <input type="number" 
                               name="usage_limit" 
                               required 
                               class="w-full mt-1 px-4 py-2 rounded-lg bg-[#1e293b] text-white border border-gray-600 focus:outline-none focus:ring-2 focus:ring-purple-600" />
                    </div>
                    
                    <!-- Status input -->
                    <div>
                        <label class="block text-sm font-medium">Status</label>
                        <select name="status" 
                                required 
                                class="w-full mt-1 px-4 py-2 rounded-lg bg-[#1e293b] text-white border border-gray-600 focus:outline-none focus:ring-2 focus:ring-purple-600">
                            <option value="Active">Active</option>
                            <option value="Inactive">Inactive</option>
                        </select>
                    </div>
                    
                    <!-- Submit button -->
                    <div class="pt-4">
                        <button type="submit" 
                                class="w-full bg-purple-600 hover:bg-purple-700 py-2 rounded-lg text-white font-semibold">
                            Submit
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Update Promotion Modal -->
    <div id="promotionUpdateModal" class="fixed inset-0 bg-black bg-opacity-50 hidden items-center justify-center z-50">
        <div class="bg-[#0f172a] text-white p-6 rounded-xl w-full max-w-lg shadow-lg relative">
            <!-- Close button -->
            <button onclick="togglePromotionUpdateModal(false)" 
                    class="absolute top-3 right-4 text-2xl">&times;</button>

            <h2 class="text-2xl font-semibold mb-4 text-center">Update Promotion</h2>

            <!-- Scrollable form container - added max height and overflow -->
            <div class="max-h-96 overflow-y-auto pr-2 custom-scrollbar">
                <!-- Update promotion form -->
                <form id="updatePromotionForm" 
                      action="<%=request.getContextPath()%>/PromotionUpdateServlet" 
                      method="post" 
                      onsubmit="return validatePromotionForm('updatePromotionForm')" 
                      class="space-y-4">
                    <!-- Promo ID (read-only) -->
                    <div>
                        <label class="block text-sm font-medium">Promo ID</label>
                        <input type="text" 
                               name="promo_id" 
                               id="update_promo_id" 
                               readonly
                               class="w-full mt-1 px-4 py-2 rounded-lg bg-gray-700 text-white border border-gray-600" />
                    </div>

                    <!-- Promo Code input -->
                    <div>
                        <label class="block text-sm font-medium">Promotion Code</label>
                        <input type="text" 
                               name="promo_code" 
                               id="update_promo_code" 
                               required
                               class="w-full mt-1 px-4 py-2 rounded-lg bg-[#1e293b] text-white border border-gray-600" />
                    </div>

                    <!-- Description input -->
                    <div>
                        <label class="block text-sm font-medium">Description</label>
                        <input type="text" 
                               name="description" 
                               id="update_description" 
                               required
                               class="w-full mt-1 px-4 py-2 rounded-lg bg-[#1e293b] text-white border border-gray-600" />
                    </div>

                    <!-- Discount Type input -->
                    <div>
                        <label class="block text-sm font-medium">Discount Type</label>
                        <select name="discount_type" 
                                id="update_discount_type" 
                                required
                                onchange="validateDiscountValue('updatePromotionForm')"
                                class="w-full mt-1 px-4 py-2 rounded-lg bg-[#1e293b] text-white border border-gray-600">
                            <option value="Percentage">Percentage</option>
                            <option value="Fixed">Fixed Amount</option>
                        </select>
                    </div>

                    <!-- Value input -->
                    <div>
                        <label class="block text-sm font-medium">Value</label>
                        <input type="number" 
                               name="value" 
                               id="update_value" 
                               step="0.01"
                               required
                               onchange="validateDiscountValue('updatePromotionForm')"
                               class="w-full mt-1 px-4 py-2 rounded-lg bg-[#1e293b] text-white border border-gray-600" />
                    </div>

                    <!-- Valid From input -->
                    <div>
                        <label class="block text-sm font-medium">Valid From</label>
                        <input type="date" 
                               name="valid_from" 
                               id="update_valid_from" 
                               required
                               class="w-full mt-1 px-4 py-2 rounded-lg bg-[#1e293b] text-white border border-gray-600" />
                    </div>

                    <!-- Valid To input -->
                    <div>
                        <label class="block text-sm font-medium">Valid To</label>
                        <input type="date" 
                               name="valid_to" 
                               id="update_valid_to" 
                               required
                               class="w-full mt-1 px-4 py-2 rounded-lg bg-[#1e293b] text-white border border-gray-600" />
                    </div>

                    <!-- Usage Limit input -->
                    <div>
                        <label class="block text-sm font-medium">Usage Limit</label>
                        <input type="number" 
                               name="usage_limit" 
                               id="update_usage_limit" 
                               required
                               class="w-full mt-1 px-4 py-2 rounded-lg bg-[#1e293b] text-white border border-gray-600" />
                    </div>

                    <!-- Status input -->
                    <div>
                        <label class="block text-sm font-medium">Status</label>
                        <select name="status" 
                                id="update_status" 
                                required
                                class="w-full mt-1 px-4 py-2 rounded-lg bg-[#1e293b] text-white border border-gray-600">
                            <option value="Active">Active</option>
                            <option value="Inactive">Inactive</option>
                        </select>
                    </div>

                    <!-- Update button -->
                    <div class="pt-4">
                        <button type="submit" 
                                class="w-full bg-purple-600 hover:bg-purple-700 py-2 rounded-lg text-white font-semibold">
                            Update
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Modal toggle functions -->
    <script>
        /**
         * Shows or hides the Add Promotion modal
         * @param {boolean} show - Whether to show or hide the modal
         */
        function togglePromotionModal(show) {
            const modal = document.getElementById('promotionModal');
            if (show) {
                modal.classList.remove('hidden');
                modal.classList.add('flex');
            } else {
                modal.classList.remove('flex');
                modal.classList.add('hidden');
            }
        }

        /**
         * Shows or hides the Update Promotion modal
         * @param {boolean} show - Whether to show or hide the modal
         */
        function togglePromotionUpdateModal(show) {
            const modal = document.getElementById('promotionUpdateModal');
            modal.classList.toggle('hidden', !show);
            modal.classList.toggle('flex', show);
        }

       
        function openUpdateModal(id, code, description, discountType, value, validFrom, validTo, usageLimit, status) {
            // Populate the form fields
            document.getElementById('update_promo_id').value = id;
            document.getElementById('update_promo_code').value = code;
            document.getElementById('update_description').value = description;
            document.getElementById('update_discount_type').value = discountType;
            document.getElementById('update_value').value = value;
            document.getElementById('update_valid_from').value = validFrom;
            document.getElementById('update_valid_to').value = validTo;
            document.getElementById('update_usage_limit').value = usageLimit;
            document.getElementById('update_status').value = status;

            togglePromotionUpdateModal(true);
        }
        
       
        function validatePromotionForm(formId) {
            const form = document.getElementById(formId);
            let isValid = true;
            
            // Get form fields
            const promoCode = form.querySelector(`[name="promo_code"]`);
            const description = form.querySelector(`[name="description"]`);
            const discountType = form.querySelector(`[name="discount_type"]`);
            const value = form.querySelector(`[name="value"]`);
            const validFrom = form.querySelector(`[name="valid_from"]`);
            const validTo = form.querySelector(`[name="valid_to"]`);
            const usageLimit = form.querySelector(`[name="usage_limit"]`);
            
            // Clear previous error messages
            const errorMessages = form.querySelectorAll('.error-message');
            errorMessages.forEach(el => el.remove());
            
            // Helper function to show error
            function showError(element, message) {
                isValid = false;
                const errorDiv = document.createElement('div');
                errorDiv.className = 'error-message';
                errorDiv.innerText = message;
                element.parentNode.appendChild(errorDiv);
                element.classList.add('border-red-500');
            }
            
            // Validate promo code (required, alphanumeric, max length 20)
            if (!promoCode.value.trim()) {
                showError(promoCode, 'Promotion code is required');
            } else if (!/^[A-Za-z0-9]+$/.test(promoCode.value)) {
                showError(promoCode, 'Promotion code must contain only letters and numbers');
            } else if (promoCode.value.length > 20) {
                showError(promoCode, 'Promotion code must be less than 20 characters');
            }
            
            // Validate description (required, max length 100)
            if (!description.value.trim()) {
                showError(description, 'Description is required');
            } else if (description.value.length > 100) {
                showError(description, 'Description must be less than 100 characters');
            }
            
            // Validate discount type (required)
            if (!discountType.value) {
                showError(discountType, 'Please select a discount type');
            }
            
            // Validate value (required, numeric, positive)
            if (!value.value.trim()) {
                showError(value, 'Value is required');
            } else if (isNaN(value.value) || parseFloat(value.value) <= 0) {
                showError(value, 'Value must be a positive number');
            } else if (discountType.value === 'Percentage' && parseFloat(value.value) > 100) {
                showError(value, 'Percentage discount cannot exceed 100%');
            }
            
            // Validate dates (required, validTo must be after validFrom)
            if (!validFrom.value) {
                showError(validFrom, 'Valid from date is required');
            }
            
            if (!validTo.value) {
                showError(validTo, 'Valid to date is required');
            } else if (new Date(validTo.value) <= new Date(validFrom.value)) {
                showError(validTo, 'Valid to date must be after valid from date');
            }
            
            // Check if promotion dates are in the past
            const today = new Date();
            today.setHours(0, 0, 0, 0);
            
            if (new Date(validFrom.value) < today) {
                showError(validFrom, 'Valid from date cannot be in the past');
            }
            
            // Validate usage limit (required, positive integer)
            if (!usageLimit.value.trim()) {
                showError(usageLimit, 'Usage limit is required');
            } else if (!Number.isInteger(Number(usageLimit.value)) || Number(usageLimit.value) <= 0) {
                showError(usageLimit, 'Usage limit must be a positive integer');
            }
            
            return isValid;
        }
        
        
        function validateDiscountValue(formId) {
            const form = document.getElementById(formId);
            const discountType = form.querySelector('[name="discount_type"]');
            const value = form.querySelector('[name="value"]');
            
            // Remove any existing error messages
            const existingError = value.parentNode.querySelector('.error-message');
            if (existingError) {
                existingError.remove();
            }
            value.classList.remove('border-red-500');
            
            // Validate percentage cannot exceed 100%
            if (discountType.value === 'Percentage' && parseFloat(value.value) > 100) {
                const errorDiv = document.createElement('div');
                errorDiv.className = 'error-message';
                errorDiv.innerText = 'Percentage discount cannot exceed 100%';
                value.parentNode.appendChild(errorDiv);
                value.classList.add('border-red-500');
            }
        }
    </script>

    <!-- Initialize Lucide icons -->
    <script>
        lucide.createIcons();
    </script>
</body>
</html>
