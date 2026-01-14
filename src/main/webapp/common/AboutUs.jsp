<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>About Us - LaundryDash Laundry Service</title>
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
      background-color: #1a202c;
      color: #e2e8f0;
    }

    header {
      background-color: #2d3748;
      box-shadow: 0 1px 3px rgba(0,0,0,0.7);
    }

    a {
      color: #63b3ed;
    }
    a:hover {
      color: #4299e1;
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
          <a href="<%=request.getContextPath()%>/common/HowItWorks.jsp" class="font-medium hover:text-blue-400 transition-colors">How It Works</a>
          <a href="#" class="font-medium hover:text-blue-400 transition-colors">Services</a>
          <a href="#" class="font-medium hover:text-blue-400 transition-colors">About Us</a>
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
                    <img src="<%=request.getContextPath()%>/img/homepage_avatar.jpg" alt="Profile" class="w-full h-full object-cover">
                  </div>
                </button>
                
                <!-- Profile dropdown menu -->
                <div id="profile-dropdown" class="hidden absolute right-0 mt-2 w-48 bg-gray-800 rounded-md shadow-lg py-1 z-50">
                  <a href="<%=request.getContextPath()%>/ProfileServlet" class="block px-4 py-2 text-sm text-gray-300 hover:bg-gray-700">Your Profile</a>
                  
                  <!-- Role-specific dashboard links -->
                  <c:choose>
                    <c:when test="${sessionScope.isAdmin}">
                      <a href="<%=request.getContextPath()%>/CustomerGetAllServlet" class="block px-4 py-2 text-sm text-gray-300 hover:bg-gray-700">Admin Dashboard</a>
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
          <a href="<%=request.getContextPath()%>/common/HowItWorks.jsp" class="font-medium hover:text-blue-400 transition-colors">How It Works</a>
          <a href="#" class="font-medium hover:text-blue-400 transition-colors">Services</a>
          <a href="#" class="font-medium hover:text-blue-400 transition-colors">About Us</a>
          
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
      <div class="text-center max-w-4xl mx-auto animate-fade-in">
        <h1 class="text-4xl md:text-5xl font-bold mb-6">
          About <span class="text-blue-400">LaundryDash</span>
        </h1>
        <p class="text-xl text-gray-400 mb-8">
          Making laundry day a thing of the past since 2025
        </p>
      </div>
    </div>
  </section>

  <!-- About Section -->
  <section class="py-16">
    <div class="container mx-auto px-4">
      <div class="grid md:grid-cols-2 gap-12 items-center">
        <div class="invisible fade-in-section">
          <div class="bg-gray-800 p-6 rounded-xl shadow-lg">
            <img src="<%=request.getContextPath()%>/img/team.jpg" alt="FreshPress Team" class="rounded-lg w-full">
          </div>
        </div>
        <div class="invisible fade-in-section">
          <h2 class="text-3xl font-bold mb-6">Our Story</h2>
          <p class="text-gray-400 mb-4">
            Founded in 2025, LaundryDash began with a simple mission: to give people back their time by eliminating laundry day from their busy lives.
          </p>
          <p class="text-gray-400 mb-4">
            What started as a small operation has grown into a service that helps thousands of customers across multiple cities.
          </p>
          <p class="text-gray-400">
            Today, we continue to innovate and expand, always focused on providing convenient, high-quality laundry services with a commitment to sustainability.
          </p>
        </div>
      </div>
    </div>
  </section>

  <!-- Values Section -->
  <section class="py-16 bg-blue-900">
    <div class="container mx-auto px-4">
      <div class="text-center mb-12 invisible fade-in-section">
        <h2 class="text-3xl font-bold mb-4">Our Values</h2>
      </div>

      <div class="grid md:grid-cols-3 gap-8">
        <div class="bg-gray-800 p-6 rounded-xl shadow-sm invisible fade-in-section">
          <div class="bg-blue-800 p-3 rounded-full w-12 h-12 flex items-center justify-center mb-4">
            <i data-lucide="clock" class="h-6 w-6 text-blue-400"></i>
          </div>
          <h3 class="font-bold text-xl mb-2">Time is Precious</h3>
          <p class="text-gray-400">
            We believe your time should be spent on what matters most to you.
          </p>
        </div>

        <div class="bg-gray-800 p-6 rounded-xl shadow-sm invisible fade-in-section">
          <div class="bg-blue-800 p-3 rounded-full w-12 h-12 flex items-center justify-center mb-4">
            <i data-lucide="leaf" class="h-6 w-6 text-blue-400"></i>
          </div>
          <h3 class="font-bold text-xl mb-2">Sustainability</h3>
          <p class="text-gray-400">
            We're committed to environmentally responsible practices.
          </p>
        </div>

        <div class="bg-gray-800 p-6 rounded-xl shadow-sm invisible fade-in-section">
          <div class="bg-blue-800 p-3 rounded-full w-12 h-12 flex items-center justify-center mb-4">
            <i data-lucide="star" class="h-6 w-6 text-blue-400"></i>
          </div>
          <h3 class="font-bold text-xl mb-2">Quality First</h3>
          <p class="text-gray-400">
            We never compromise on the quality of our service.
          </p>
        </div>
      </div>
    </div>
  </section>

  <!-- Team Section -->
  <section class="py-16">
    <div class="container mx-auto px-4">
      <div class="text-center mb-12 invisible fade-in-section">
        <h2 class="text-3xl font-bold mb-4">Our Leadership</h2>
      </div>

      <div class="grid md:grid-cols-3 gap-8">
        <!-- Team Member 1 -->
        <div class="bg-gray-800 rounded-xl overflow-hidden shadow-md invisible fade-in-section">
          <img src="<%=request.getContextPath()%>/img/sarah chen.jpg" alt="Sarah Chen" class="w-full h-64 object-cover">
          <div class="p-6">
            <h3 class="text-xl font-bold mb-1">Sarah Chen</h3>
            <p class="text-blue-400">Co-Founder & CEO</p>
          </div>
        </div>

        <!-- Team Member 2 -->
        <div class="bg-gray-800 rounded-xl overflow-hidden shadow-md invisible fade-in-section">
          <img src="<%=request.getContextPath()%>/img/pexels-sebastian-luna-736234668-31610834.jpg" alt="Michael Rodriguez" class="w-full h-64 object-cover">
          <div class="p-6">
            <h3 class="text-xl font-bold mb-1">Michael Rodriguez</h3>
            <p class="text-blue-400">Co-Founder & CTO</p>
          </div>
        </div>

        <!-- Team Member 3 -->
        <div class="bg-gray-800 rounded-xl overflow-hidden shadow-md invisible fade-in-section">
          <img src="<%=request.getContextPath()%>/img/pexels-heitorverdifotos-2169434.jpg" alt="Jessica Taylor" class="w-full h-64 object-cover">
          <div class="p-6">
            <h3 class="text-xl font-bold mb-1">Jessica Taylor</h3>
            <p class="text-blue-400">Chief Operations Officer</p>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- CTA Section -->
  <section class="py-16">
    <div class="container mx-auto px-4">
      <div class="bg-blue-800 rounded-2xl p-8 text-gray-300 invisible fade-in-section">
        <div class="max-w-3xl mx-auto text-center">
          <h2 class="text-3xl font-bold mb-6">Ready to experience laundry freedom?</h2>
          <div class="flex flex-wrap justify-center gap-4">
            <a href="<%=request.getContextPath()%>/common/Registration.jsp" class="px-8 py-3 bg-gray-900 text-blue-400 font-bold rounded-lg hover:bg-gray-800 transition-colors">
              Get Started Now
            </a>
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
            setTimeout(() => {
              entry.target.classList.remove('invisible');
              entry.target.classList.add('fade-in-active');
            }, 100);
            observer.unobserve(entry.target);
          }
        });
      }, {
        root: null,
        rootMargin: '0px',
        threshold: 0.1
      });
      
      fadeElements.forEach(element => {
        observer.observe(element);
      });
    });
  </script>
</body>
</html>
