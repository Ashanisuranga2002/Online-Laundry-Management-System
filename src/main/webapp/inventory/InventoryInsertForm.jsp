<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Inventory</title>
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
        /* REMOVED SIDEBAR CSS */
        .content {
            margin-left: 0;
            padding: 20px;
            background-color: var(--dark-bg);
        }
        .section-title {
            margin: 30px 0 20px;
            font-weight: 600;
        }
        .inventory-table {
            background-color: var(--card-bg);
            border-radius: 15px;
            overflow: hidden;
            border: 1px solid var(--border-color);
            margin-top: 30px;
        }
        .table {
            color: var(--text-light);
            margin-bottom: 0;
        }
        .table th {
            border-bottom: 1px solid var(--border-color);
            font-weight: 500;
            color: var(--text-secondary);
            padding: 15px;
        }
        .table td {
            padding: 15px;
            border-bottom: 1px solid var(--border-color);
            vertical-align: middle;
        }
        .table tr:last-child td {
            border-bottom: none;
        }
        .btn-update {
            background-color: var(--success-green);
            color: white;
            border: none;
            border-radius: 4px;
            padding: 5px 12px;
            margin-right: 8px;
        }
        .btn-update:hover {
            background-color: #26b862;
            color: white;
        }
        .btn-delete {
            background-color: var(--danger-red);
            color: white;
            border: none;
            border-radius: 4px;
            padding: 5px 12px;
        }
        .btn-delete:hover {
            background-color: #d63c50;
            color: white;
        }
        .search-box {
            background-color: rgba(255, 255, 255, 0.05);
            border: 1px solid var(--border-color);
            border-radius: 50px;
            padding: 8px 15px;
            color: var(--text-light);
        }
        .search-box:focus {
            background-color: rgba(255, 255, 255, 0.1);
            color: var(--text-light);
            box-shadow: none;
            border-color: var(--accent-purple);
        }
        .search-box::placeholder {
            color: var(--text-secondary);
        }
        .pagination {
            margin-top: 20px;
        }
        .page-link {
            background-color: var(--card-bg);
            border-color: var(--border-color);
            color: var(--text-light);
            margin: 0 3px;
            border-radius: 5px;
        }
        .page-link:hover {
            background-color: var(--accent-purple);
            color: white;
            border-color: var(--accent-purple);
        }
        .page-item.active .page-link {
            background-color: var(--accent-purple);
            border-color: var(--accent-purple);
        }
        .dropdown-menu {
            background-color: var(--card-bg);
            border: 1px solid var(--border-color);
        }
        .dropdown-item {
            color: var(--text-light);
        }
        .dropdown-item:hover {
            background-color: rgba(255, 255, 255, 0.05);
            color: var(--text-light);
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
            width: 100%;
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
        .status-instock {
            color: var(--success-green);
            display: inline-flex;
            align-items: center;
            gap: 5px;
        }
        .status-lowstock {
            color: #ffc107;
            display: inline-flex;
            align-items: center;
            gap: 5px;
        }
        .status-outofstock {
            color: var(--danger-red);
            display: inline-flex;
            align-items: center;
            gap: 5px;
        }
        .badge-category {
            background-color: rgba(126, 63, 242, 0.1);
            color: var(--accent-purple);
            border-radius: 20px;
            padding: 5px 12px;
            font-size: 0.8rem;
        }
    </style>
</head>
<body>
    <!-- Main Content -->
    <div class="content">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h4>Add Inventory Items 📦</h4>
            <div class="search-container">
                <input type="text" class="form-control search-box" placeholder="Search">
            </div>
        </div>
        <!-- Add Inventory Form -->
        <div class="inventory-form-card">
            <h5 class="mb-4">Create New Inventory Item</h5>
            <form action="<%= request.getContextPath() %>/InventoryInsertServlet" method="post">
                <div class="row">
                    <div class="col-md-3">
                        <div class="inventory-image">
                            <div class="inventory-preview">
                                <i class="bi bi-box-seam"></i>
                            </div>
                            <div class="inventory-edit">
                                <input type="file" id="inventoryImageUpload" accept=".png, .jpg, .jpeg" />
                                <label for="inventoryImageUpload"><i class="bi bi-camera"></i></label>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-9">
                        <div class="row mb-3">
                            <div class="col-md-6">
                                <label for="inventoryid" class="form-label">Inventory ID</label>
                                <input type="text" class="form-control" id="inventoryid" name="inventoryid" placeholder="Enter inventory ID">
                            </div>
                            <div class="col-md-6">
                                <label for="invantoryName" class="form-label">Inventory Name</label>
                                <input type="text" class="form-control" id="invantoryName" name="invantoryName" placeholder="Enter inventory name">
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-md-12">
                                <label for="invantoryDescription" class="form-label">Inventory Description</label>
                                <textarea class="form-control" id="invantoryDescription" name="invantoryDescription" placeholder="Enter inventory description" rows="2"></textarea>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row mb-3 mt-3">
                    <div class="col-md-4">
                        <label for="quantityAvailable" class="form-label">Quantity Available</label>
                        <input type="number" class="form-control" id="quantityAvailable" name="quantityAvailable" placeholder="Enter quantity" min="0">
                    </div>
                    <div class="col-md-4">
                        <label for="category" class="form-label">Category</label>
                        <select class="form-select" id="category" name="category">
                            <option selected>Select category</option>
                            <option value="electronics">Electronics</option>
                            <option value="furniture">Furniture</option>
                            <option value="clothing">Clothing</option>
                            <option value="books">Books</option>
                            <option value="food">Food & Beverage</option>
                        </select>
                    </div>
                    <div class="col-md-4">
                        <label for="stockstatus" class="form-label">Stock Status</label>
                        <select class="form-select" id="stockstatus" name="stockstatus">
                            <option selected>Select status</option>
                            <option value="instock">In Stock</option>
                            <option value="lowstock">Low Stock</option>
                            <option value="outofstock">Out of Stock</option>
                        </select>
                    </div>
                </div>
                <div class="row mb-3">
                    <div class="col-md-6">
                        <label for="suppliername" class="form-label">Supplier Name</label>
                        <input type="text" class="form-control" id="suppliername" name="suppliername" placeholder="Enter supplier name">
                    </div>
                    <div class="col-md-6">
                        <label for="lastRestockdate" class="form-label">Last Restocked Date</label>
                        <input type="date" class="form-control" id="lastRestockdate" name="lastRestockdate">
                    </div>
                </div>
                <div class="row mb-3">
                    <div class="col-md-6">
                        <label for="unitprice" class="form-label">Unit Price</label>
                        <input type="number" class="form-control" id="unitprice" name="unitprice" placeholder="Enter unit price" step="0.01" min="0">
                    </div>
                    <div class="col-md-6">
                        <label for="storagelocation" class="form-label">Storage Location</label>
                        <input type="text" class="form-control" id="storagelocation" name="storagelocation" placeholder="Enter storage location">
                    </div>
                </div>
                <div class="d-flex justify-content-end mt-4">
                    <a href="<%=request.getContextPath() %>/InventoryGetAllServlet" class="btn btn-white me-2">
                        <i class="bi bi-arrow-left"></i> Cancel 
                    </a>
                    <button type="submit" class="btn btn-submit" style="width: auto;">Add Inventory</button>
                </div>
            </form>
        </div>
        <!-- Inventory Table and Pagination (if needed) can go here -->
    </div>
    <!-- Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Custom JavaScript -->
    <script>
        // Preview uploaded inventory image
        document.getElementById('inventoryImageUpload').addEventListener('change', function(e) {
            const preview = document.querySelector('.inventory-preview');
            const file = e.target.files[0];
            const reader = new FileReader();
            reader.onload = function() {
                // Remove icon if exists
                if (preview.querySelector('i')) {
                    preview.querySelector('i').remove();
                }
                // Check if img already exists
                let img = preview.querySelector('img');
                if (!img) {
                    img = document.createElement('img');
                    preview.appendChild(img);
                }
                img.src = reader.result;
            }
            if (file) {
                reader.readAsDataURL(file);
            }
        });
    </script>
</body>
</html>
