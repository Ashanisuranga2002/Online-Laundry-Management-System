<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LaundryDash - Laundry Service</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <script src="https://unpkg.com/lucide@latest"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/order/style.css">
</head>
<body class="font-sans bg-gray-900 text-gray-300">

<jsp:include page="/order/header.jsp"/>

<!-- Ordering Section -->
<section class="bg-blue-900 py-20">
    <div class="container mx-auto px-4">
        <div class="text-center mb-16 invisible fade-in-section">
            <h2 class="text-3xl md:text-4xl font-bold mb-4">Add Your Order</h2>
            <p class="text-xl text-gray-400 max-w-3xl mx-auto">
                Join thousands of satisfied customers who have simplified their laundry routine
            </p>
        </div>

        <div class="grid md:grid-cols-2 lg:grid-cols-3 gap-8">

            <c:forEach var="service" items="${services}">
                <div class="bg-gray-800 p-6 rounded-xl shadow-sm invisible fade-in-section">
                    <h2 class="text-2xl font-bold mb-4">${service.service_name}</h2>

                    <p class="text-gray-300 mb-6">
                            ${service.description}
                    </p>
                    <div class="flex items-center">

                        <span class="text-2xl font-bold text-blue-400">LKR ${service.price}</span>
                        <span class="text-gray-400 ml-2">per 2 Kgs</span>

                        <a href="createOrder?orderType=${service.service_id}"
                           class="ml-auto bg-blue-800 text-gray-300 px-4 py-2 rounded-lg font-medium hover:bg-blue-900 transition-colors">
                            Order Now
                        </a>
                    </div>
                </div>
            </c:forEach>

        </div>
    </div>
</section>


<!-- Footer -->
<footer class="bg-gray-900 border-t border-gray-600 py-12">
    <div class="container mx-auto px-4">
        <div class="grid md:grid-cols-2 lg:grid-cols-4 gap-8">
            <div>
                <h3 class="font-bold text-lg mb-4">FreshPress</h3>
                <p class="text-gray-400 mb-4">
                    Making laundry day a thing of the past since 2020.
                </p>
                <div class="flex space-x-4">
                    <a href="#" class="text-gray-500 hover:text-blue-400">
                        <span class="sr-only">Twitter</span>
                        <i data-lucide="twitter" class="h-6 w-6"></i>
                    </a>
                    <a href="#" class="text-gray-500 hover:text-blue-400">
                        <span class="sr-only">Facebook</span>
                        <i data-lucide="facebook" class="h-6 w-6"></i>
                    </a>
                    <a href="#" class="text-gray-500 hover:text-blue-400">
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
    document.addEventListener('DOMContentLoaded', function () {
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

<jsp:include page="/order/alert.jsp"/>
</body>
</html>
