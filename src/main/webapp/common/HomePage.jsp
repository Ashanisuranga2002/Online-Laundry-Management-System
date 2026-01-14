<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>LaundryDash - Laundry Service</title>
  <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
  <script src="https://unpkg.com/lucide@latest"></script>
  <style>
    /* Animation styles */
    .invisible {
      opacity: 0;
      transform: translateY(20px);
      visibility: hidden;
    }

    .fade-in-section {
      transition: opacity 0.8s ease-out, transform 0.8s ease-out, visibility 0.8s;
    }

    .fade-in-section.fade-in-active {
      opacity: 1;
      transform: translateY(0);
      visibility: visible;
    }

    /* Hero animation */
    .animate-fade-in {
      animation: fadeIn 1s ease-out forwards;
    }

    .delay-300 {
      animation-delay: 300ms;
    }

    .delay-600 {
      animation-delay: 600ms;
    }

    @keyframes fadeIn {
      from {
        opacity: 0;
        transform: translateY(20px);
      }
      to {
        opacity: 1;
        transform: translateY(0);
      }
    }

    /* Dark theme overrides */
    body {
      background-color: #1a202c; /* Tailwind gray-900 */
      color: #e2e8f0; /* Tailwind gray-300 */
    }

    header {
      background-color: #2d3748; /* Tailwind gray-800 */
      box-shadow: 0 1px 3px rgba(0,0,0,0.7);
    }

    a {
      color: #63b3ed; /* Tailwind blue-400 */
    }
    a:hover {
      color: #4299e1; /* Tailwind blue-500 */
    }

    .bg-white {
      background-color: #2d3748 !important; /* Tailwind gray-800 */
    }
    .bg-blue-50 {
      background-color: #2a4365 !important; /* Tailwind blue-900 */
    }
    .bg-blue-600 {
      background-color: #2c5282 !important; /* Tailwind blue-800 */
    }
    .text-gray-600 {
      color: #a0aec0 !important; /* Tailwind gray-400 */
    }
    .text-gray-700 {
      color: #cbd5e0 !important; /* Tailwind gray-300 */
    }
    .text-gray-500 {
      color: #718096 !important; /* Tailwind gray-500 */
    }
    .border-gray-200 {
      border-color: #4a5568 !important; /* Tailwind gray-600 */
    }
    .border-gray-300 {
      border-color: #4a5568 !important; /* Tailwind gray-600 */
    }
    .shadow-sm {
      box-shadow: 0 1px 2px rgba(0,0,0,0.7) !important;
    }
    .shadow-md {
      box-shadow: 0 4px 6px rgba(0,0,0,0.7) !important;
    }
    button.bg-blue-600 {
      background-color: #2c5282 !important;
      color: #e2e8f0 !important;
    }
    button.bg-blue-600:hover {
      background-color: #2a4365 !important;
    }
    button.border-white {
      border-color: #e2e8f0 !important;
      color: #e2e8f0 !important;
    }
    button.border-white:hover {
      background-color: #2a4365 !important;
    }
    /* Adjust Lucide icon colors for dark theme */
    svg {
      stroke: #63b3ed !important;
    }
    .bg-blue-100 {
      background-color: #2c5282 !important; /* Darker blue for icon backgrounds */
    }
    .bg-gray-50 {
      background-color: #1a202c !important; /* Dark background for footer */
    }
    .bg-gray-200 {
      background-color: #4a5568 !important; /* Darker gray for avatar placeholders */
    }
  </style>
