<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Profile</title>
    <!-- External libraries -->
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://unpkg.com/lucide@latest"></script>
    <!-- Custom scrollbar style -->
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
        
        /* Modal styling */
        .modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: rgba(0, 0, 0, 0.7);
            z-index: 50;
            justify-content: center;
            align-items: center;
        }
        
        .modal.show {
            display: flex;
            animation: fadeIn 0.3s ease-out;
        }
        
        .modal-content {
            animation: slideIn 0.3s ease-out;
        }
        
        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }
        
        @keyframes slideIn {
            from {
                transform: translateY(-20px);
                opacity: 0;
            }
            to {
                transform: translateY(0);
                opacity: 1;
            }
        }
        
        /* Form input focus effects */
        .form-input:focus {
            border-color: #8b5cf6;
            box-shadow: 0 0 0 3px rgba(139, 92, 246, 0.3);
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

                <!-- Payments navigation link -->
                <a href="<%= request.getContextPath() %>/PaymentGetAllServlet"
                   class="flex items-center px-4 py-3 rounded-lg hover:bg-blue-700 hover:text-white transition duration-200 group">
                    <i data-lucide="credit-card" class="w-5 h-5 mr-3 group-hover:stroke-white"></i>
                    Payments
                </a>
                
                <!-- Admin Profile navigation link (active) -->
                <a href="<%= request.getContextPath() %>/ProfileServlet"
                   class="flex items-center px-4 py-3 bg-blue-700 text-white rounded-lg transition duration-200 group">
                    <i data-lucide="shield" class="w-5 h-5 mr-3"></i>
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
            <!-- Page header -->
            <div class="mb-8">
                <h2 class="text-2xl font-bold">Admin Profile</h2>
                <p class="text-gray-400 mt-1">Manage your account details</p>
            </div>

            <!-- Profile Card -->
            <div class="bg-[#1e293b] rounded-lg shadow-lg p-6 max-w-2xl border border-gray-700">
                <!-- Profile Header with Avatar -->
                <div class="flex items-center mb-6">
                    <div class="bg-purple-600 h-16 w-16 rounded-full flex items-center justify-center text-2xl font-bold">
                        ${user.name.charAt(0)}
                    </div>
                    <div class="ml-4">
                        <h3 class="text-xl font-semibold">${user.name}</h3>
                        <p class="text-purple-400">Administrator</p>
                    </div>
                </div>
                
                <!-- Profile Information -->
                <div class="space-y-4 mb-6">
                    <div class="grid grid-cols-2 gap-4">
                        <div class="bg-[#283548] p-4 rounded-lg">
                            <div class="flex items-center mb-1">
                                <i data-lucide="hash" class="w-4 h-4 text-gray-400 mr-2"></i>
                                <p class="text-gray-400 text-sm">ID</p>
                            </div>
                            <p class="font-medium">${user.id}</p>
                        </div>
                        <div class="bg-[#283548] p-4 rounded-lg">
                            <div class="flex items-center mb-1">
                                <i data-lucide="user" class="w-4 h-4 text-gray-400 mr-2"></i>
                                <p class="text-gray-400 text-sm">Name</p>
                            </div>
                            <p class="font-medium">${user.name}</p>
                        </div>
                    </div>
                    
                    <div class="grid grid-cols-2 gap-4">
                        <div class="bg-[#283548] p-4 rounded-lg">
                            <div class="flex items-center mb-1">
                                <i data-lucide="mail" class="w-4 h-4 text-gray-400 mr-2"></i>
                                <p class="text-gray-400 text-sm">Email</p>
                            </div>
                            <p class="font-medium">${user.email}</p>
                        </div>
                        <div class="bg-[#283548] p-4 rounded-lg">
                            <div class="flex items-center mb-1">
                                <i data-lucide="phone" class="w-4 h-4 text-gray-400 mr-2"></i>
                                <p class="text-gray-400 text-sm">Phone</p>
                            </div>
                            <p class="font-medium">${user.phone}</p>
                        </div>
                    </div>
                    
                    <div class="bg-[#283548] p-4 rounded-lg">
                        <div class="flex items-center mb-1">
                            <i data-lucide="lock" class="w-4 h-4 text-gray-400 mr-2"></i>
                            <p class="text-gray-400 text-sm">Password</p>
                        </div>
                        <p class="font-medium">••••••••</p>
                    </div>
                </div>
                
                <!-- Action Buttons -->
                <div class="flex gap-4 mt-6">
                    <button id="openUpdateModal"
                       class="px-4 py-2 bg-purple-600 hover:bg-purple-700 rounded-lg transition duration-200 flex items-center">
                        <i data-lucide="edit" class="w-4 h-4 mr-2"></i>
                        Update Profile
                    </button>
                    
                    <form action="accountDeleteServlet" method="post" class="inline" onsubmit="return confirm('Are you sure you want to delete your account? This action cannot be undone.')">
                        <input type="hidden" name="id" value="${user.id}" />
                        <button type="submit" class="px-4 py-2 bg-red-600 hover:bg-red-700 rounded-lg transition duration-200 flex items-center">
                            <i data-lucide="trash-2" class="w-4 h-4 mr-2"></i>
                            Delete Account
                        </button>
                    </form>
                </div>
            </div>
        </main>
    </div>
    
    <!-- Update Profile Modal -->
    <div id="updateModal" class="modal">
        <div class="modal-content bg-[#1e293b] rounded-lg shadow-xl p-8 w-full max-w-md border border-gray-700 custom-scrollbar">
            <!-- Form header -->
            <div class="flex justify-between items-center mb-6">
                <h2 class="text-xl font-bold text-purple-400">Update Profile</h2>
                <button id="closeModal" class="text-gray-400 hover:text-white">
                    <i data-lucide="x" class="w-5 h-5"></i>
                </button>
            </div>
            
            <!-- User update form -->
            <form action="<%= request.getContextPath() %>/UpdateUserServlet" method="POST" class="space-y-5">
                <!-- User ID field (read-only) -->
                <div>
                    <label for="id" class="flex items-center text-sm font-medium text-gray-400 mb-1">
                        <i data-lucide="hash" class="w-4 h-4 mr-2"></i>
                        User ID
                    </label>
                    <input type="text" 
                           id="id" 
                           name="id" 
                           value="${user.id}" 
                           readonly 
                           class="w-full px-4 py-2 rounded bg-[#283548] border border-gray-600 text-gray-300 cursor-not-allowed">
                </div>
                
                <!-- Name field -->
                <div>
                    <label for="name" class="flex items-center text-sm font-medium text-gray-400 mb-1">
                        <i data-lucide="user" class="w-4 h-4 mr-2"></i>
                        Name
                    </label>
                    <input type="text" 
                           id="name" 
                           name="name" 
                           value="${user.name}" 
                           required 
                           class="form-input w-full px-4 py-2 rounded bg-[#283548] border border-gray-600 text-white focus:outline-none transition duration-200">
                </div>
                
                <!-- Email field -->
                <div>
                    <label for="email" class="flex items-center text-sm font-medium text-gray-400 mb-1">
                        <i data-lucide="mail" class="w-4 h-4 mr-2"></i>
                        Email
                    </label>
                    <input type="email" 
                           id="email" 
                           name="gmail" 
                           value="${user.email}" 
                           required 
                           class="form-input w-full px-4 py-2 rounded bg-[#283548] border border-gray-600 text-white focus:outline-none transition duration-200">
                </div>
                
                <!-- Password field with toggle visibility -->
                <div class="relative">
                    <label for="password" class="flex items-center text-sm font-medium text-gray-400 mb-1">
                        <i data-lucide="lock" class="w-4 h-4 mr-2"></i>
                        Password
                    </label>
                    <div class="relative">
                        <input type="password" 
                               id="password" 
                               name="password" 
                               value="${user.password}" 
                               required 
                               class="form-input w-full px-4 py-2 rounded bg-[#283548] border border-gray-600 text-white focus:outline-none transition duration-200">
                        <button type="button" 
                                id="togglePassword" 
                                class="absolute right-3 top-1/2 transform -translate-y-1/2 text-gray-400 hover:text-white">
                            <i data-lucide="eye" id="showPasswordIcon"></i>
                            <i data-lucide="eye-off" id="hidePasswordIcon" class="hidden"></i>
                        </button>
                    </div>
                </div>
                
                <!-- Phone field -->
                <div>
                    <label for="phone" class="flex items-center text-sm font-medium text-gray-400 mb-1">
                        <i data-lucide="phone" class="w-4 h-4 mr-2"></i>
                        Phone
                    </label>
                    <input type="text" 
                           id="phone" 
                           name="phone" 
                           value="${user.phone}" 
                           required 
                           class="form-input w-full px-4 py-2 rounded bg-[#283548] border border-gray-600 text-white focus:outline-none transition duration-200">
                </div>
                
                <!-- Submit button -->
                <button type="submit" 
                        class="w-full mt-6 py-2 px-4 bg-purple-600 hover:bg-purple-700 rounded-lg transition duration-200 font-medium flex items-center justify-center">
                    <i data-lucide="save" class="w-4 h-4 mr-2"></i>
                    Save Changes
                </button>
            </form>
        </div>
    </div>

    <!-- Initialize icons and handle modal functionality -->
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Initialize Lucide icons
            lucide.createIcons();
            
            // Modal functionality
            const modal = document.getElementById('updateModal');
            const openModalBtn = document.getElementById('openUpdateModal');
            const closeModalBtn = document.getElementById('closeModal');
            
            if (openModalBtn) {
                openModalBtn.addEventListener('click', function() {
                    modal.classList.add('show');
                    console.log('Modal opened');
                });
            }
            
            if (closeModalBtn) {
                closeModalBtn.addEventListener('click', function() {
                    modal.classList.remove('show');
                    console.log('Modal closed by button');
                });
            }
            
            // Close modal when clicking outside of it
            window.addEventListener('click', function(event) {
                if (event.target === modal) {
                    modal.classList.remove('show');
                    console.log('Modal closed by outside click');
                }
            });
            
            // Password visibility toggle
            const togglePassword = document.getElementById('togglePassword');
            const passwordInput = document.getElementById('password');
            const showIcon = document.getElementById('showPasswordIcon');
            const hideIcon = document.getElementById('hidePasswordIcon');
            
            if (togglePassword && passwordInput && showIcon && hideIcon) {
                togglePassword.addEventListener('click', function() {
                    if (passwordInput.type === 'password') {
                        passwordInput.type = 'text';
                        showIcon.parentNode.classList.add('hidden');
                        hideIcon.parentNode.classList.remove('hidden');
                        console.log('Password shown');
                    } else {
                        passwordInput.type = 'password';
                        showIcon.parentNode.classList.remove('hidden');
                        hideIcon.parentNode.classList.add('hidden');
                        console.log('Password hidden');
                    }
                });
            }
            
            console.log('Admin Profile page initialized');
        });
    </script>
</body>
</html>