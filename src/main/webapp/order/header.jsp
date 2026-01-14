<!-- Header -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header class="bg-gray-800 shadow-lg sticky top-0 z-50">
    <div class="container mx-auto px-4">
      <div class="flex justify-between items-center py-4">
        <div class="flex items-center">
          <span class="text-2xl font-bold text-blue-400">LaundryDash</span>
        </div>
        
        <nav class="hidden md:flex space-x-8">
          <a href="<%= request.getContextPath() %>/common/HowItWorks.jsp" class="font-medium hover:text-blue-400 transition-colors">How It Works</a>
          <a href="<%= request.getContextPath() %>/services" class="font-medium hover:text-blue-400 transition-colors">Services</a>
          <a href="<%=request.getContextPath()%>/common/AboutUs.jsp" class="font-medium hover:text-blue-400 transition-colors">About Us</a>
        </nav>
        
        <div class="hidden md:flex items-center space-x-4">
          <c:choose>
            <c:when test="${empty sessionScope.user}">
              <!-- User is not logged in -->
              <a href="<%=request.getContextPath()%>/common/login.jsp" class="font-medium hover:text-blue-400 transition-colors">Log In</a>
              <a href="<%=request.getContextPath()%>/common/Registration.jsp" class="bg-blue-800 text-gray-300 px-4 py-2 rounded-lg font-medium hover:bg-blue-900 transition-colors">
                Get Started
              </a>
            </c:when>
            <c:otherwise>
              <!-- User is logged in -->
              <div class="relative">
                <button id="profile-menu-button" class="flex items-center focus:outline-none">
                  <div class="w-10 h-10 rounded-full bg-gray-600 overflow-hidden">
                    <!-- Default profile image if user doesn't have one -->
                    <img src="<%=request.getContextPath()%>/img/homepage_avatar.jpg" alt="Profile" class="w-full h-full object-cover">
                  </div>
                </button>
                
                <!-- Profile dropdown menu -->
                <div id="profile-dropdown" class="hidden absolute right-0 mt-2 w-48 bg-gray-800 rounded-md shadow-lg py-1 z-50">
                
                  
                  <!-- Role-specific dashboard links -->
                  <c:choose>
                    <c:when test="${sessionScope.isAdmin}">
                      <a href="<%=request.getContextPath()%>/CustomerGetAllServlet" class="block px-4 py-2 text-sm text-gray-300 hover:bg-gray-700">Admin Dashboard</a>
                      <a href="<%=request.getContextPath()%>/ProfileServlet" class="block px-4 py-2 text-sm text-gray-300 hover:bg-gray-700">Your Profile</a>
                    </c:when>
                    <c:when test="${sessionScope.isManager}">
                      <a href="<%=request.getContextPath()%>/Services_DisplayServlet" class="block px-4 py-2 text-sm text-gray-300 hover:bg-gray-700">Manager Dashboard</a>
                    </c:when>
                    <c:when test="${sessionScope.isCustomer}">
                      <a href="<%=request.getContextPath()%>/orders" class="block px-4 py-2 text-sm text-gray-300 hover:bg-gray-700">My Dashboard</a>
                    </c:when>
                    <c:otherwise>
                      <a href="<%=request.getContextPath()%>/InventoryGetAllServlet" class="block px-4 py-2 text-sm text-gray-300 hover:bg-gray-700">Inventory Dashboard</a>
                    </c:otherwise>
                  </c:choose>
                  
                  <a href="<%=request.getContextPath()%>/LogoutServlet" class="block px-4 py-2 text-sm text-gray-300 hover:bg-gray-700">Sign out</a>
                </div>
              </div>
            </c:otherwise>
          </c:choose>
        </div>
        
        <button id="menu-toggle" class="md:hidden">
          <i data-lucide="menu" class="h-6 w-6"></i>
        </button>
      </div>
      
      <!-- Mobile menu -->
      <div id="mobile-menu" class="md:hidden py-4 border-t hidden">
        <nav class="flex flex-col space-y-4">
          <a href="<%= request.getContextPath() %>/HowItWorks.jsp" class="font-medium hover:text-blue-400 transition-colors">How It Works</a>
          <a href="<%= request.getContextPath() %>/services" class="font-medium hover:text-blue-400 transition-colors">Services</a>
          <a href="<%= request.getContextPath() %>/AboutUs.jsp" class="font-medium hover:text-blue-400 transition-colors">About Us</a>
          
          <div class="pt-4 border-t">
            <c:choose>
              <c:when test="${empty sessionScope.user}">
                <!-- Mobile login/register buttons -->
                <a href="<%=request.getContextPath()%>/common/login.jsp" class="font-medium hover:text-blue-400 transition-colors block mb-2">Log In</a>
                <a href="<%=request.getContextPath()%>/common/Registration.jsp" class="bg-blue-800 text-gray-300 px-4 py-2 rounded-lg font-medium hover:bg-blue-900 transition-colors text-center block">
                  Get Started
                </a>
              </c:when>
              <c:otherwise>
                <!-- Mobile profile section -->
                <div class="flex items-center mb-4">
                  <div class="w-8 h-8 rounded-full bg-gray-600 overflow-hidden mr-2">
                    <img src="<%=request.getContextPath()%>/img/homepage_avatar.jpg" alt="Profile" class="w-full h-full object-cover">
                  </div>
                  <span class="text-sm font-medium">${sessionScope.user.name}</span>
                </div>
                
                <!-- Mobile dashboard links -->
                <c:choose>
                  <c:when test="${sessionScope.isAdmin}">
                    <a href="<%=request.getContextPath()%>/CustomerGetAllServlet" class="block py-2 text-sm text-gray-300 hover:text-blue-400">Admin Dashboard</a>
                    <a href="<%=request.getContextPath()%>/admin/user-management.jsp" class="block py-2 text-sm text-gray-300 hover:text-blue-400">User Management</a>
                  </c:when>
                  <c:when test="${sessionScope.isManager}">
                    <a href="<%=request.getContextPath()%>/Services_DisplayServlet" class="block py-2 text-sm text-gray-300 hover:text-blue-400">Manager Dashboard</a>
                    <a href="<%=request.getContextPath()%>/manager/staff.jsp" class="block py-2 text-sm text-gray-300 hover:text-blue-400">Staff Management</a>
                  </c:when>
                  <c:when test="${sessionScope.isCustomer}">
                    <a href="<%=request.getContextPath()%>/orders" class="block py-2 text-sm text-gray-300 hover:text-blue-400">My Dashboard</a>
                    <a href="<%=request.getContextPath()%>/customer/orders.jsp" class="block py-2 text-sm text-gray-300 hover:text-blue-400">My Orders</a>
                  </c:when>
                  <c:otherwise>
                    <a href="<%=request.getContextPath()%>/InventoryGetAllServlet" class="block py-2 text-sm text-gray-300 hover:text-blue-400">Employee Dashboard</a>
                    <a href="<%=request.getContextPath()%>/employee/tasks.jsp" class="block py-2 text-sm text-gray-300 hover:text-blue-400">My Tasks</a>
                  </c:otherwise>
                </c:choose>
                
                <a href="<%=request.getContextPath()%>/LogoutServlet" class="block py-2 text-sm text-red-400 hover:text-red-300 mt-4">Sign out</a>
              </c:otherwise>
            </c:choose>
          </div>
        </nav>
      </div>
    </div>
  </header>