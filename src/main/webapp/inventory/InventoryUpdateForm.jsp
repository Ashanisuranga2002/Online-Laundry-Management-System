<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Inventory</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
    <style>
        :root {
            --dark-bg: #0c0c0d;
            --darker-bg: #050505;
            --dark-content: #1a1a1a;
            --accent-purple: #7e3ff2;
            --text-light: #f8f9fa;
            --text-secondary: #adb5bd;
            --border-color: #2a2a2a;
            --success-green: #2dd36f;
            --danger-red: #eb445a;
            --card-bg: #21212a;
        }

        body {
            background-color: var(--dark-bg);
            color: var(--text-light);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        .content {
            padding: 20px;
            background-color: var(--dark-bg);
            width: 100%;
        }
        
        .header {
            padding: 15px 20px;
            display: flex;
            align-items: center;
            gap: 10px;
            font-weight: bold;
            font-size: 1.5rem;
            border-bottom: 1px solid var(--border-color);
            background-color: var(--card-bg);
            margin-bottom: 20px;
        }
        
        .inventory-form-card {
            background-color: var(--card-bg);
            border-radius: 15px;
            padding: 25px;
            border: 1px solid var(--border-color);
        }
        
        .form-label {
            color: var(--text-secondary);
            font-weight: 500;
            margin-bottom: 8px;
        }
        
        .form-control {
            background-color: rgba(255, 255, 255, 0.05);
            border: 1px solid var(--border-color);
            color: var(--text-light);
            border-radius: 8px;
            padding: 10px 15px;
        }
        
        .form-control:focus {
            background-color: rgba(255, 255, 255, 0.1);
            color: var(--text-light);
            box-shadow: none;
            border-color: var(--accent-purple);
        }
        
        .form-control::placeholder {
            color: var(--text-secondary);
            opacity: 0.7;
        }
        
        .form-select {
            background-color: rgba(255, 255, 255, 0.05);
            border: 1px solid var(--border-color);
            color: var(--text-light);
            border-radius: 8px;
            padding: 10px 15px;
        }
        
        .form-select:focus {
            background-color: rgba(255, 255, 255, 0.1);
            color: var(--text-light);
            box-shadow: none;
            border-color: var(--accent-purple);
        }
        
        .btn-submit {
            background-color: var(--accent-purple);
            color: white;
            border: none;
            border-radius: 8px;
            padding: 12px 25px;
            font-weight: 500;
            width: auto;
            margin-top: 10px;
        }
        
        .btn-submit:hover {
            background-color: #6a34d1;
            color: white;
        }
        
        .btn-white {
            background-color: white;
            color: var(--dark-bg);
            border: none;
            border-radius: 4px;
            padding: 8px 16px;
            font-weight: 500;
            display: flex;
            align-items: center;
            gap: 5px;
        }
        
        .btn-white:hover {
            background-color: #f0f0f0;
        }
        
        .inventory-image {
            position: relative;
            width: 120px;
            height: 120px;
            margin: 0 auto 20px;
        }
        
        .inventory-preview {
            width: 120px;
            height: 120px;
            border-radius: 8px;
            background-color: rgba(255, 255, 255, 0.05);
            border: 2px solid var(--border-color);
            display: flex;
            align-items: center;
            justify-content: center;
            overflow: hidden;
        }
        
        .inventory-preview img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
        
        .inventory-preview i {
            font-size: 3rem;
            color: var(--text-secondary);
        }
        
        .inventory-edit {
            position: absolute;
            right: 0;
            bottom: 0;
        }
        
        .inventory-edit input {
            display: none;
        }
        
        .inventory-edit label {
            background-color: var(--accent-purple);
            width: 34px;
            height: 34px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            color: white;
            font-size: 1rem;
            border: 2px solid var(--card-bg);
        }
        
        .user-profile {
            display: flex;
            align-items: center;
            gap: 10px;
            margin-left: auto;
        }
        
        .profile-pic {
            width: 40px;
            height: 40px;
            border-radius: 50%;
        }
        
        .profile-name {
            font-weight: 500;
        }
        
        .profile-role {
            font-size: 0.8rem;
            color: var(--text-secondary);
        }
        
        /* Toast notification for success/error messages */
        .toast-container {
            position: fixed;
            top: 20px;
            right: 20px;
            z-index: 1060;
        }
        
        .toast {
            background-color: var(--card-bg);
            border: 1px solid var(--border-color);
            color: var(--text-light);
        }
        
        .toast-header {
            background-color: rgba(255, 255, 255, 0.05);
            color: var(--text-light);
            border-bottom: 1px solid var(--border-color);
        }
        
        .toast-success {
            border-left: 4px solid var(--success-green);
        }
    </style>
</head>
<body>
    <!-- Header Section -->
    <div class="header">
        <i class="bi bi-hexagon-fill"></i>
        Dashboard <span class="text-secondary ms-1">v.01</span>
        
        <!-- User Profile in Header -->
        <div class="user-profile">
            <img src="https://via.placeholder.com/40" class="profile-pic" alt="Profile">
            <div>
                <div class="profile-name">Good day!</div>
                <div class="profile-role">Project Manager</div>
            </div>
            <i class="bi bi-chevron-down ms-2"></i>
        </div>
    </div>

    <!-- Main Content -->
    <div class="content">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h4>Update Inventory Item</h4>
            <a href="InventoryServlet" class="btn btn-white">
                <i class="bi bi-arrow-left"></i> Back to List
            </a>
        </div>
        
        <!-- Update Inventory Form with server side data binding -->
        <div class="inventory-form-card">
            <h5 class="mb-4">Update Inventory Details</h5>
            <form action="InventoryUpdateServlet" method="post" >
                <div class="row">
                    <div class="col-md-3">
                        <div class="inventory-image">
                            <div class="inventory-preview" id="inventoryPreview">
                                <!-- If inventory has image, display it here -->
                                <i class="bi bi-box-seam"></i>
                            </div>
                            <div class="inventory-edit">
                                <input type="file" id="inventoryImageUpload" name="inventoryImage" accept=".png, .jpg, .jpeg" />
                                <label for="inventoryImageUpload"><i class="bi bi-camera"></i></label>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-9">
                        <div class="row mb-3">
                            <div class="col-md-6">
                                <label for="inventoryId" class="form-label">Inventory ID</label>
                                <input type="text" class="form-control" id="inventoryId" name="inventoryid" 
                                       value="${inventoryItem.inventoryId}" readonly>
                            </div>
                            <div class="col-md-6">
                                <label for="inventoryName" class="form-label">Inventory Name</label>
                                <input type="text" class="form-control" id="inventoryName" name="invantoryName"
                                       value="${inventoryItem.invantoryName}" required>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-md-12">
                                <label for="inventoryDescription" class="form-label">Inventory Description</label>
                                <textarea class="form-control" id="inventoryDescription" name="invantoryDescription" 
                                          rows="2">${inventoryItem.invantoryDescription}</textarea>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="row mb-3 mt-3">
                    <div class="col-md-4">
                        <label for="quantityAvailable" class="form-label">Quantity Available</label>
                        <input type="number" class="form-control" id="quantityAvailable" name="quantityAvailable"
                               value="${inventoryItem.quantityAvailable}" min="0" required>
                    </div>
                    <div class="col-md-4">
                        <label for="category" class="form-label">Category</label>
                        <select class="form-select" id="category" name="category" required>
                            <option value="electronics" ${inventoryItem.category == 'electronics' ? 'selected' : ''}>Electronics</option>
                            <option value="furniture" ${inventoryItem.category == 'furniture' ? 'selected' : ''}>Furniture</option>
                            <option value="clothing" ${inventoryItem.category == 'clothing' ? 'selected' : ''}>Clothing</option>
                            <option value="books" ${inventoryItem.category == 'books' ? 'selected' : ''}>Books</option>
                            <option value="food" ${inventoryItem.category == 'food' ? 'selected' : ''}>Food & Beverage</option>
                        </select>
                    </div>
                    <div class="col-md-4">
                        <label for="stockStatus" class="form-label">Stock Status</label>
                        <select class="form-select" id="stockStatus" name="stockstatus" required>
                            <option value="instock" ${inventoryItem.stockstatus == 'instock' ? 'selected' : ''}>In Stock</option>
                            <option value="lowstock" ${inventoryItem.stockstatus == 'lowstock' ? 'selected' : ''}>Low Stock</option>
                            <option value="outofstock" ${inventoryItem.stockstatus == 'outofstock' ? 'selected' : ''}>Out of Stock</option>
                        </select>
                    </div>
                </div>
                
                <div class="row mb-3">
                    <div class="col-md-6">
                        <label for="supplierName" class="form-label">Supplier Name</label>
                        <input type="text" class="form-control" id="supplierName" name="suppliername"
                               value="${inventoryItem.supplierName}">
                    </div>
                    <div class="col-md-6">
                        <label for="lastRestockedDate" class="form-label">Last Restocked Date</label>
                        <input type="date" class="form-control" id="lastRestockedDate" name="lastRestockdate"
                               value="${inventoryItem.lastRestockDate}">
                    </div>
                </div>
                
                <div class="row mb-3">
                    <div class="col-md-6">
                        <label for="unitPrice" class="form-label">Unit Price</label>
                        <input type="number" class="form-control" id="unitPrice" name="unitprice" step="0.01" min="0"
                               value="${inventoryItem.unitPrice}" required>
                    </div>
                    <div class="col-md-6">
                        <label for="location" class="form-label">Storage Location</label>
                        <input type="text" class="form-control" id="location" name="storagelocation"
                               value="${inventoryItem.storageLocation}">
                    </div>
                </div>
                
                <div class="d-flex justify-content-end mt-4">
                    <a href="<%=request.getContextPath() %>/InventoryGetAllServlet" class="btn btn-white me-2">Cancel</a>
                    <button type="submit" class="btn btn-submit">Update Inventory</button>
                </div>
            </form>
        </div>
    </div>

    <!-- Toast for notifications -->
    <div class="toast-container">
        <div class="toast toast-success" role="alert" aria-live="assertive" aria-atomic="true" id="updateSuccessToast" data-bs-delay="3000">
            <div class="toast-header">
                <strong class="me-auto"><i class="bi bi-check-circle-fill text-success"></i> Success</strong>
                <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
            </div>
            <div class="toast-body">
                Inventory item updated successfully!
            </div>
        </div>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    
    <!-- Custom JavaScript for form functionality -->
    <script>
        // Image preview functionality
        const imageUpload = document.getElementById('inventoryImageUpload');
        const previewContainer = document.getElementById('inventoryPreview');
        
        imageUpload.addEventListener('change', function() {
            const file = this.files[0];
            if (file) {
                const reader = new FileReader();
                
                previewContainer.innerHTML = '';
                
                reader.onload = function(e) {
                    const img = document.createElement('img');
                    img.src = e.target.result;
                    previewContainer.appendChild(img);
                }
                
                reader.readAsDataURL(file);
            }
        });

        // Show toast notification if URL parameter indicates success
        document.addEventListener('DOMContentLoaded', function() {
            const urlParams = new URLSearchParams(window.location.search);
            if (urlParams.get('success') === 'true') {
                const toast = new bootstrap.Toast(document.getElementById('updateSuccessToast'));
                toast.show();
            }
        });
        
        // Form validation
        const form = document.querySelector('form');
        form.addEventListener('submit', function(event) {
            if (!form.checkValidity()) {
                event.preventDefault();
                event.stopPropagation();
            }
            form.classList.add('was-validated');
        });
    </script>
</body>
</html>