</head>
<body class="font-sans bg-gray-900 text-gray-300">
  <!-- Header -->
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

  <!-- Hero Section -->
  <section class="bg-gradient-to-b from-gray-800 to-gray-900 py-20">
    <div class="container mx-auto px-4">
      <div class="flex flex-col lg:flex-row items-center">
        <div class="lg:w-1/2 mb-10 lg:mb-0 animate-fade-in">
          <h1 class="text-4xl md:text-5xl font-bold mb-6">
            Laundry Day, <span class="text-blue-400">Simplified</span>
          </h1>
          <p class="text-xl text-gray-400 mb-8">
            Schedule pickups, track your laundry in real-time, and get fresh clothes delivered to your door. No more wasted weekends.
          </p>
          <div class="flex flex-wrap gap-4">
            <a href="<%= request.getContextPath() %>/services" class="bg-blue-800 text-gray-300 px-6 py-3 rounded-lg font-medium hover:bg-blue-900 transition-colors">
             Place your Order now
            </a>
            <a href="<%= request.getContextPath() %>/common/HowItWorks.jsp" class="border border-gray-600 px-6 py-3 rounded-lg font-medium hover:bg-gray-700 transition-colors">
              See How It Works
            </a>
          </div>
          <div class="mt-8 flex items-center">
            <div class="flex -space-x-2">
              <img src="<%=request.getContextPath()%>/img/user_avatar1.jpeg" alt="User avatar" class="w-10 h-10 rounded-full border-2 border-gray-800 object-cover">
              <img src="<%=request.getContextPath()%>/img/user_avatar2.jpeg" alt="User avatar" class="w-10 h-10 rounded-full border-2 border-gray-800 object-cover">
              <img src="<%=request.getContextPath()%>/img/user_avatar4.jpeg" alt="User avatar" class="w-10 h-10 rounded-full border-2 border-gray-800 object-cover">
            </div>
            <div class="ml-4">
              <p class="font-medium">Trusted by 10,000+ customers</p>
              <div class="flex text-yellow-400">&#9733;&#9733;&#9733;&#9733;&#9733;</div>
            </div>
          </div>
        </div>
        
        <div class="lg:w-1/2 animate-fade-in delay-600">
          <div class="relative">
            <div class="bg-gray-800 rounded-xl shadow-xl p-4 md:p-8">
              <img src="<%=request.getContextPath()%>/img/washing_machine1.jpg" alt="Laundry service dashboard" class="rounded-lg">
              <div class="absolute -bottom-6 -right-6 bg-blue-800 text-gray-300 p-4 rounded-lg shadow-lg">
                <p class="font-bold">4,000+</p>
                <p class="text-sm">Happy Customers</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- Features Section -->
  <section class="py-20">
    <div class="container mx-auto px-4">
      <div class="text-center mb-16 invisible fade-in-section">
        <h2 class="text-3xl md:text-4xl font-bold mb-4">How LaundryDash Works</h2>
        <p class="text-xl text-gray-400 max-w-3xl mx-auto">
          Our simple process makes laundry day a breeze
        </p>
      </div>

      <div class="grid md:grid-cols-2 lg:grid-cols-4 gap-8">
        <div class="bg-gray-800 p-6 rounded-xl shadow-sm hover:shadow-md transition-shadow invisible fade-in-section">
          <div class="bg-blue-800 p-3 rounded-full w-12 h-12 flex items-center justify-center mb-4">
            <i data-lucide="package" class="text-blue-400"></i>
          </div>
          <h3 class="font-bold text-xl mb-2">Schedule Pickup</h3>
          <p class="text-gray-400">
            Book a convenient time for us to collect your laundry through our app or website.
          </p>
        </div>

        <div class="bg-gray-800 p-6 rounded-xl shadow-sm hover:shadow-md transition-shadow invisible fade-in-section">
          <div class="bg-blue-800 p-3 rounded-full w-12 h-12 flex items-center justify-center mb-4">
            <i data-lucide="shirt" class="text-blue-400"></i>
          </div>
          <h3 class="font-bold text-xl mb-2">Professional Cleaning</h3>
          <p class="text-gray-400">
            Our experts clean and care for your clothes using eco-friendly products.
          </p>
        </div>

        <div class="bg-gray-800 p-6 rounded-xl shadow-sm hover:shadow-md transition-shadow invisible fade-in-section">
          <div class="bg-blue-800 p-3 rounded-full w-12 h-12 flex items-center justify-center mb-4">
            <i data-lucide="clock" class="text-blue-400"></i>
          </div>
          <h3 class="font-bold text-xl mb-2">Track In Real-Time</h3>
          <p class="text-gray-400">
            Monitor the status of your order from pickup to delivery, all in real-time.
          </p>
        </div>

        <div class="bg-gray-800 p-6 rounded-xl shadow-sm hover:shadow-md transition-shadow invisible fade-in-section">
          <div class="bg-blue-800 p-3 rounded-full w-12 h-12 flex items-center justify-center mb-4">
            <i data-lucide="smile" class="text-blue-400"></i>
          </div>
          <h3 class="font-bold text-xl mb-2">Fresh Delivery</h3>
          <p class="text-gray-400">
            Receive your clean, fresh laundry back at your doorstep when you want it.
          </p>
        </div>
      </div>
    </div>
  </section>

  <!-- Testimonials Section -->
  <section class="bg-blue-900 py-20">
    <div class="container mx-auto px-4">
      <div class="text-center mb-16 invisible fade-in-section">
        <h2 class="text-3xl md:text-4xl font-bold mb-4">What Our Customers Say</h2>
        <p class="text-xl text-gray-400 max-w-3xl mx-auto">
          Join thousands of satisfied customers who have simplified their laundry routine
        </p>
      </div>

      <div class="grid md:grid-cols-2 lg:grid-cols-3 gap-8">
        <div class="bg-gray-800 p-6 rounded-xl shadow-sm invisible fade-in-section">
          <div class="flex text-yellow-400">&#9733;&#9733;&#9733;&#9733;&#9733;</div>
          
          <p class="text-gray-300 mb-6">
            "LaundryDash has completely changed how I handle laundry. The pickup and delivery are always on time, and my clothes come back perfectly cleaned and folded."
          </p>
          <div class="flex items-center">
            <div class="bg-gray-600 rounded-full w-12 h-12 mr-4">
            <img src="<%=request.getContextPath()%>/img/pexels-heitorverdifotos-2169434.jpg" alt="Sarah Johnson" class="w-full h-full object-cover">
            </div>
            <div>
              <p class="font-bold">Sarah Johnson</p>
              <p class="text-gray-500 text-sm">Busy Professional</p>
            </div>
          </div>
        </div>

        <div class="bg-gray-800 p-6 rounded-xl shadow-sm invisible fade-in-section">
          <div class="flex text-yellow-400">&#9733;&#9733;&#9733;&#9733;&#9733;</div>

          <p class="text-gray-300 mb-6">
            "As a family of five, laundry used to take up our entire weekend. With LaundryDash, we've got our weekends back and our clothes have never looked better!"
          </p>
          <div class="flex items-center">
            <div class="bg-gray-600 rounded-full w-12 h-12 mr-4">
            <img src="<%=request.getContextPath()%>/img/pexels-lara-jameson-9363194.jpg" alt="Micheal Chen" class="w-full h-full object-cover">
            </div>
            <div>
              <p class="font-bold">Michael Chen</p>
              <p class="text-gray-500 text-sm">Parent</p>
            </div>
          </div>
        </div>

        <div class="bg-gray-800 p-6 rounded-xl shadow-sm invisible fade-in-section">
          <div class="flex text-yellow-400">&#9733;&#9733;&#9733;&#9733;&#9733;</div>

          <p class="text-gray-300 mb-6">
            "The app makes it so easy to schedule pickups and the tracking feature is a game-changer. I always know exactly when my laundry will arrive."
          </p>
          <div class="flex items-center">
            <div class="bg-gray-600 rounded-full w-12 h-12 mr-4">
             <img src="<%=request.getContextPath()%>/img/pexels-sebastian-luna-736234668-31610834.jpg" alt="Micheal Chen" class="w-full h-full object-cover">
            </div>
            <div>
              <p class="font-bold">Alex Rivera</p>
              <p class="text-gray-500 text-sm">College Student</p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- CTA Section -->
  <section class="py-20">
    <div class="container mx-auto px-4">
      <div class="bg-blue-800 rounded-2xl p-8 md:p-12 text-gray-300 invisible fade-in-section">
        <div class="max-w-3xl mx-auto text-center">
          <h2 class="text-3xl md:text-4xl font-bold mb-6">Ready to simplify your laundry routine?</h2>
          <p class="text-xl mb-8 opacity-90">
            Join thousands of customers who've reclaimed their time with LaundryDash.
          </p>
          <div class="flex flex-wrap justify-center gap-4">
            <button class="px-8 py-3 bg-gray-900 text-blue-400 font-bold rounded-lg hover:bg-gray-800 transition-colors">
              Get Started Now
            </button>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- Footer -->
  <footer class="bg-gray-900 border-t border-gray-600 py-12">
    <div class="container mx-auto px-4">
      <div class="grid md:grid-cols-2 lg:grid-cols-4 gap-8">
        <div>
          <h3 class="font-bold text-lg mb-4">LaundryDash</h3>
          <p class="text-gray-400 mb-4">
            Making laundry day a thing of the past since 2020.
          </p>
          <div class="flex space-x-4">
            <a href="https://www.twitter.com" class="text-gray-500 hover:text-blue-400">
              <span class="sr-only">Twitter</span>
              <i data-lucide="twitter" class="h-6 w-6"></i>
            </a>
            <a href="https://www.facebook.com" class="text-gray-500 hover:text-blue-400">
              <span class="sr-only">Facebook</span>
              <i data-lucide="facebook" class="h-6 w-6"></i>
            </a>
            <a href="https://www.instagram.com" class="text-gray-500 hover:text-blue-400">
              <span class="sr-only">Instagram</span>
              <i data-lucide="instagram" class="h-6 w-6"></i>
            </a>
          </div>
        </div>
        
        <div>
          <h3 class="font-bold text-lg mb-4">Services</h3>
          <ul class="space-y-2">
            <li><a href="#" class="text-gray-400 hover:text-blue-400">Wash & Fold</a></li>
            <li><a href="#" class="text-gray-400 hover:text-blue-400">Dry Cleaning</a></li>
            <li><a href="#" class="text-gray-400 hover:text-blue-400">Ironing</a></li>
            <li><a href="#" class="text-gray-400 hover:text-blue-400">Subscription Plans</a></li>
            <li><a href="#" class="text-gray-400 hover:text-blue-400">Business Services</a></li>
          </ul>
        </div>
        
        <div>
          <h3 class="font-bold text-lg mb-4">Company</h3>
          <ul class="space-y-2">
            <li><a href="#" class="text-gray-400 hover:text-blue-400">About Us</a></li>
            <li><a href="#" class="text-gray-400 hover:text-blue-400">Careers</a></li>
            <li><a href="#" class="text-gray-400 hover:text-blue-400">Blog</a></li>
            <li><a href="#" class="text-gray-400 hover:text-blue-400">Press</a></li>
            <li><a href="#" class="text-gray-400 hover:text-blue-400">Partners</a></li>
          </ul>
        </div>
        
        <div>
          <h3 class="font-bold text-lg mb-4">Support</h3>
          <ul class="space-y-2">
            <li><a href="#" class="text-gray-400 hover:text-blue-400">Help Center</a></li>
            <li><a href="#" class="text-gray-400 hover:text-blue-400">Contact Us</a></li>
            <li><a href="#" class="text-gray-400 hover:text-blue-400">Privacy Policy</a></li>
            <li><a href="#" class="text-gray-400 hover:text-blue-400">Terms of Service</a></li>
            <li><a href="#" class="text-gray-400 hover:text-blue-400">FAQs</a></li>
          </ul>
        </div>
      </div>
      
      <div class="border-t border-gray-600 mt-12 pt-8 text-center text-gray-400">
        <p>&copy; 2025 LaundryDash. All rights reserved.</p>
      </div>
    </div>
  </footer>

  <script>
    // Initialize Lucide icons
    lucide.createIcons();
    
    // Mobile menu toggle
    const menuToggle = document.getElementById('menu-toggle');
    const mobileMenu = document.getElementById('mobile-menu');
    
    menuToggle.addEventListener('click', () => {
      mobileMenu.classList.toggle('hidden');
      // Toggle between menu and X icon
      const icon = menuToggle.querySelector('i');
      if (icon.getAttribute('data-lucide') === 'menu') {
        icon.setAttribute('data-lucide', 'x');
      } else {
        icon.setAttribute('data-lucide', 'menu');
      }
      lucide.createIcons();
    });
    
    // Profile dropdown functionality
    const profileButton = document.getElementById('profile-menu-button');
    const profileDropdown = document.getElementById('profile-dropdown');
    
    if (profileButton && profileDropdown) {
      profileButton.addEventListener('click', (e) => {
        e.stopPropagation();
        profileDropdown.classList.toggle('hidden');
      });
      
      // Close dropdown when clicking outside
      document.addEventListener('click', (event) => {
        if (profileDropdown && !profileButton.contains(event.target) && !profileDropdown.contains(event.target)) {
          profileDropdown.classList.add('hidden');
        }
      });
    }

    // Intersection Observer for scroll animations
    document.addEventListener('DOMContentLoaded', function() {
      const fadeElements = document.querySelectorAll('.fade-in-section');
      
      const observer = new IntersectionObserver((entries, observer) => {
        entries.forEach(entry => {
          if (entry.isIntersecting) {
            // Add a small delay for a staggered effect
            setTimeout(() => {
              // Remove the invisible class
              entry.target.classList.remove('invisible');
              // Add an animation class
              entry.target.classList.add('fade-in-active');
            }, 100);
            
            // Stop observing the element after it has faded in
            observer.unobserve(entry.target);
          }
        });
      }, {
        root: null, // Use the viewport as the root
        rootMargin: '0px', // No margin
        threshold: 0.1 // Trigger when at least 10% of the element is visible
      });
      
      // Start observing each fade element
      fadeElements.forEach(element => {
        observer.observe(element);
      });
    });
  </script>
</body>
</html>
