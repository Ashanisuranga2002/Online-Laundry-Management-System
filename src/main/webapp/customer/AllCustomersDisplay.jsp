<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.Collections" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>All Customers</title>
    <!-- External libraries -->
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://unpkg.com/lucide@latest"></script>
    <style>
        /* Validation styles */
        input:focus:invalid, select:focus:invalid {
            border-color: #f87171;
            box-shadow: 0 0 0 2px rgba(248, 113, 113, 0.2);
        }
        
        input:focus:valid, select:focus:valid {
            border-color: #34d399;
            box-shadow: 0 0 0 2px rgba(52, 211, 153, 0.2);
        }
        
        .border-red-500 {
            border-color: #ef4444 !important;
        }
        
        .border-green-500 {
            border-color: #10b981 !important;
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
                <!-- Customer navigation link (active) -->
                <a href="<%= request.getContextPath() %>/CustomerGetAllServlet"
                   class="flex items-center px-4 py-3 bg-blue-700 text-white rounded-lg transition duration-200 group">
                    <i data-lucide="users" class="w-5 h-5 mr-3"></i>
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
            
            <!-- Logout button at the very bottom -->
            <a href="<%= request.getContextPath() %>/LogoutServlet"
               class="flex items-center px-4 py-3 rounded-lg bg-red-600 hover:bg-red-700 text-white transition duration-200 group mt-6">
                <i data-lucide="log-out" class="w-5 h-5 mr-3"></i>
                Logout
            </a>
            
        </aside>

        <!-- Main content area -->
        <main class="flex-1 p-8">
            <!-- Page header with search -->
            <div class="mb-6">
                <div class="flex justify-between items-center">
                    <h2 class="text-2xl font-bold">All Customers</h2>
                    <!-- Search input -->
                    <input type="text" 
                           id="searchInput" 
                           placeholder="Search..." 
                           class="px-3 py-2 rounded bg-[#1e293b] border border-gray-600 text-white"/>
                </div>
                <!-- Add Customer button -->
                <div class="mt-4 flex justify-end">
                    <button class="bg-green-600 hover:bg-green-700 text-white px-4 py-2 rounded shadow text-sm flex items-center" 
                            onclick="toggleCustomerModal(true)">
                        <i data-lucide="plus" class="w-4 h-4 mr-1"></i> Add Customer
                    </button>
                </div>
            </div>

            <!-- Customer data table -->
            <div class="overflow-auto rounded-lg shadow border border-gray-700">
                <table class="min-w-full bg-[#1e293b] border-collapse">
                    <!-- Table header -->
                    <thead class="bg-[#334155] text-gray-300 text-left">
                        <tr>
                            <th class="px-6 py-4 font-semibold text-sm uppercase tracking-wider">Customer ID</th>
                            <th class="px-6 py-4 font-semibold text-sm uppercase tracking-wider">Customer Name</th>
                            <th class="px-6 py-4 font-semibold text-sm uppercase tracking-wider">Contact Number</th>
                            <th class="px-6 py-4 font-semibold text-sm uppercase tracking-wider">Email</th>
                            <th class="px-6 py-4 font-semibold text-sm uppercase tracking-wider">Address</th>
                            <th class="px-6 py-4 font-semibold text-sm uppercase tracking-wider">Created At</th>
                            <th class="px-6 py-4 font-semibold text-sm uppercase tracking-wider">Actions</th>
                        </tr>
                    </thead>
                    
                    <!-- Table body with customer data -->
                    <tbody id="customerTable" class="text-white divide-y divide-gray-700 text-sm">
                        <c:forEach var="customer" items="${allCustomer}" varStatus="status">
                            <tr class="${status.index % 2 == 0 ? 'bg-[#1e293b]' : 'bg-[#283548]'} hover:bg-[#475569] transition-colors duration-150">
                                <td class="px-6 py-4 whitespace-nowrap font-medium">${customer.customer_id}</td>
                                <td class="px-6 py-4 whitespace-nowrap">${customer.name}</td>
                                <td class="px-6 py-4 whitespace-nowrap">${customer.phone}</td>
                                <td class="px-6 py-4 whitespace-nowrap">${customer.email}</td>
                                <td class="px-6 py-4 whitespace-nowrap">${customer.address}</td>
                                
                                <td class="px-6 py-4 whitespace-nowrap text-gray-300">${customer.created_at}</td>
                                <td class="px-6 py-4 whitespace-nowrap">
                                    <div class="flex space-x-3">
                                        <!-- Update button -->
                                        <button type="button" 
                                                class="bg-yellow-500 text-white px-4 py-1.5 rounded-md hover:bg-yellow-600 transition-colors duration-150 shadow-sm flex items-center"
                                                onclick="openUpdateModal('${customer.customer_id}', '${customer.name}', '${customer.phone}', '${customer.email}', '${customer.address}', '${customer.password}')">
                                            <i data-lucide="edit" class="w-4 h-4 mr-1"></i> Update
                                        </button>
                                        <!-- Delete form -->
                                        <form action="<%=request.getContextPath()%>/CustomerDeleteServlet" 
                                              method="post" 
                                              onsubmit="return confirm('Are you sure you want to delete this customer?')">
                                            <input type="hidden" name="id" value="${customer.customer_id}" />
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

    <!-- Add Customer Modal -->
    <div id="customerModal" class="fixed inset-0 bg-black bg-opacity-50 hidden items-center justify-center z-50">
        <div class="bg-[#0f172a] text-white p-6 rounded-xl w-full max-w-lg shadow-lg relative">
            <!-- Close button -->
            <button onclick="toggleCustomerModal(false)" 
                    class="absolute top-3 right-4 text-2xl">&times;</button>
            
            <h2 class="text-2xl font-semibold mb-4 text-center">Add New Customer</h2>

            <!-- Add customer form -->
            <form action="<%=request.getContextPath()%>/CustomerInsertServlet" method="post" class="space-y-4" id="addCustomerForm" novalidate>
                <!-- Name input -->
                <div>
                    <label class="block text-sm font-medium">Name</label>
                    <input type="text" 
                           name="name" 
                           required 
                           pattern="^[A-Za-z\s]{3,50}$"
                           class="w-full mt-1 px-4 py-2 rounded-lg bg-[#1e293b] text-white border border-gray-600 focus:outline-none focus:ring-2 focus:ring-purple-600 peer" />
                    <p class="mt-1 text-sm text-red-500 hidden">
                        Please enter a valid name (3-50 characters, letters only).
                    </p>
                </div>
                
                <!-- Phone input -->
                <div>
                    <label class="block text-sm font-medium">Phone</label>
                    <input type="text" 
                           name="phone" 
                           required 
                           pattern="^[0-9]{10}$"
                           class="w-full mt-1 px-4 py-2 rounded-lg bg-[#1e293b] text-white border border-gray-600 focus:outline-none focus:ring-2 focus:ring-purple-600 peer" />
                    <p class="mt-1 text-sm text-red-500 hidden">
                        Please enter a valid 10-digit phone number.
                    </p>
                </div>
                
                <!-- Email input -->
                <div>
                    <label class="block text-sm font-medium">Email</label>
                    <input type="email" 
                           name="email" 
                           required 
                           pattern="^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$"
                           class="w-full mt-1 px-4 py-2 rounded-lg bg-[#1e293b] text-white border border-gray-600 focus:outline-none focus:ring-2 focus:ring-purple-600 peer" />
                    <p class="mt-1 text-sm text-red-500 hidden">
                        Please enter a valid email address.
                    </p>
                </div>
                
                <!-- Address input -->
                <div>
                    <label class="block text-sm font-medium">Address</label>
                    <input type="text" 
                           name="address" 
                           required 
                           minlength="5"
                           maxlength="100"
                           class="w-full mt-1 px-4 py-2 rounded-lg bg-[#1e293b] text-white border border-gray-600 focus:outline-none focus:ring-2 focus:ring-purple-600 peer" />
                    <p class="mt-1 text-sm text-red-500 hidden">
                        Please enter a valid address (5-100 characters).
                    </p>
                </div>
                
                <!-- Password Input -->
                <div class="relative">
                    <label class="block text-sm font-medium">Password</label>
                    <input type="password" 
                           id="password"
                           name="password" 
                           required 
                           pattern="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d@$!%*#?&]{8,}$"
                           class="w-full mt-1 px-4 py-2 rounded-lg bg-[#1e293b] text-white border border-gray-600 focus:outline-none focus:ring-2 focus:ring-purple-600 peer" />
                    <p class="mt-1 text-sm text-red-500 hidden">
                        Password must be at least 8 characters with at least one letter and one number.
                    </p>
                    <button type="button" 
                            class="absolute right-2 top-[60%] transform -translate-y-1/2 text-gray-400 hover:text-white"
                            onclick="togglePasswordVisibility('password')">
                        <i data-lucide="eye" class="w-5 h-5"></i>
                    </button>
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

    <!-- Update Customer Modal -->
    <div id="customerUpdateModal" class="fixed inset-0 bg-black bg-opacity-50 hidden items-center justify-center z-50">
        <div class="bg-[#0f172a] text-white p-6 rounded-xl w-full max-w-lg shadow-lg relative">
            <!-- Close button -->
            <button onclick="toggleCustomerUpdateModal(false)" 
                    class="absolute top-3 right-4 text-2xl">&times;</button>

            <h2 class="text-2xl font-semibold mb-4 text-center">Update Customer</h2>

            <!-- Update customer form -->
            <form id="updateCustomerForm" action="<%=request.getContextPath()%>/CustomerUpdateServlet" method="post" class="space-y-4" novalidate>
                <!-- Customer ID (read-only) -->
                <div>
                    <label class="block text-sm font-medium">Customer ID</label>
                    <input type="text" 
                           name="customer_id" 
                           id="update_customer_id" 
                           readonly
                           class="w-full mt-1 px-4 py-2 rounded-lg bg-gray-700 text-white border border-gray-600" />
                </div>

                <!-- Name input -->
                <div>
                    <label class="block text-sm font-medium">Name</label>
                    <input type="text" 
                           name="name" 
                           id="update_name" 
                           required
                           pattern="^[A-Za-z\s]{3,50}$"
                           class="w-full mt-1 px-4 py-2 rounded-lg bg-[#1e293b] text-white border border-gray-600 peer" />
                    <p class="mt-1 text-sm text-red-500 hidden">
                        Please enter a valid name (3-50 characters, letters only).
                    </p>
                </div>

                <!-- Phone input -->
                <div>
                    <label class="block text-sm font-medium">Phone</label>
                    <input type="text" 
                           name="phone" 
                           id="update_phone" 
                           required
                           pattern="^[0-9]{10}$"
                           class="w-full mt-1 px-4 py-2 rounded-lg bg-[#1e293b] text-white border border-gray-600 peer" />
                    <p class="mt-1 text-sm text-red-500 hidden">
                        Please enter a valid 10-digit phone number.
                    </p>
                </div>

                <!-- Email input -->
                <div>
                    <label class="block text-sm font-medium">Email</label>
                    <input type="email" 
                           name="email" 
                           id="update_email" 
                           required
                           pattern="^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$"
                           class="w-full mt-1 px-4 py-2 rounded-lg bg-[#1e293b] text-white border border-gray-600 peer" />
                    <p class="mt-1 text-sm text-red-500 hidden">
                        Please enter a valid email address.
                    </p>
                </div>

                <!-- Address input -->
                <div>
                    <label class="block text-sm font-medium">Address</label>
                    <input type="text" 
                           name="address" 
                           id="update_address" 
                           required
                           minlength="5"
                           maxlength="100"
                           class="w-full mt-1 px-4 py-2 rounded-lg bg-[#1e293b] text-white border border-gray-600 peer" />
                    <p class="mt-1 text-sm text-red-500 hidden">
                        Please enter a valid address (5-100 characters).
                    </p>
                </div>
                
                <!-- Password Input -->
                <div class="relative">
                    <label class="block text-sm font-medium">Password</label>
                    <input type="password" 
                           name="password" 
                           id="update_password" 
                           required
                           pattern="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d@$!%*#?&]{8,}$"
                           class="w-full mt-1 px-4 py-2 rounded-lg bg-[#1e293b] text-white border border-gray-600 peer" />
                    <p class="mt-1 text-sm text-red-500 hidden">
                        Password must be at least 8 characters with at least one letter and one number.
                    </p>
                    <button type="button" 
                            class="absolute right-2 top-[60%] transform -translate-y-1/2 text-gray-400 hover:text-white"
                            onclick="togglePasswordVisibility('update_password')">
                        <i data-lucide="eye" class="w-5 h-5"></i>
                    </button>
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

    <!-- Search functionality script -->
    <script>
        /**
         * Filters the customer table based on search input
         * Searches across all columns of the table
         */
        function filterTable() {
            var input = document.getElementById("searchInput");
            var filter = input.value.toUpperCase();
            var rows = document.querySelectorAll("#customerTable tr");

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

    <!-- Modal toggle functions -->
    <script>
        /**
         * Shows or hides the Add Customer modal
         * @param {boolean} show - Whether to show or hide the modal
         */
        function toggleCustomerModal(show) {
            const modal = document.getElementById('customerModal');
            if (show) {
                modal.classList.remove('hidden');
                modal.classList.add('flex');
            } else {
                modal.classList.remove('flex');
                modal.classList.add('hidden');
            }
        }

        /**
         * Shows or hides the Update Customer modal
         * @param {boolean} show - Whether to show or hide the modal
         */
        function toggleCustomerUpdateModal(show) {
            const modal = document.getElementById('customerUpdateModal');
            modal.classList.toggle('hidden', !show);
            modal.classList.toggle('flex', show);
        }

        /**
         * Toggles password visibility between text and password type
         * @param {string} inputId - The ID of the password input field
         */
        function togglePasswordVisibility(inputId) {
            const passwordInput = document.getElementById(inputId);
            const eyeIcon = passwordInput.nextElementSibling.querySelector('i');
            
            if (passwordInput.type === "password") {
                passwordInput.type = "text";
                eyeIcon.setAttribute('data-lucide', 'eye-off');
            } else {
                passwordInput.type = "password";
                eyeIcon.setAttribute('data-lucide', 'eye');
            }
            
            // Refresh the icon
            lucide.createIcons({
                icons: {
                    'eye': eyeIcon.getAttribute('data-lucide') === 'eye',
                    'eye-off': eyeIcon.getAttribute('data-lucide') === 'eye-off'
                },
                elements: [eyeIcon]
            });
            
            // Maintain focus on the password field
            passwordInput.focus();
        }
      
        /**
         * Opens the update modal and populates it with customer data
         */
        function openUpdateModal(id, name, phone, email, address, password) {
            // Populate the form fields
            document.getElementById('update_customer_id').value = id;
            document.getElementById('update_name').value = name;
            document.getElementById('update_phone').value = phone;
            document.getElementById('update_email').value = email;
            document.getElementById('update_address').value = address;
            document.getElementById('update_password').value = password;
            
            // Show the modal
            toggleCustomerUpdateModal(true);
        }
    </script>

    <!-- Form validation script -->
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Get both forms
            const addForm = document.getElementById('addCustomerForm');
            const updateForm = document.getElementById('updateCustomerForm');
            
            // Validation patterns
            const patterns = {
                name: /^[A-Za-z\s]{3,50}$/,
                phone: /^[0-9]{10}$/,
                email: /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/,
                password: /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d@$!%*#?&]{8,}$/
            };
            
            // Add validation to Add Customer form
            if (addForm) {
                addForm.addEventListener('submit', function(e) {
                    if (!validateForm(this)) {
                        e.preventDefault();
                    }
                });
            }
            
            // Add validation to Update Customer form
            if (updateForm) {
                updateForm.addEventListener('submit', function(e) {
                    if (!validateForm(this)) {
                        e.preventDefault();
                    }
                });
            }
            
            // Validate form function
            function validateForm(form) {
                let isValid = true;
                const inputs = form.querySelectorAll('input:not([type="hidden"]), select');
                
                inputs.forEach(input => {
                    // Reset validation state
                    input.classList.remove('border-red-500', 'border-green-500');
                    const errorMsg = input.nextElementSibling;
                    
                    // Skip readonly fields
                    if (input.hasAttribute('readonly')) return;
                    
                    // Required validation
                    if (input.hasAttribute('required') && !input.value.trim()) {
                        const fieldName = getFieldName(input);
                        showError(input, errorMsg, fieldName + " is required");
                        isValid = false;
                        return;
                    }
                    
                    // Pattern validation for specific fields
                    if (input.value.trim()) {
                        switch(input.name) {
                            case 'name':
                                if (!patterns.name.test(input.value)) {
                                    showError(input, errorMsg, 'Name must be 3-50 characters (letters only)');
                                    isValid = false;
                                } else {
                                    showSuccess(input);
                                }
                                break;
                            case 'phone':
                                if (!patterns.phone.test(input.value)) {
                                    showError(input, errorMsg, 'Phone number must be 10 digits');
                                    isValid = false;
                                } else {
                                    showSuccess(input);
                                }
                                break;
                            case 'email':
                                if (!patterns.email.test(input.value)) {
                                    showError(input, errorMsg, 'Please enter a valid email address');
                                    isValid = false;
                                } else {
                                    showSuccess(input);
                                }
                                break;
                            case 'address':
                                if (input.value.length < 5 || input.value.length > 100) {
                                    showError(input, errorMsg, 'Address must be between 5-100 characters');
                                    isValid = false;
                                } else {
                                    showSuccess(input);
                                }
                                break;
                            case 'password':
                                if (!patterns.password.test(input.value)) {
                                    showError(input, errorMsg, 'Password must be at least 8 characters with letters and numbers');
                                    isValid = false;
                                } else {
                                    showSuccess(input);
                                }
                                break;
                            default:
                                showSuccess(input);
                        }
                    }
                });
                
                return isValid;
            }
            
            // Helper functions
            function showError(input, errorElement, message) {
                input.classList.add('border-red-500');
                input.classList.remove('border-green-500');
                
                // Create error message if it doesn't exist
                if (!errorElement || !errorElement.classList.contains('text-red-500')) {
                    errorElement = document.createElement('p');
                    errorElement.className = 'mt-1 text-sm text-red-500';
                    input.parentNode.insertBefore(errorElement, input.nextSibling);
                }
                
                errorElement.textContent = message;
                errorElement.classList.remove('hidden');
            }
            
            function showSuccess(input) {
                input.classList.remove('border-red-500');
                input.classList.add('border-green-500');
                
                // Hide error message if it exists
                const errorElement = input.nextElementSibling;
                if (errorElement && errorElement.classList.contains('text-red-500')) {
                    errorElement.classList.add('hidden');
                }
            }
            
            function getFieldName(input) {
                return input.name.charAt(0).toUpperCase() + input.name.slice(1).replace('_', ' ');
            }
            
            // Add real-time validation for better user experience
            const allInputs = document.querySelectorAll('input:not([type="hidden"]), select');
            allInputs.forEach(input => {
                input.addEventListener('blur', function() {
                    // Skip validation for readonly fields
                    if (this.hasAttribute('readonly')) return;
                    
                    const errorMsg = this.nextElementSibling;
                    
                    // Required validation
                    if (this.hasAttribute('required') && !this.value.trim()) {
                        const fieldName = getFieldName(this);
                        showError(this, errorMsg, fieldName + " is required");
                        return;
                    }
                    
                    // Pattern validation
                    if (this.value.trim()) {
                        switch(this.name) {
                            case 'name':
                                if (!patterns.name.test(this.value)) {
                                    showError(this, errorMsg, 'Name must be 3-50 characters (letters only)');
                                } else {
                                    showSuccess(this);
                                }
                                break;
                            case 'phone':
                                if (!patterns.phone.test(this.value)) {
                                    showError(this, errorMsg, 'Phone number must be 10 digits');
                                } else {
                                    showSuccess(this);
                                }
                                break;
                            case 'email':
                                if (!patterns.email.test(this.value)) {
                                    showError(this, errorMsg, 'Please enter a valid email address');
                                } else {
                                    showSuccess(this);
                                }
                                break;
                            case 'address':
                                if (this.value.length < 5 || this.value.length > 100) {
                                    showError(this, errorMsg, 'Address must be between 5-100 characters');
                                } else {
                                    showSuccess(this);
                                }
                                break;
                            case 'password':
                                if (!patterns.password.test(this.value)) {
                                    showError(this, errorMsg, 'Password must be at least 8 characters with letters and numbers');
                                } else {
                                    showSuccess(this);
                                }
                                break;
                            default:
                                showSuccess(this);
                        }
                    }
                });
            });
        });
    </script>

    <!-- Initialize Lucide icons -->
    <script>
        lucide.createIcons();
    </script>
</body>
</html>
