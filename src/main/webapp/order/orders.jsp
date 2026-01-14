<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="weight=device-width, initial-scale=1.0">
    <title>FreshPress - View Orders</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <script src="https://unpkg.com/lucide@latest"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/order/style.css">
</head>
<body class="font-sans bg-gray-900 text-gray-300">
<jsp:include page="/order/header.jsp"/>

<!-- Orders Table Section -->
<section class="bg-blue-900 py-20">
    <div class="container mx-auto px-4">
        <div class="text-center mb-16 invisible fade-in-section">
            <h2 class="text-3xl md:text-4xl font-bold mb-4">Your Orders</h2>
            <p class="text-xl text-gray-400 max-w-3xl mx-auto">
                View and manage all your laundry orders in one place.
            </p>
        </div>

        <div class="bg-gray-800 p-6 rounded-xl shadow-sm invisible fade-in-section">
            <div class="overflow-x-auto">
                <table class="w-full text-left">
                    <thead>
                    <tr class="border-b border-gray-600">
                        <th class="py-3 px-4 text-sm font-medium text-gray-300">Order ID</th>
                        <th class="py-3 px-4 text-sm font-medium text-gray-300">Service Type</th>
                        <th class="py-3 px-4 text-sm font-medium text-gray-300">Weight (Kg)</th>
                        <th class="py-3 px-4 text-sm font-medium text-gray-300">Total Cost (LKR)</th>
                        <th class="py-3 px-4 text-sm font-medium text-gray-300">Instructions</th>
                        <th class="py-3 px-4 text-sm font-medium text-gray-300">Your Name</th>
                        <th class="py-3 px-4 text-sm font-medium text-gray-300">Your Mobile</th>
                        <th class="py-3 px-4 text-sm font-medium text-gray-300">Order Dropping Date</th>
                        <th class="py-3 px-4 text-sm font-medium text-gray-300">Order Picking Date</th>
                        <th class="py-3 px-4 text-sm font-medium text-gray-300">Actions</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="order" items="${orders}">
                        <tr class="border-b border-gray-600 hover:bg-gray-700">
                            <td class="py-3 px-4 text-sm text-gray-300">${order.orderId}</td>
                            <td class="py-3 px-4 text-sm text-gray-300">${order.orderTypeName}</td>
                            <td class="py-3 px-4 text-sm text-gray-300">${order.weight}</td>
                            <td class="py-3 px-4 text-sm text-gray-300">
                                <fmt:formatNumber value="${order.price}" type="currency" currencySymbol="LKR "/>
                            </td>
                            <td class="py-3 px-4 text-sm text-gray-300">${order.instructions}</td>
                            <td class="py-3 px-4 text-sm text-gray-300">${order.name}</td>
                            <td class="py-3 px-4 text-sm text-gray-300">${order.mobile}</td>
                            <td class="py-3 px-4 text-sm text-gray-300"><fmt:formatDate value="${order.dropDate}"
                                                                                        pattern="MMM dd, yyyy"/></td>
                            <td class="py-3 px-4 text-sm text-gray-300"><fmt:formatDate value="${order.pickDate}"
                                                                                        pattern="MMM dd, yyyy"/></td>
                            <td class="py-3 px-4 text-sm text-gray-300">
                                <a href="updateOrder?orderId=${order.orderId}"
                                   class="ml-auto bg-blue-800 text-gray-300 px-4 py-2 rounded-lg font-medium hover:bg-blue-900 transition-colors">Edit</a>
                                <br><br>

                                <a href="deleteOrder?orderId=${order.orderId}"
                                   class="ml-auto bg-red-500 text-gray-300 px-4 py-2 rounded-lg font-medium hover:bg-red-900 transition-colors">Delete</a>

                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
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
            <p>&copy; 2023 FreshPress. All rights reserved.</p>
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
        const icon = menuToggle.querySelector('i');
        icon.setAttribute('data-lucide', icon.getAttribute('data-lucide') === 'menu' ? 'x' : 'menu');
        lucide.createIcons();
    });

    // Intersection Observer for scroll animations
    document.addEventListener('DOMContentLoaded', function () {
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
        fadeElements.forEach(element => observer.observe(element));
    });
</script>

<jsp:include page="/order/alert.jsp"/>
</body>
</html>