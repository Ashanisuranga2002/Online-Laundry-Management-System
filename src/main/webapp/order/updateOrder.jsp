<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FreshPress - Add Order</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <script src="https://unpkg.com/lucide@latest"></script>
    <link rel="stylesheet" href="style.css">
</head>
<body class="font-sans bg-gray-900 text-gray-300">

<jsp:include page="/order/header.jsp"/>

<!-- Order Form Section -->
<section class="bg-blue-900 py-20">
    <div class="container mx-auto px-4">
        <div class="text-center mb-16 invisible fade-in-section">
            <h2 class="text-3xl md:text-4xl font-bold mb-4">Place Your Order</h2>
            <p class="text-xl text-gray-400 max-w-3xl mx-auto">
                Simplify your laundry with our easy-to-use order form.
            </p>
        </div>

        <div class="bg-gray-800 p-8 rounded-xl shadow-sm max-w-2xl mx-auto invisible fade-in-section">
            <form action="updateOrder" method="POST" class="space-y-6">
                <!-- Service Type -->
                <div>
                    <label for="serviceId" class="block text-sm font-medium text-gray-300">Service Type</label>
                    <input type="hidden" name="orderId" value="${order.orderId}">
                    <select id="serviceId" name="serviceId" required
                            class="mt-1 block w-full bg-gray-700 border border-gray-600 rounded-lg py-2 px-3 text-gray-300 focus:outline-none focus:ring-2 focus:ring-blue-400">
                        <c:forEach var="service" items="${services}">
                            <option ${order.orderType == service.service_id ? 'selected' : ''}
                                    value="${service.service_id}">
                                ${service.service_name} (LKR ${service.price} per 2 Kgs)
                            </option>
                        </c:forEach>
                    </select>
                </div>

                <!-- Weight -->
                <div>
                    <label for="weight" class="block text-sm font-medium text-gray-300">Weight (Kg)</label>
                    <input type="number" id="weight" name="weight" step="0.1" min="0.1" required
                           class="mt-1 block w-full bg-gray-700 border border-gray-600 rounded-lg py-2 px-3 text-gray-300 focus:outline-none focus:ring-2 focus:ring-blue-400"
                           placeholder="Enter weight in kilograms" value="${order.weight}">
                </div>

                <!-- Additional Instructions -->
                <div>
                    <label for="instructions" class="block text-sm font-medium text-gray-300">Additional Instructions</label>
                    <textarea id="instructions" name="instructions" rows="4" maxlength="255"
                              class="mt-1 block w-full bg-gray-700 border border-gray-600 rounded-lg py-2 px-3 text-gray-300 focus:outline-none focus:ring-2 focus:ring-blue-400"
                              placeholder="Any special instructions for your order?">${order.instructions}</textarea>
                </div>

                <!-- Name -->
                <div>
                    <label for="name" class="block text-sm font-medium text-gray-300">Your Name</label>
                    <input type="text" id="name" name="name" required maxlength="50" pattern="[A-Za-z ]{2,50}"
                           title="Enter a valid name using letters only"
                           class="mt-1 block w-full bg-gray-700 border border-gray-600 rounded-lg py-2 px-3 text-gray-300 focus:outline-none focus:ring-2 focus:ring-blue-400"
                           placeholder="Enter Your Name" value="${order.name}">
                </div>

                <!-- Mobile -->
                <div>
                    <label for="mobile" class="block text-sm font-medium text-gray-300">Your Mobile Number</label>
                    <input type="tel" id="mobile" name="mobile" required pattern="[0-9]{10}" maxlength="10"
                           title="Enter a 10-digit mobile number"
                           class="mt-1 block w-full bg-gray-700 border border-gray-600 rounded-lg py-2 px-3 text-gray-300 focus:outline-none focus:ring-2 focus:ring-blue-400"
                           placeholder="Enter Your Mobile Number" value="${order.mobile}">
                </div>

                <!-- Drop Date -->
                <div>
                    <label for="dropDate" class="block text-sm font-medium text-gray-300">Order Dropping Date</label>
                    <input type="date" id="dropDate" name="dropDate" required
                           class="mt-1 block w-full bg-gray-700 border border-gray-600 rounded-lg py-2 px-3 text-gray-300 focus:outline-none focus:ring-2 focus:ring-blue-400"
                           value="${order.dropDate}">
                </div>

                <!-- Pick Date -->
                <div>
                    <label for="pickDate" class="block text-sm font-medium text-gray-300">Order Picking Date</label>
                    <input type="date" id="pickDate" name="pickDate" required
                           class="mt-1 block w-full bg-gray-700 border border-gray-600 rounded-lg py-2 px-3 text-gray-300 focus:outline-none focus:ring-2 focus:ring-blue-400"
                           value="${order.pickDate}">
                </div>

                <!-- Submit Button -->
                <div class="text-center">
                    <button type="submit"
                            class="bg-blue-800 text-gray-300 px-6 py-3 rounded-lg font-medium hover:bg-blue-900 transition-colors">
                        Update Order
                    </button>
                </div>
            </form>
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

    const menuToggle = document.getElementById('menu-toggle');
    const mobileMenu = document.getElementById('mobile-menu');

    menuToggle?.addEventListener('click', () => {
        mobileMenu?.classList.toggle('hidden');
        const icon = menuToggle.querySelector('i');
        icon.setAttribute('data-lucide', icon.getAttribute('data-lucide') === 'menu' ? 'x' : 'menu');
        lucide.createIcons();
    });

    // Intersection Observer for animations
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
